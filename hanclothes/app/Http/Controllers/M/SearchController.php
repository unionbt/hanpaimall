<?php
namespace App\Http\Controllers\M;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Controllers\WechatOAuth2Controller;
use App\Brand;
use App\Product;

class SearchController extends WechatOAuth2Controller
{
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
    //搜索列表页
	public function classify(Request $request)
	{
	    $search_key = $request->input('search_key');
	    $stores_ids = $this->user->stores->pluck('id');
	    $this->_brands = Brand::join('store_brand as s','s.bid','=','brands.id')->whereIn('s.sid',$stores_ids)->get(['brands.*']);
	    
	    $pagesize = $request->input('pagesize') ?:$this->site['pagesize']['m'];
	    $this->_input = $request->all();
	    $product = new Product;
	    $builder = $product->newQuery()->with(['sizes','covers']);
	    if(!empty($search_key)){ $builder->where('title','like','%'.$search_key.'%');}
	    $this->_search_key = $search_key;
	    $this->_table_data = $builder->whereIn('bid',$this->_brands->pluck('id'))->paginate($pagesize);
	    return $this->view('m.classify');
	}	
}
