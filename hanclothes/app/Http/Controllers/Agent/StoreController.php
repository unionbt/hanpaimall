<?php

namespace App\Http\Controllers\Agent;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Agent\BaseController;

use App\Store;
use App\StoreAudit;
use Addons\Core\Controllers\AdminTrait;

class StoreController extends BaseController
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$store = new Store;
		$builder = $store->newQuery()->with('user')->join('agent_store', 'agent_store.sid', '=', 'stores.id')->where('aid', '=', $this->agent->getKey())->groupBy('stores.id');
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.agent-backend.'.$store->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['stores.*'], ['base' => $base]) : [];
		foreach($this->_table_data as $v)
		{
			$v['brands_count'] = $v->brands()->whereIn('brands.id', $this->agent->brand_ids())->count();
		}
		return $this->view('agent-backend.store.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$store = new Store;
		$brand_ids = $this->agent->brand_ids();
		$builder = $store->newQuery()->with(['brands','user'])->join('agent_store', 'agent_store.sid', '=', 'stores.id')->where('aid', '=', $this->agent->getKey())->groupBy('stores.id');
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder, function(&$v, $k){
			$v['brands-count'] = $v->brands()->whereIn('brands.id', $this->agent->brand_ids())->count();
		}, ['stores.*']);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$store = new Store;
		$builder = $store->newQuery()->join('agent_store', 'agent_store.aid', '=', 'stores.id')->where('aid', '=', $this->agent->getKey())->groupBy('stores.id');
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $store->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('agent-backend.store.export');
		}

		$data = $this->_getExport($request, $builder, null, 'stores.*');
		return $this->success('', FALSE, $data);
	}

	public function show($id)
	{
		return '';
	}

	public function edit($id)
	{
		$store = Store::find($id);
		if (empty($store))
			return $this->failure_noexists();

		$store['brand_ids'] = $store->brands()->whereIn('brands.id', $this->agent->brand_ids())->get(['brands.id'])->pluck('id');
		$store['user'] = $store->user;

		$keys = 'brand_ids';
		$this->_validates = $this->getScriptValidate('store.store', $keys);
		$this->_data = $store;
		return $this->view('agent-backend.store.edit');
	}

	public function update(Request $request, $id)
	{
		$store = Store::find($id);
		if (empty($store))
			return $this->failure_noexists();

		if (!in_array($this->agent->getKey(), $store->agent_ids()->toArray()))
			return $this->failure_owner();

		$keys = 'brand_ids';
		$data = $this->autoValidate($request, 'store.store', $keys, $store);
		$brand_ids = array_pull($data, 'brand_ids');

		$store->brands()->detach($this->agent->brand_ids()->toArray());
		$store->brands()->sync($brand_ids, false);
		
		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v)
		{
			$store = Store::find($v);
			//删除代理商关联
			$store->agent()->detach($this->agent->getKey());
			//删除品牌关联
			$store->brands()->detach($this->agent->brand_ids()->toArray());
		}
		return $this->success('', count($id) > 5, compact('id'));
	}
}
