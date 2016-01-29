<?php

namespace App\Http\Controllers\Agent;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Agent\BaseController;

use App\Brand;
use Addons\Core\Controllers\AdminTrait;

class BrandController extends BaseController
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$brand = new Brand;
		$builder = $brand->newQuery()->join('agent_brand', 'agent_brand.bid', '=' , 'brands.id')->where('aid', $this->agent->getKey())->groupBy('brands.id');
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.agent-backend.'.$brand->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['brands.*'], ['base' => $base]) : [];
		return $this->view('agent-backend.brand.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$brand = new Brand;
		$builder = $brand->newQuery()->join('agent_brand', 'agent_brand.bid', '=' , 'brands.id')->where('aid', $this->agent->getKey())->groupBy('brands.id');
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder, function(&$v, $k){
			$v['products-count'] = $v->products()->count();
		}, ['brands.*']);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$brand = new Brand;
		$builder = $brand->newQuery()->join('agent_brand', 'agent_brand.bid', '=' , 'brands.id')->where('aid', $this->agent->getKey())->groupBy('brands.id');
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $brand->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('agent-backend.brand.export');
		}

		$data = $this->_getExport($request, $builder, null, ['brands.*']);
		return $this->success('', FALSE, $data);
	}

}
