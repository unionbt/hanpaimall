<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Plugins\Wechat\App\Http\Controllers\WechatController as BaseWechatController;
use Plugins\Wechat\App\WechatAccount;
use Plugins\Wechat\App\WechatUser;
use Plugins\Wechat\App\WechatDepotNews;
use Plugins\Wechat\App\Tools\API;
use Plugins\Wechat\App\Tools\User as WechatUserTool;
use Plugins\Wechat\App\Tools\Pay as WechatPayTool;
use App\Role;
use App\Order;
use App\Store;
use App\User;
use Auth;
class WechatController extends BaseWechatController {
	private $user = null;

	protected function user(API $api, WechatUser $wechatUser)
	{
		//如果不希望加入到系统的用户表，请注释下行
		return $this->user = (new WechatUserTool($api))->bindToUser($wechatUser, Role::WECHATER);
	}

	protected function auth(API $api, WechatUser $wechatUser)
	{
		if (!empty($wechatUser->user))
			return Auth::loginUsingId($wechatUser->uid);
	}

	public function news(Request $request, $id)
	{
		$news = WechatDepotNews::findOrFail($id);
		if ($news->redirect)
			return redirect($news['url']);

		return view('wechat.news')->with('_news', $news);
	}

	/**
	 * 扫描关注
	 * 
	 * @param  Addons\Models\WechatUser $wechatUser  发送者
	 * @param  Addons\Models\WechatAccount $account 接收者
	 * @param  string $scene_id 二维码的参数值
	 * @param  string $ticket   二维码的ticket，可用来换取二维码图片
	 * @return string|response
	 */
	public function scan_subscribe(API $api, WechatUser $wechatUser, WechatAccount $account, $scene_id, $ticket)
	{
		if (($index = strpos($scene_id, 'store-')) !== FALSE)
		{
			$id = intval(substr($scene_id, $index + 6));
			$store = Store::find($id);
			if(!empty($store) && !empty($wechatUser->uid))
			{
				$user = User::find($wechatUser->uid);
				!empty($user) && $user->stores()->sync([$store->getKey()], false);
				return $api->news([
					[
						'Title'=>'欢迎光临“汉派商城”，在这里，挑选您的美丽服饰，开始您的魅力之旅吧！',
						'Description'=> '',
						'PicUrl'=> url('attachment').'?id='.$store->user->avatar_aid,
						'Url'=> url('m?sid='.$store->getKey()),
					]
				])->reply([], true);
			}
		}
		//$result = (new WechatQrcode)->subscribeReply($scene_id, $ticket) ?: (new WechatReply)->subscribeReply();
		return null;
	}

	/**
	 * 扫描
	 * 
	 * @param  Addons\Models\WechatUser $wechatUser  发送者
	 * @param  Addons\Models\WechatAccount $account 接收者
	 * @param  string $scene_id 二维码的参数值
	 * @param  string $ticket   二维码的ticket，可用来换取二维码图片
	 * @return string|response
	 */
	public function scan(API $api, WechatUser $wechatUser, WechatAccount $account, $scene_id, $ticket)
	{
		if (($index = strpos($scene_id, 'store-')) !== FALSE)
		{
			$id = intval(substr($scene_id, $index + 6));
			$store = Store::find($id);
			if(!empty($store) && !empty($wechatUser->uid))
			{
				$user = User::find($wechatUser->uid);
				!empty($user) && $user->stores()->sync([$store->getKey()], false);
				return $api->news([
					[
						'Title'=>'欢迎光临“汉派商城”，在这里，挑选您的美丽服饰，开始您的魅力之旅吧！',
						'Description'=> '',
						'PicUrl'=> url('attachment').'?id='.$store->user->avatar_aid,
						'Url'=> url('m?sid='.$store->getKey()),
					]
				])->reply([], true);
			}
		}
		//$result = (new WechatQrcode)->reply($scene_id, $ticket);
		return null;
	}

	/**
	 * 支付回调
	 * @return [type] [description]
	 */
	public function feedback(Request $request, $aid, $oid = NULL)
	{
		$aid = $request->input('aid') ?: $aid;
		$oid = $request->input('oid') ?: $oid;
		$account = WechatAccount::findOrFail($aid);
		$api = new API($account->toArray(), $account->getKey());

		$pay = new WechatPayTool($api);
		$result = $pay->notify(function($result, &$message) use ($account, $oid){
			if ($result['return_code'] == 'SUCCESS')
			{
				$wechatUser = WechatUser::where('openid', $result['openid'])->firstOrFail();
				$result = array_only($result, ['return_code','return_msg','mch_id','device_info','result_code','err_code','err_code_des','trade_type','bank_type','total_fee','fee_type','cash_fee','cash_fee_type','coupon_fee','coupon_count','transaction_id','out_trade_no','attach','time_end']);
				WechatBill::create($result + ['waid' => $account->getKey(), 'wuid' => $wechatUser->getKey()]);
				if (!empty($oid))
				{
					//因为是微信访问的，只能靠记录日志来查询是否失败
					$order = Order::findOrFail($oid);
					$order->pay($result['total_fee']);
					$this->dispatch( (new \App\Jobs\OrderDeal($order))->delay(config('site.order.deal', 14 * 86400)) );

				}
			} else
				WechatBill::create(['return_code' => $result['return_code'], 'return_msg' => $result['return_msg'], 'waid' => $account->getKey()]);
			return true;
		});
		return $result;
	}

}