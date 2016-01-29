<?php
namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Plugins\Wechat\App\Http\Controllers\WechatOAuth2Controller as BaseWechatOAuth2Controller;
use Addons\Core\Validation\ValidatesRequests;
use App\Role;

abstract class WechatOAuth2Controller extends BaseWechatOAuth2Controller
{
	use DispatchesJobs, ValidatesRequests;

	public $wechat_oauth2_account = 1;
	public $wechat_oauth2_type = 'hybrid'; // snsapi_base  snsapi_userinfo  hybrid
	public $wechat_oauth2_bindUserRole = Role::WECHATER; // 是否将微信用户绑定到系统用户users

}
