<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Factory\BaseController;

use App\Product;
use Addons\Core\Controllers\AdminTrait;
use App\ProductAttr;
use App\ProductSize;
use Illuminate\Support\MessageBag;

class ProductStockController extends BaseController
{
	use AdminTrait;
	function __construct(){
	    parent::__construct();
	    $this->_pid = app('request')->get('pid');
	    if(!empty($this->_pid)){
	        session(['pid'=>$this->_pid]);
	        $this->_product = Product::findOrFail($this->_pid);
	    }else{ 
	        $this->_pid = session('pid');
	        $this->_product = Product::findOrFail($this->_pid);
	    }
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$productSize = new ProductSize;
		$builder = $productSize->newQuery()->with(['size_types', 'attr']);
		$builder = !empty($this->_attr_id)?$builder->where('attr_id',$this->_attr_id):$builder->where('pid',$this->_pid);
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$productSize->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('admin.product-stock.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$productSize = new ProductSize;
		$builder = $productSize->newQuery()->with(['size_types', 'attr']);
		$builder = !empty($this->_attr_id)?$builder->where('attr_id',$this->_attr_id):$builder->where('pid',$this->_pid);
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function create()
	{
		$keys = 'attr_id,size_type,price,count';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('product-stock.store', $keys);
		return $this->view('admin.product-stock.create');
	}

	public function store(Request $request)
	{
		$keys = 'attr_id,size_type,price,count';
		$data = $this->autoValidate($request, 'product-stock.store', $keys);
		$data += ['pid' => $this->_product->id];
		if($this->validProductUnique($this->_pid, $request->get('attr_id'), $request->get('size_type')))
		{
		    ProductSize::create($data);
		    return $this->success('', url('admin/product-stock'));
		}else{
		    return $this->failure_validate(new MessageBag(array('size_type'=>'同一件商品同一属性同一大小的条目已存在')));
		}
	}

	public function edit($id)
	{
		$productSize = ProductSize::find($id);
		if (empty($productSize))
			return $this->failure_noexists();

		$keys = 'attr_id,size_type,price,count';
		$this->_validates = $this->getScriptValidate('product-stock.store', $keys);
		$this->_data = $productSize;
		return $this->view('admin.product-stock.edit');
	}

	public function update(Request $request, $id)
	{
		$productSize = ProductSize::find($id);
		if (empty($productSize))
			return $this->failure_noexists();

		$keys = 'attr_id,size_type,price,count';
		$data = $this->autoValidate($request, 'product-stock.store', $keys, $productSize);
    	if($this->validProductUnique($this->_pid, $request->get('attr_id'), $request->get('size_type'),$id))
    	{
    	   $productSize->update($data);
    	   return $this->success();
    	}else{
    	   return $this->failure_validate(new MessageBag(array('size_type'=>'同一件商品同一属性同一大小的条目已存在')));
    	}
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v)
			$productSize = ProductSize::destroy($v);
		return $this->success('', count($id) > 5, compact('id'));
	}
	
	private function validProductUnique($pid,$attr_id,$clothes_type,$main_id=''){
	    $productSize = new ProductSize;
	    $builder = $productSize->newQuery()->where('pid','=',$pid)->where('attr_id','=',$attr_id)->where('size_type','=',$clothes_type);
	    if(!empty($main_id)) $builder->where('id','!=',$main_id);
	    return $builder->count()?false:true;
	}
}
