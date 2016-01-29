<?php

namespace App\Http\Controllers\Factory;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Factory\BaseController;

use App\Agent;
use App\AgentAudit;
use Addons\Core\Controllers\AdminTrait;

class AgentAuditController extends BaseController
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$agent_audit = new AgentAudit;
		$builder = $agent_audit->newQuery()->where('fid', $this->factory->getKey());
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.factory-backend.'.$agent_audit->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('factory-backend.agent.audit.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$agent_audit = new AgentAudit;
		$builder = $agent_audit->newQuery()->where('fid', $this->factory->getKey());
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$agent_audit = new AgentAudit;
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $agent_audit->count();

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $agent_audit->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('factory-backend.agent.export');
		}

		$builder = $agent_audit->newQuery()->where('fid', $this->factory->getKey());
		$data = $this->_getExport($request, $builder);
		return $this->success('', FALSE, $data);
	}

	public function show($id)
	{
		return '';
	}

	public function create()
	{
		$keys = 'username,realname,idcard,name,address,phone,brand_ids';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('agent.audit-store', $keys);
		return $this->view('factory-backend.agent.audit.create');
	}

	public function store(Request $request)
	{
		$keys = 'username,realname,idcard,name,address,phone,brand_ids';
		$data = $this->autoValidate($request, 'agent.audit-store', $keys);
		$data += ['fid' => $this->factory->getKey()];
		$agent_audit = AgentAudit::create($data);
		return $this->success('', url('factory/agent-audit'));
	}

}
