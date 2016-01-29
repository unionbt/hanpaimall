<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class OrderController extends Controller
{
	//订单待确认页
	public function confirm(Request $request)
	{
	    return $this->view('pc.confirm');
	}
	//生成订单页
	public function create(Request $request)
	{
	    return $this->view('pc.index');
	}
}