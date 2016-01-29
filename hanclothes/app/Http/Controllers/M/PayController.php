<?php
namespace App\Http\Controllers\M;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Controllers\WechatOAuth2Controller;
use Illuminate\Support\Str;
use App\User;
use App\Order;
use Plugins\Wechat\App\WechatAccount;
use Plugins\Wechat\App\Tools\API;
use Plugins\Wechat\App\Tools\Pay;
use Plugins\Wechat\App\Tools\Js;
use Plugins\Wechat\App\Tools\Pay\UnifiedOrder;

class PayController extends WechatOAuth2Controller
{
	public function test()
	{
		$wechatUser = $this->getWechatUser();
		$account = WechatAccount::findOrFail($this->wechat_oauth2_account);
		$api = new API($account->toArray(), $account->getKey());

		$pay = new Pay($api);
		$order = (new UnifiedOrder('JSAPI', date('YmdHis'), '买1分钱的单', 1))->SetNotify_url(url('wechat/feedback/'.$account->getKey()))->SetOpenid($wechatUser->openid);
		$UnifiedOrderResult = $pay->unifiedOrder($order);
		$js = new Js($api);
		$this->_parameters = $js->getPayParameters($UnifiedOrderResult);
		return $this->view('pay.test');
	}
	
	private function getPayJsParameter( Order $model, $title, $attach = '')
	{
		$wechatUser = $this->getWechatUser();
		$account = WechatAccount::findOrFail($this->wechat_oauth2_account);
		$api = new API($account->toArray(), $account->getKey());

		$pay = new Pay($api);
		$order = (new UnifiedOrder('JSAPI', date('ymdHis').str_pad($model->getKey(), 8, '0', STR_PAD_LEFT), $title, $model->total_money * 100))
		->SetNotify_url(url('wechat/feedback/'.$account->getKey().'/'.$model->getKey()))->SetOpenid($wechatUser->openid)->setDetail($model->title)->SetAttach($attach);
		$UnifiedOrderResult = $pay->unifiedOrder($order);
		if ( $UnifiedOrderResult['return_code'] != 'SUCCESS' || empty($UnifiedOrderResult['prepay_id']))
			return $this->failure(['content' => $UnifiedOrderResult['return_msg']]);
		$js = new Js($api);
		$result =  $js->getPayParameters($UnifiedOrderResult);

		return $result;
	}
	//微信支付
	public function order($id)
	{
		$order = Order::find($id);
		if (empty($order))
			return $this->failure_noexists();

		if ($order->status != Order::INIT)
			return $this->failure('order.failure_paid');

		$parameters = $this->getPayJsParameter($order, $this->site['title']);
		if (!is_array($parameters)) return $parameters;
		$this->_parameters = $parameters;
		$this->_order = $order;
		return $this->view('m.pay');
	}
	//
	public function paysuccess(Request $request)
	{
	   $order = $order = Order::find($request->get('oid'));
	   if (empty($order))
	       return $this->failure_noexists();
	   
	   $this->_order = $order;
	   return $this->view('m.paysuccess');
	}
}
