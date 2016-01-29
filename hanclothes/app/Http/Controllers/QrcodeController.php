<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Store;
use Plugins\Wechat\App\WechatAccount;
use Plugins\Wechat\App\Tools\Qrcode;

class QrcodeController extends Controller
{

	public function index(Request $request)
	{

	}

	public function store(Request $request, $id, $size = NULL)
	{
		$store = Store::find($id);
		if (empty($store))
			return $this->failure_noexists();

		$account = WechatAccount::findOrFail(1);
		$qrcode = new Qrcode($account->toArray(), $account->getKey());

		$qr = $qrcode->getSceneStr('store-'.$id);
		
		//
		if (empty($qr))
			return $this->failure('store.failure_qrcode');

		//empty($qr->wdid) && $qr->update(['wdid' => 1]); //设置一个callback的素材
		return redirect(!empty($qr->aid) && empty($size) ? 'attachment?id='.$qr->aid : 'qr?text='.urlencode($qr->url).'&size='.(empty($size) ? 25 : $size).'&watermark='.urlencode('static/img/wechat.png'));
	}
}
