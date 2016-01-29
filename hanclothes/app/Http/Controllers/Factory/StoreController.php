<?php

namespace App\Http\Controllers\Factory;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Factory\BaseController;
use App\Factory;
use App\Store;
use Addons\Core\Controllers\AdminTrait;
use DB;
class StoreController extends BaseController
{
	use AdminTrait;
	public $RESTful_permission = 'store';
	
	public function __construct()
	{
	    parent::__construct();
	
	    $this->agent_ids = Factory::find($this->factory->getKey())->agent_ids()->toArray();
	    
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$store = new Store;
		$builder = $store->newQuery()->with('user')->join('agent_store', 'agent_store.sid', '=', 'stores.id')->whereIn('agent_store.aid',$this->agent_ids)->groupBy('stores.id');
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$store->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['stores.*', DB::raw('COUNT(`agent_store`.`aid`) as `agents-count`')], ['base' => $base]) : [];
		return $this->view('factory-backend.store.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$store = new Store;
		$builder = $store->newQuery()->with('user')->join('agent_store', 'agent_store.sid', '=', 'stores.id')->whereIn('agent_store.aid',$this->agent_ids)->groupBy('stores.id');//
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder, function(&$v, $k){
			$v['brands-count'] = $v->brands()->count();
			$v['users-count'] = $v->users()->count();
		}, ['stores.*', DB::raw('COUNT(`agent_store`.`aid`) as `agents-count`')]);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$store = new Store;
		$builder = $store->newQuery()->join('agent_store', 'agent_store.sid', '=', 'stores.id')->where('stores.id',$this->factory->getKey())->groupBy('stores.id');
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $store->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('factory-backend.store.export');
		}

		$data = $this->_getExport($request, $builder, null, ['stores.*', DB::raw('COUNT(`agent_store`.`aid`) as `agents-count`')]);
		return $this->success('', FALSE, $data);
	}

	public function show($id)
	{
		return '';
	}

	public function create()
	{
		$keys = 'id,name,address,phone,agent_ids,brand_ids';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('store.store', $keys);
		return $this->view('factory-backend.store.create');
	}

	public function store(Request $request)
	{
		$keys = 'id,name,address,phone,agent_ids,brand_ids';
		$data = $this->autoValidate($request, 'store.store', $keys);
		$agent_ids = array_pull($data, 'agent_ids');
		$brand_ids = array_pull($data, 'brand_ids');

		$store = Store::create($data);
		$store->agents()->sync($agent_ids);
		$store->brands()->sync($brand_ids);
		return $this->success('', url('factory-backend/store'));
	}

	public function edit($id)
	{
		$store = Store::find($id);
		if (empty($store))
			return $this->failure_noexists();

		$keys = 'name,address,phone,agent_ids,brand_ids';
		$this->_validates = $this->getScriptValidate('store.store', $keys);
		$this->_data = $store;
		return $this->view('factory-backend.store.edit');
	}

	public function update(Request $request, $id)
	{
		$store = Store::find($id);
		if (empty($store))
			return $this->failure_noexists();

		$keys = 'name,address,phone,agent_ids,brand_ids';
		$data = $this->autoValidate($request, 'store.store', $keys, $store);

		$agent_ids = array_pull($data, 'agent_ids');
		$brand_ids = array_pull($data, 'brand_ids');
		$store->update($data);
		$store->agents()->sync($agent_ids);
		$store->brands()->sync($brand_ids);

		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v)
			$store = Store::destroy($v);
		return $this->success('', count($id) > 5, compact('id'));
	}
}
