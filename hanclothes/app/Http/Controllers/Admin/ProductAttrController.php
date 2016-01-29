<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Factory\BaseController;

use App\ProductAttr;
use Addons\Core\Controllers\AdminTrait;
use App\Product;

class ProductAttrController extends BaseController
{
	use AdminTrait;
	
	function __construct(){
	    parent::__construct();
	    $this->_pid = app('request')->get('pid');
	    isset($this->_pid)&&session(['pid'=>$this->_pid]);
	    !isset($this->_pid)&&$this->_pid = session('pid');
	    $this->_product= Product::findOrFail($this->_pid);
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$product_attr = new ProductAttr;
		$builder = $product_attr->newQuery()->with('product')->where('pid',$this->_pid);
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$product_attr->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;
		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('admin.product-attr.'. ($base ? 'list' : 'datatable'));
	}

	
 	public function data(Request $request)
 	{
 		$product_attr = new ProductAttr;
 		$builder = $product_attr->newQuery()->with(['product'])->where('pid', $this->_pid);
 		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
 		$data = $this->_getData($request, $builder);
 		$data['recordsTotal'] = $total;
 		$data['recordsFiltered'] = $data['total'];
 		return $this->success('', FALSE, $data);
	}

// 	public function export(Request $request)
// 	{
// 		$product = new Product;
// 		$builder = $product->newQuery()->with('brand')->where('fid', $this->factory->getKey());
// 		$page = $request->input('page') ?: 0;
// 		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
// 		$total = $this->_getCount($request, $builder);

// 		if (empty($page)){
// 			$this->_of = $request->input('of');
// 			$this->_table = $product->getTable();
// 			$this->_total = $total;
// 			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
// 			return $this->view('admin.product.export');
// 		}

// 		$data = $this->_getExport($request, $builder);
// 		return $this->success('', FALSE, $data);
// 	}

// 	public function show($id)
// 	{
// 		return '';
// 	}

	public function create()
	{
		$keys = 'name,aid';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('product-attr.store', $keys);
		return $this->view('admin.product-attr.create');
	}

	public function store(Request $request)
	{
		$keys = 'name,aid';
		$data = $this->autoValidate($request, 'product-attr.store', $keys);
		$data += ['pid' => $this->_pid];
		$product = ProductAttr::create($data);
		return $this->success('', url('admin/product-attr'));
	}

	public function edit($id)
	{
		$productAttr = ProductAttr::find($id);
		if (empty($productAttr))
			return $this->failure_noexists();

		$keys = 'name,aid';
		$this->_validates = $this->getScriptValidate('product-attr.store', $keys);
		$this->_data = $productAttr;
		return $this->view('admin.product-attr.edit');
	}

	public function update(Request $request, $id)
	{
		$productAttr = ProductAttr::find($id);
		if (empty($productAttr))
			return $this->failure_noexists();

		$keys = 'name,aid';
		$data = $this->autoValidate($request, 'product-attr.store', $keys, $productAttr);
		$productAttr->update($data);
		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v)
			$productAttr = ProductAttr::destroy($v);
		return $this->success('', count($id) > 5, compact('id'));
	}
}
