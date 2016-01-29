<?php
namespace App\Http\Controllers\M;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Controllers\WechatOAuth2Controller;
use App\Product;

class ProductController extends WechatOAuth2Controller
{
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	//详情页
	public function detail(Request $request)
	{
	    $pid = $request->input('pid');
	    $this->_product = Product::with(['brand','covers','attrs','sizes'])->find($pid);	   
	    if (empty($this->_product))
	        return $this->failure_noexists();
        $this->subtitle($this->_product->brand->name);
	    $this->subtitle($this->_product->title);

	    return $this->view('m.detail');
	}
}
