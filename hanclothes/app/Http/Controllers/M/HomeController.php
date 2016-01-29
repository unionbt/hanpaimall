<?php
namespace App\Http\Controllers\M;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Controllers\WechatOAuth2Controller;
use Queue;
use Illuminate\Support\Str;
use App\User;
use App\Store;
use App\Brand;
use App\Product;
use App\ProductAttr;
use Addons\Core\Models\Field;
use App\ProductSize;

class HomeController extends WechatOAuth2Controller
{
	//首页
	public function index(Request $request, $sid = NULL, $redirect_url = NULL)
	{
		if (!empty($sid))
		{
			$store = Store::find($sid);
			!empty($store) && $this->user->stores()->sync([$sid], FALSE);
		}
		
		if (empty($this->user->stores->count()))
			return $this->failure('store.failure_follow');
		
		if(!empty($redirect_url)){return redirect()->intended($redirect_url);}
		
		$stores_ids = $this->user->stores->pluck('id');
		$this->_brands = Brand::join('store_brand as s','s.bid','=','brands.id')->whereIn('s.sid',$stores_ids)->get(['brands.*']);

		$pagesize = $request->input('pagesize') ?:config('site.pagesize.m', $this->site['pagesize']['common']);
		$this->_input = $request->all();
		$product = new Product;
		$builder = $product->newQuery()->with(['sizes','covers']);
		$this->_table_data = $builder->whereIn('bid',$this->_brands->pluck('id'))->paginate($pagesize);
		return $this->view('m.index');
	}
}
