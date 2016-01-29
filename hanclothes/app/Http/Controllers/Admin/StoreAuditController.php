<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\StoreAudit;
use Addons\Core\Controllers\AdminTrait;

class StoreAuditController extends Controller
{
	use AdminTrait;
	public $RESTful_permission = 'store';
	
	public function index(Request $request)
	{
		$agent_audit = new StoreAudit;
		$builder = $agent_audit->newQuery()->with('agent');
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$agent_audit->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('admin.store.audit.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$agent_audit = new StoreAudit;
		$builder = $agent_audit->newQuery()->with('agent');
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function update(Request $request, $id)
	{
		$agent_audit = StoreAudit::find($id);
		if (empty($agent_audit))
			return $this->failure_noexists();

		if ($agent_audit->doAudit())
			return $this->success('store.success_audit');
		else
			return $this->failure('store.failure_audit');
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