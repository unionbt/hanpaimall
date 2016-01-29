<?php

namespace App\Http\Controllers\Factory;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Factory\BaseController;

use App\Agent;
use App\AgentAudit;
use Addons\Core\Controllers\AdminTrait;

class AgentController extends BaseController
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$agent = new Agent;
		$builder = $agent->newQuery()->with('user')->join('factory_agent', 'factory_agent.aid', '=', 'agents.id')->where('fid', '=', $this->factory->getKey());
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.factory-backend.'.$agent->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['agents.*'], ['base' => $base]) : [];
		foreach($this->_table_data as $v)
		{
			$v['brands_count'] = $v->brands()->whereIn('brands.id', $this->factory->brand_ids())->count();
		}
		return $this->view('factory-backend.agent.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$agent = new Agent;
		$brand_ids = $this->factory->brand_ids();
		$builder = $agent->newQuery()->with(['brands','user'])->join('factory_agent', 'factory_agent.aid', '=', 'agents.id')->where('fid', '=', $this->factory->getKey());
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder, function(&$v, $k){
			$v['brands-count'] = $v->brands()->whereIn('brands.id', $this->factory->brand_ids())->count();
		}, ['agents.*']);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$agent = new Agent;
		$builder = $agent->newQuery()->join('factory_agent', 'factory_agent.aid', '=', 'agents.id')->where('fid', '=', $this->factory->getKey());
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $agent->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('factory-backend.agent.export');
		}

		$data = $this->_getExport($request, $builder, null, 'agents.*');
		return $this->success('', FALSE, $data);
	}

	public function show($id)
	{
		return '';
	}

	public function edit($id)
	{
		$agent = Agent::find($id);
		if (empty($agent))
			return $this->failure_noexists();

		$agent['brand_ids'] = $agent->brands()->whereIn('brands.id', $this->factory->brand_ids())->get(['brands.id'])->pluck('id');
		$agent['user'] = $agent->user;

		$keys = 'brand_ids';
		$this->_validates = $this->getScriptValidate('agent.store', $keys);
		$this->_data = $agent;
		return $this->view('factory-backend.agent.edit');
	}

	public function update(Request $request, $id)
	{
		$agent = Agent::find($id);
		if (empty($agent))
			return $this->failure_noexists();

		if (!in_array($this->factory->getKey(), $agent->factory_ids()->toArray()))
			return $this->failure_owner();

		$keys = 'brand_ids';
		$data = $this->autoValidate($request, 'agent.store', $keys, $agent);
		$brand_ids = array_pull($data, 'brand_ids');
		$factory_brand_ids = $this->factory->brand_ids()->toArray();
		//删除所属门店下的相关品牌列表
		$original_brand_ids = $agent->brands()->whereIn('brands.id', $factory_brand_ids)->get(['brands.id'])->pluck('id');
		$deleted_brand_ids = array_diff($original_brand_ids->toArray(), $brand_ids); //查找原始数据里面被删除的
		foreach($agent->stores as $store)
			$store->brands()->detach($deleted_brand_ids);
		//先删除此厂商所有的品牌，然后同步
		$agent->brands()->detach($factory_brand_ids);
		$agent->brands()->sync($brand_ids, false);
		
		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;

		$factory_brand_ids = $this->factory->brand_ids()->toArray();
		foreach ($id as $v)
		{
			$agent = Agent::find($v);

			//删除所属门店下的相关品牌列表
			$original_brand_ids = $agent->brands()->whereIn('brands.id', $factory_brand_ids)->get(['brands.id'])->pluck('id');
			foreach($agent->stores as $store)
				$store->brands()->detach($original_brand_ids);

			//删除厂商关联
			$agent->factories()->detach($this->factory->getKey());
			//删除品牌关联
			$agent->brands()->detach($factory_brand_ids);

		}
		return $this->success('', count($id) > 5, compact('id'));
	}
}
