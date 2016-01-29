<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Factory;
use Addons\Core\Controllers\AdminTrait;

class FactoryController extends Controller
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
		$factory = new Factory;
		$builder = $factory->newQuery()->with('user');
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$factory->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('admin.factory.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$factory = new Factory;
		$builder = $factory->newQuery()->with(['brands', 'user']);
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder, function(&$v, $k){
			$v['agents-count'] = $v->agents()->count();
			$v['brands-count'] = $v->brands()->count();
		});
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$factory = new Factory;
		$builder = $factory->newQuery();
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $factory->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('admin.factory.export');
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
		$keys = 'id,name,address,phone';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('factory.store', $keys);
		return $this->view('admin.factory.create');
	}

	public function store(Request $request)
	{
		$keys = 'id,name,address,phone';
		$data = $this->autoValidate($request, 'factory.store', $keys);

		Factory::create($data);
		return $this->success('', url('admin/factory'));
	}

	public function edit($id)
	{
		$factory = Factory::find($id);
		if (empty($factory))
			return $this->failure_noexists();

		$keys = 'name,address,phone';
		$this->_validates = $this->getScriptValidate('factory.store', $keys);
		$this->_data = $factory;
		return $this->view('admin.factory.edit');
	}

	public function update(Request $request, $id)
	{
		$factory = Factory::find($id);
		if (empty($factory))
			return $this->failure_noexists();

		$keys = 'name,address,phone';
		$data = $this->autoValidate($request, 'factory.store', $keys, $factory);
		$factory->update($data);
		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v)
			$factory = Factory::destroy($v);
		return $this->success('', count($id) > 5, compact('id'));
	}
}
