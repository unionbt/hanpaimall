<?php

namespace App\Http\Controllers\Factory;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Factory\BaseController;

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
		$builder = $brand->newQuery()->where('fid', '=', $this->factory->getKey());
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.factory-backend.'.$brand->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('factory-backend.brand.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$brand = new Brand;
		$builder = $brand->newQuery()->where('fid', '=', $this->factory->getKey());
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
		$builder = $brand->newQuery()->where('fid', '=', $this->factory->getKey());
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $brand->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('factory-backend.brand.export');
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
		$keys = 'name,logo_aid';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('brand.store', $keys);
		return $this->view('factory-backend.brand.create');
	}

	public function store(Request $request)
	{
		$keys = 'name,logo_aid';
		$data = $this->autoValidate($request, 'brand.store', $keys);
		$data += ['fid' => $this->factory->getKey()];

		Brand::create($data);
		return $this->success('', url('factory/brand'));
	}

	public function edit($id)
	{
		$brand = Brand::find($id);
		if (empty($brand))
			return $this->failure_noexists();

		$keys = 'name,logo_aid';
		$this->_validates = $this->getScriptValidate('brand.store', $keys);
		$this->_data = $brand;
		return $this->view('factory-backend.brand.edit');
	}

	public function update(Request $request, $id)
	{
		$brand = Brand::find($id);
		if (empty($brand))
			return $this->failure_noexists();

		if ($brand->fid != $this->factory->getKey())
			return $this->failure_owner();

		$keys = 'name,logo_aid';
		$data = $this->autoValidate($request, 'brand.store', $keys, $brand);
		$brand->update($data);
		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v)
		{
			$brand = Brand::find($v);
			if ($brand->fid == $this->factory->getKey())
				Brand::destroy($v);
		}
		return $this->success('', count($id) > 5, compact('id'));
	}
}
