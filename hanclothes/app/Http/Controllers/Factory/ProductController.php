<?php

namespace App\Http\Controllers\Factory;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Factory\BaseController;

use App\Product;
use Addons\Core\Controllers\AdminTrait;

class ProductController extends BaseController
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$product = new Product;
		$builder = $product->newQuery()->with(['brand', 'covers'])->where('fid', $this->factory->getKey());
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.factory-backend.'.$product->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('factory-backend.product.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$product = new Product;
		$builder = $product->newQuery()->with(['brand', 'covers'])->where('fid', $this->factory->getKey());
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$product = new Product;
		$builder = $product->newQuery()->with('brand')->where('fid', $this->factory->getKey());
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $product->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('factory-backend.product.export');
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
		$keys = 'title,content,bid,cover_aids,shop_rate,agent_rate,express_price,keywords,description,activity_type';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('product.store', $keys);
		return $this->view('factory-backend.product.create');
	}

	public function store(Request $request)
	{
		$keys = 'title,content,bid,cover_aids,shop_rate,agent_rate,express_price,keywords,description,activity_type';
		$data = $this->autoValidate($request, 'product.store', $keys);
		$cover_aids = array_pull($data, 'cover_aids');
		$data += ['fid' => $this->factory->getKey()];
		$product = Product::create($data);
		foreach ($cover_aids as $value)
			$product->covers()->create(['cover_aid' => $value]);
		return $this->success('', url('factory/product'));
	}

	public function edit($id)
	{
		$product = Product::find($id);
		if (empty($product))
			return $this->failure_noexists();

		$keys = 'title,content,bid,cover_aids,shop_rate,agent_rate,express_price,keywords,description,activity_type';
		$this->_validates = $this->getScriptValidate('product.store', $keys);
		$this->_data = $product;
		return $this->view('factory-backend.product.edit');
	}

	public function update(Request $request, $id)
	{
		$product = Product::find($id);
		if (empty($product))
			return $this->failure_noexists();

		$keys = 'title,content,bid,cover_aids,shop_rate,agent_rate,express_price,keywords,description,activity_type';
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
