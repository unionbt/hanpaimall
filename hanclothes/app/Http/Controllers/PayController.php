<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class PayController extends Controller
{
	//微信支付
	public function order()
	{
		return $this->view('pc.pay');
	}
	
	public function returnUrl()
	{
	    return $this->view('pc.pay_success');
	}
}
