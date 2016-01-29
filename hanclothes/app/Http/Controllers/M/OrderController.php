<?php
namespace App\Http\Controllers\M;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Controllers\WechatOAuth2Controller;
use App\User;
use App\Field;
use App\Cart;
use App\Order;
use App\OrderExpress;
use App\OrderDetail;
use App\ProductSize;
use DB;
use App\UserAddress;
use Carbon\Carbon;
use Illuminate\Http\Exception\HttpResponseException;
use Plugins\Wechat\App\WechatAccount;
use Plugins\Wechat\App\Tools\API;
use Plugins\Wechat\App\Tools\Address;
use Plugins\Monkey\App\ActivityBonus;
class OrderController extends WechatOAuth2Controller
{
	//订单待确认页
	public function toOrder(Request $request)
	{
		$account = WechatAccount::findOrFail($this->wechat_oauth2_account);
		$api = new API($account->toArray(), $account->getKey());
		$address = (new Address($api))->setWechatUser($this->getWechatUser());
		if ($address->authenticate())
			$this->_address_parameters = $address->getConfig();

		$keys = 'cart,buy_cnt';
		$data = $this->tipsValidate($request, 'order.store', $keys);

		$this->_buy_cnt = $data['buy_cnt'];

		$builder = ProductSize::with(['product','attr','size_types'])->whereIn('id',array_values($data['cart']));
		$this->_order_list = $builder->get();

        $this->_user_id = $this->user->getKey();

		return $this->view('m.orderconfirm'); //no cache
	}
	//生成订单页
	public function confirm(Request $request)
	{
		$keys = 'cart,buy_cnt,sid,uaid,bonus_id';
		$data = $this->tipsValidate($request, 'order.store', $keys);
		extract($data);
        $bonus_id = !empty($bonus_id)?$bonus_id:0;
		DB::beginTransaction();
		$data = $this->calcPrice($cart, $buy_cnt, $uaid, $sid,$bonus_id);

		//删除购物车中对应的商品
		array_walk($cart, function($v){
			$cart = (new Cart)->get($v, $this->user->getKey());
			!empty($cart) && $cart->delete();
		});

		//解除行锁并删除购物车
		DB::commit();
		DB::beginTransaction();
		foreach($data['factory'] as $fid => $factory)
		{
			$order = Order::create([
				'total_money' => $factory['details_money'] + $factory['expresses_money'],
				'details_money' => $factory['details_money'],
				'expresses_money' => $factory['expresses_money'],
			    'bonus_id' => $factory['bonus_id'],
				'uid' => $this->user->getKey(),
				'fid' => $fid,
				'status' => Order::UNKNOWN,
			]);
			OrderExpress::create([
				'id' => $order->getKey(),
				'sid' => $data['sid'],
				'uaid' => $data['uaid'],
				'express_type' => (new Field)->get(!empty($data['sid']) ? 'store' : 'express', 'express_type')->getKey(),
			]);
			foreach($factory['details'] as $detail)
			{
				OrderDetail::create($detail + [
					'oid' => $order->getKey(),
				]);
			}
			if (!$order->init(false))
			{
				DB::rollback();
				return $this->failure('order.failure_init');
			}
			$this->dispatch( (new \App\Jobs\OrderCancel($order))->delay(config('site.order.cancel', 1 * 86400)) );
		}
		DB::commit();
		return $this->success('order.success_confirm', count($data['factory']) > 1 ? 'm/ucenter' : 'm/pay/order?id='.$order->getKey());
	}
	//远程获取价格/数量
	public function calc(Request $request)
	{
		$keys = 'cart,buy_cnt,uaid,bonus_id';
		$data = $this->tipsValidate($request, 'order.calc', $keys);
		DB::beginTransaction();
		$data = $this->calcPrice(isset($data['cart']) ? $data['cart'] : [], isset($data['buy_cnt']) ? $data['buy_cnt'] : [], $data['uaid'],isset($data['sid'])?$data['sid']:0,isset($data['bonus_id'])?$data['bonus_id']:0);
		DB::commit();
		return $this->success(null, FALSE, $data);
	}

	//确认收货
	public function dealing(Request $request, $id)
	{
		$order = Order::find($id);
		if (empty($order))
			return $this->failure_noexists();

		if ($order->deal(true))
			return $this->success('order.success_deal');
		else
			return $this->failure('order.failure_deal');
	}
	//更新收货地址
	public function usedAddress(Request $request)
	{
		$keys = 'uaid';
		$data = $this->tipsValidate($request, 'order.calc', $keys);

		!empty($data['uaid']) && UserAddress::findOrFail($data['uaid'])->update(['used_at' => Carbon::now()]);

		return $this->success(NULL, FALSE);
	}

	/**
	 * 计算价格
	 * 
	 * @param  array $cart  psid数组
	 * @param  array $count psid对应的数量
	 * @param  integer $uaid  用户地址
	 * @param  integer $sid   自提店家
	 * @return array
	 */
	private function calcPrice($cart, $count, $uaid = NULL, $sid = NULL,$bonus_id=0)
	{
		$factory = [];$details_money = $expresses_money = $bonus_money = 0;
		if (!empty($cart))
		{
			if (count(array_unique($cart)) != count($cart))
				throw new HttpResponseException($this->failure('order.failure_product_unique', false, ['title' => $ps->product->title, 'attr' => $ps->attr->name, 'size' => $ps->size_types->name, 'count' => $ps->count]));
			
			$bonus_money = $bonus_id?ActivityBonus::find($bonus_id)->bonus:0;
			foreach($cart as $psid)
			{
				if (!empty($count[$psid]))
				{
					$ps = ProductSize::where('id', $psid)->lockForUpdate()->first();
					if (empty($ps))
						throw new HttpResponseException($this->failure('order.failure_product_noexists', false, ['title' => $ps->product->title, 'attr' => $ps->attr->name, 'size' => $ps->size_types->name, 'count' => $ps->count]));
					elseif ($ps->count < $count[$psid])
						throw new HttpResponseException($this->failure('order.failure_stock_less', false, ['title' => $ps->product->title, 'attr' => $ps->attr->name, 'size' => $ps->size_types->name, 'count' => $ps->count]));
					$fid = $ps->product->fid;
					!isset($factory[$fid]) && $factory[$fid] = ['details_money' => 0, 'expresses_money' => 0, 'details' => [],'bonus_id' => 0];
					$factory[$fid]['details'][] = [
						'psid' => $ps->getKey(),
						'pid' => $ps->pid,
						'unit_price' => $ps->price,
						'count' => $count[$psid],
					];
					//價格
					$money = $ps->activity()->price * $count[$psid];
					$factory[$fid]['details_money'] += $money;
					$details_money += $money;
					//快遞
					$money = !empty($uaid) ? $ps->product->activity_product()->express_price * $count[$psid] : 0;
					$factory[$fid]['expresses_money'] += $money;
					$expresses_money += $money;
					//红包
					$factory[$fid]['bonus_id'] = $bonus_id?(ActivityBonus::find($bonus_id)->fid==$fid?$bonus_id:0):0;
					
				}else{
				   //删除购物车
				    Cart::where('uid', $this->user->getKey())->where('psid',$psid)->delete();
				}
			}
		}

		return compact('factory', 'details_money', 'expresses_money', 'sid', 'uaid','bonus_id','bonus_money');
	}
}