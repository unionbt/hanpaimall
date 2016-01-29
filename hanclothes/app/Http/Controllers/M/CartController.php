<?php
namespace App\Http\Controllers\M;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Controllers\WechatOAuth2Controller;
use DB;
use App\Cart;
use App\ProductSize;

class CartController extends WechatOAuth2Controller
{
	//加入购物车
	public function addCart(Request $request)
	{
		$keys = 'psid,count,quickly';
		$data = $this->tipsValidate($request, 'order.cart', $keys);

		$psid = $data['psid'];
		DB::beginTransaction();
		$ps = ProductSize::where('id', $psid)->lockForUpdate()->first();
		//库存不足
		if ($ps->count < $data['count'])
		{
			DB::rollback();
			return $this->failure('order.failure_cart_stock_less');
		}
		//快速购买模式
		if ($data['quickly'])
		{
			DB::rollback();
			return $this->success('order.success_quickly', url('m/to/order').'?cart[]='.$psid.'&buy_cnt['.$psid.']='.$data['count']);
		}
		else
		{
			//加入购物车
			Cart::firstOrCreate([
				'psid' => $psid,
				'uid' => $this->user->getKey(), 
			])->increment('count', $data['count']);
			DB::commit();
			return $this->success('order.success_cart', FALSE);
		}
	}

	//购物车页
	public function shopCart(Request $request)
	{
		$cart_list = Cart::where('uid', $this->user->getKey())->with('product_size')->get()->keyBy('id');
		//刪除无效產品，修正數量
		foreach ($cart_list as $key => $cart)
		{
			if (empty($cart->product_size)) //产品不存在
			{
				$cart->delete();
				unset($cart_list[$key]);
			}
			elseif ($cart->product_size->count < $cart->count)
				$cart->count = $cart->product_size->count;
		}
		$this->_cart_list = $cart_list;
		return $this->view('m.shopcart');
	}
}
