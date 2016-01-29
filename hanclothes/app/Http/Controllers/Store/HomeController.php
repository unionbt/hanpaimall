<?php

namespace App\Http\Controllers\Store;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Store\BaseController;

use App\Agent;
use Addons\Core\Controllers\AdminTrait;
use App\Order;

class HomeController extends BaseController {

	public function index()
	{
	    $order = new Order;
	    //查找今天订单数
	    $_data['today_cnt'] = $order->newQuery()->join('order_expresses','order_expresses.id','=','orders.id','INNER')->where('order_expresses.sid', $this->store->getKey())->whereRaw('date(orders.created_at) = ?',array(date("Y-m-d")))->count()?:0;
	    //查找本月订单数
	    $_data['month_cnt'] = $order->newQuery()->join('order_expresses','order_expresses.id','=','orders.id','INNER')->where('order_expresses.sid', $this->store->getKey())->whereRaw('left(orders.created_at,7) = ?',array(date("Y-m")))->count()?:0;
	    //查找今天收入
	    $_data['today_income'] = $order->newQuery()->join('order_expresses','order_expresses.id','=','orders.id','INNER')->where('order_expresses.sid', $this->store->getKey())->whereRaw('date(orders.created_at) = ? and `status`>1',array(date("Y-m-d")))->sum('total_money')?:0;
	    //查找本月收入
	    $_data['month_income'] = $order->newQuery()->join('order_expresses','order_expresses.id','=','orders.id','INNER')->where('order_expresses.sid', $this->store->getKey())->whereRaw('left(orders.created_at,7) = ? and `status`>1',array(date("Y-m")))->sum('total_money')?:0;
	    //最新5个订单
	    $_data['new_orders'] = $order->newQuery()->with('details')->join('order_expresses','order_expresses.id','=','orders.id','INNER')->where('order_expresses.sid', $this->store->getKey())->orderBy('orders.created_at','desc')->take(5)->get();

	    $this->_data = $_data;
		return $this->view('store-backend.dashborad');
	}
}