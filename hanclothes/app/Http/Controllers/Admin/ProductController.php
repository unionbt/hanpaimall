<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Product;
use Addons\Core\Controllers\AdminTrait;

class ProductController extends Controller
{
	use AdminTrait;
	//public $RESTful_permission = 'product';
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$product = new Product;
		$builder = $product->newQuery()->with(['brand','covers']);
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$product->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('admin.product.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$product = new Product;
		$builder = $product->newQuery()->with(['brand','covers']);
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$product = new Product;
		$builder = $product->newQuery()->with('brand');
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $product->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('admin.product.export');
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
		$keys = 'title,content,fid,bid,cover_aids,shop_rate,agent_rate,express_price,keywords,description';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('product.store', $keys);
		return $this->view('admin.product.create');
	}

	public function store(Request $request)
	{
		$keys = 'title,content,fid,bid,cover_aids,shop_rate,agent_rate,express_price,keywords,description';
		$data = $this->autoValidate($request, 'product.store', $keys);
		$cover_aids = $data['cover_aids'];unset($data['cover_aids']);

		$product = Product::create($data);
		foreach ($cover_aids as $value)
			$product->covers()->create(['cover_aid' => $value]);
		return $this->success('', url('admin/product'));
	}

	public function edit($id)
	{
		$product = Product::find($id);
		if (empty($product))
			return $this->failure_noexists();

		$keys = 'title,content,fid,bid,cover_aids,shop_rate,agent_rate,express_price,keywords,description';
		$this->_validates = $this->getScriptValidate('product.store', $keys);
		$this->_data = $product;
		return $this->view('admin.product.edit');
	}

	public function update(Request $request, $id)
	{
		$product = Product::find($id);
		if (empty($product))
			return $this->failure_noexists();

		$keys = 'title,content,fid,bid,cover_aids,shop_rate,agent_rate,express_price,keywords,description';
		$data = $this->autoValidate($request, 'product.store', $keys, $product);
		$cover_aids = $data['cover_aids'];unset($data['cover_aids']);
		$product->update($data);
		$product->covers()->delete();
		foreach ($cover_aids as $value)
			$product->covers()->create(['cover_aid' => $value]);
		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v)
			$product = Product::destroy($v);
		return $this->success('', count($id) > 5, compact('id'));
	}
}
