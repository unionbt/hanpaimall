<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\User;
use App\Order;
use App\Product;

class HomeController extends Controller
{
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request, $id)
	{
	   //总销售金额
	    $order = new Order;
	    $_data['sell_total_money'] = $order->newQuery()->whereRaw('`status`>?',array(1))->sum('total_money');
	   //总订单数
	    $_data['order_total_cnt'] = $order->newQuery()->count();
	   //总商品数
	    $product = new Product;
	    $_data['product_total_cnt'] = $product->newQuery()->count();
	   //总用户数
	    $user = new User;
	    $_data['user_total_cnt'] = $user->newQuery()->count();
	    
	    $this->_week_start = $week_start=date("Y-m-d 00:00:00",strtotime("-".(date("w")-1)." days"));
	   //本周销售
	    $_data['sell_week_money'] = $order->newQuery()->whereRaw('created_at>= ? and `status`>?',array($week_start,1))->sum('total_money');
	   //本周订单
	    $_data['order_week_cnt'] = $order->newQuery()->whereRaw('created_at>= ?',array($week_start))->count();
	   //本周商品
	    $_data['product_week_cnt'] = $product->newQuery()->whereRaw('created_at>= ?',array($week_start))->count();
	   //本周用户
	    $_data['user_week_cnt'] = $user->newQuery()->whereRaw('created_at>= ?',array($week_start))->count();
        $this->_data = $_data;
	    
	    return $this->view('admin.dashboard');
	}
	
	public function show(Request $request)
	{
	    $user = User::find($this->user->getKey());
	    if (empty($user))
	        return $this->failure_noexists();
	
	    $keys = 'username,nickname,realname,gender,email,phone,idcard,avatar_aid,role_ids';
	    $this->_validates = $this->getScriptValidate('member.store', $keys);
	    $this->_data = $user;
	    $this->_type = 'show';
	    return $this->view('admin.user.edit');
	}
	
	public function password()
	{
	    $user = User::find($this->user->getKey());
	    if (empty($user))
	        return $this->failure_noexists();
	
	    $keys = 'password,password_confirmation';
	    $this->_validates = $this->getScriptValidate('member.store', $keys);
	    $this->_data = $user;
	    $this->_type = 'password';
	    return $this->view('admin.user.password');
	}
	
	public function update(Request $request, $id)
	{
	    $user = User::find($this->user->getKey());
	    if (empty($user))
	        return $this->failure_noexists();
	
	    //modify the password
	    if (!empty($request->input('password')))
	    {
	        $data = $this->autoValidate($request, 'member.store', 'password');
	        $data['password'] = bcrypt($data['password']);
	        $user->update($data);
	    }else{
	        $keys = 'nickname,realname,gender,email,phone,idcard,avatar_aid';
	        $data = $this->autoValidate($request, 'member.store', $keys, $user);
	        $user->update($data);
	    }
	    return $this->success();
	}
}
