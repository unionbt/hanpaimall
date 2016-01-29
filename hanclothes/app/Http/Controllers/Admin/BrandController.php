<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Brand;
use Addons\Core\Controllers\AdminTrait;

class BrandController extends Controller
{
	use AdminTrait;
	public $RESTful_permission = 'factory';
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$brand = new Brand;
		$builder = $brand->newQuery()->with('factory');
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$brand->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('admin.brand.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$brand = new Brand;
		$builder = $brand->newQuery()->with('factory');
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder, function(&$v, $k){
			$v['stores-count'] = $v->stores()->count();
			$v['agents-count'] = $v->agents()->count();
			$v['products-count'] = $v->products()->count();
		});
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$brand = new Brand;
		$builder = $brand->newQuery()->with('factory');
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $brand->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('admin.brand.export');
		}

		$data = $this->_getExport($request, $builder);
		return $this->success('', FALSE, $data);
	}

	public function show($id)
	{
		return '';
	}

	public function create()
	{
		$keys = 'name,fid,logo_aid';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('brand.store', $keys);
		return $this->view('admin.brand.create');
	}

	public function store(Request $request)
	{
		$keys = 'name,fid,logo_aid';
		$data = $this->autoValidate($request, 'brand.store', $keys);

		Brand::create($data);
		return $this->success('', url('admin/brand'));
	}

	public function edit($id)
	{
		$brand = Brand::find($id);
		if (empty($brand))
			return $this->failure_noexists();

		$keys = 'name,fid,logo_aid';
		$this->_validates = $this->getScriptValidate('brand.store', $keys);
		$this->_data = $brand;
		return $this->view('admin.brand.edit');
	}

	public function update(Request $request, $id)
	{
		$brand = Brand::find($id);
		if (empty($brand))
			return $this->failure_noexists();

		$keys = 'name,fid,logo_aid';
		$data = $this->autoValidate($request, 'brand.store', $keys, $brand);
		$brand->update($data);
		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v)
			$brand = Brand::destroy($v);
		return $this->success('', count($id) > 5, compact('id'));
	}
}
