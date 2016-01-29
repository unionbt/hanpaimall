<?php

namespace App\Http\Controllers\Factory;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Factory\BaseController;

use App\Factory;
use Addons\Core\Controllers\AdminTrait;
use App\Order;

class HomeController extends BaseController {

	public function index()
	{
	    $order = new Order;
	    //查找今天订单数
	    $_data['today_cnt'] = $order->newQuery()->where('fid', $this->factory->getKey())->whereRaw('date(created_at) = ?',array(date("Y-m-d")))->count();
	    //查找本月订单数
	    $_data['month_cnt'] = $order->newQuery()->where('fid', $this->factory->getKey())->whereRaw('left(created_at,7) = ?',array(date("Y-m")))->count();
	    //查找今天收入
	    $_data['today_income'] = $order->newQuery()->where('fid', $this->factory->getKey())->whereRaw('date(created_at) = ? and `status`>1',array(date("Y-m-d")))->sum('total_money');
	    //查找本月收入
	    $_data['month_income'] = $order->newQuery()->where('fid', $this->factory->getKey())->whereRaw('left(created_at,7) = ? and `status`>1',array(date("Y-m")))->sum('total_money');
	    //最新5个订单
	    $_data['new_orders'] = $order->newQuery()->with('details')->where('fid', $this->factory->getKey())->orderBy('created_at','desc')->take(5)->get();
	    
	    $this->_data = $_data;
		return $this->view('factory-backend.dashborad');
	}
}