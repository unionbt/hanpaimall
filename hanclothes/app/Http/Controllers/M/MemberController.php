<?php
namespace App\Http\Controllers\M;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\UserAddress;
use Carbon\Carbon;
use App\Order;
use App\Http\Controllers\WechatOAuth2Controller;

class MemberController extends WechatOAuth2Controller
{

	public function index(Request $request)
	{
	   //取出订单列表
	   $builder = Order::with(['details'])->where('uid','=',$this->user->getKey())->orderBy('updated_at','desc');
	   if($request->get('status'))
		   $builder->where('status','=',$request->get('status'));

	   $this->_order_list = $builder->get();
	   $this->_status = $request->get('status') ?: 0;

		return $this->view('m.ucenter');
	}

	public function addressStore(Request $request)
	{
		$keys = 'realname,province,city,counties,address,national_code,postal_code,phone';
		$data = $this->autoValidate($request, 'member.address', $keys);
		$address = UserAddress::create($data + ['uid' => $this->user->getKey(), 'used_at' => Carbon::now()]);
		return $this->success('member.success_address', FALSE, $address->toArray());
	}

}
