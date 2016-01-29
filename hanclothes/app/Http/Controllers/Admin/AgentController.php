<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Agent;
use Addons\Core\Controllers\AdminTrait;
use DB;
class AgentController extends Controller
{
	use AdminTrait;
	public $RESTful_permission = 'agent';
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$agent = new Agent;
		$builder = $agent->newQuery()->with('user')->join('factory_agent', 'factory_agent.aid', '=', 'agents.id')->groupBy('agents.id');
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$agent->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['agents.*', DB::raw('COUNT(`factory_agent`.`fid`) as `factories-count`')], ['base' => $base]) : [];
		return $this->view('admin.agent.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$agent = new Agent;
		$builder = $agent->newQuery()->with(['brands','user'])->join('factory_agent', 'factory_agent.aid', '=', 'agents.id')->groupBy('agents.id');
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder, function(&$v, $k){
			$v['stores-count'] = $v->stores()->count();
			$v['brands-count'] = $v->brands()->count();
		}, ['agents.*', DB::raw('COUNT(`factory_agent`.`fid`) as `factories-count`')]);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$agent = new Agent;
		$builder = $agent->newQuery()->join('factory_agent', 'factory_agent.aid', '=', 'agents.id')->groupBy('agents.id');
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $agent->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('admin.agent.export');
		}

		$data = $this->_getExport($request, $builder, null, ['agents.*', 'COUNT(factory_agent.fid) as factories-count']);
		return $this->success('', FALSE, $data);
	}

	public function show($id)
	{
		return '';
	}

	public function create()
	{
		$keys = 'id,name,address,phone,factory_ids,brand_ids';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('agent.store', $keys);
		return $this->view('admin.agent.create');
	}

	public function store(Request $request)
	{
		$keys = 'id,name,address,phone,factory_ids,brand_ids';
		$data = $this->autoValidate($request, 'agent.store', $keys);
		
		$factory_ids = array_pull($data, 'factory_ids');
		$brand_ids = array_pull($data, 'brand_ids');

		$agent = Agent::create($data);
		$agent->factories()->sync($factory_ids);
		$agent->brands()->sync($brand_ids);

		return $this->success('', url('admin/agent'));
	}

	public function edit($id)
	{
		$agent = Agent::find($id);
		if (empty($agent))
			return $this->failure_noexists();

		$keys = 'name,address,phone,factory_ids,brand_ids';
		$this->_validates = $this->getScriptValidate('agent.store', $keys);
		$this->_data = $agent;
		return $this->view('admin.agent.edit');
	}

	public function update(Request $request, $id)
	{
		$agent = Agent::find($id);
		if (empty($agent))
			return $this->failure_noexists();

		$keys = 'name,address,phone,factory_ids,brand_ids';
		$data = $this->autoValidate($request, 'agent.store', $keys, $agent);
		$factory_ids = array_pull($data, 'factory_ids');
		$brand_ids = array_pull($data, 'brand_ids');

		$agent->update($data);
		$agent->factories()->sync($factory_ids);
		$agent->brands()->sync($brand_ids);
		
		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v)
			$agent = Agent::destroy($v);
		return $this->success('', count($id) > 5, compact('id'));
	}
}
