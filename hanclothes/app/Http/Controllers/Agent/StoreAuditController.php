<?php

namespace App\Http\Controllers\Agent;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Agent\BaseController;

use App\Store;
use App\StoreAudit;
use Addons\Core\Controllers\AdminTrait;

class StoreAuditController extends BaseController
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$store_audit = new StoreAudit;
		$builder = $store_audit->newQuery()->where('aid', $this->agent->getKey());
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.agent-backend.'.$store_audit->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('agent-backend.store.audit.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$store_audit = new StoreAudit;
		$builder = $store_audit->newQuery()->where('aid', $this->agent->getKey());
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$store_audit = new StoreAudit;
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $store_audit->count();

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $store_audit->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('agent-backend.store.export');
		}

		$builder = $store_audit->newQuery()->where('aid', $this->agent->getKey());
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
		$this->_validates = $this->getScriptValidate('store.audit-store', $keys);
		return $this->view('agent-backend.store.audit.create');
	}

	public function store(Request $request)
	{
		$keys = 'username,realname,idcard,name,address,phone,brand_ids';
		$data = $this->autoValidate($request, 'store.audit-store', $keys);
		$data += ['aid' => $this->agent->getKey()];
		$store_audit = StoreAudit::create($data);
		return $this->success('', url('agent/store-audit'));
	}

}
