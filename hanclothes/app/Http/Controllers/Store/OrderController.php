<?php

namespace App\Http\Controllers\Store;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Store\BaseController;

use App\Order;
use App\OrderDetail;
use Addons\Core\Controllers\AdminTrait;
use App\OrderExpress;
use App\UserAddress;
use App\Store;

class OrderController extends BaseController
{
	use AdminTrait;
	//public $RESTful_permission = 'order';
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$order = new Order;
		$builder = $order->newQuery()->with(['details','bills','order_express'])->join('order_expresses','order_expresses.id','=','orders.id','INNER')->where('order_expresses.sid', $this->store->getKey());
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$order->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('store-backend.order.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$order = new Order;
		$builder = $order->newQuery()->with(['details','bills','order_express'])->join('order_expresses','order_expresses.id','=','orders.id','INNER')->where('order_expresses.sid', $this->store->getKey());
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$order = new Order;
		$builder = $order->newQuery()->with('details');
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $order->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('store-backend.order.export');
		}

		$data = $this->_getExport($request, $builder);
		return $this->success('', FALSE, $data);
	}
    //订单查看
	public function show($id)
	{
		return '';
	}

    //确认客户已收货
	public function dealing(Request $request, $id)
	{
		$order = Order::join('order_expresses','order_expresses.id','=','orders.id','INNER')->where('order_expresses.sid', $this->store->getKey())->find($id);
		if (empty($order))
			return $this->failure_noexists();
		
		if ($order->deal(true))
			return $this->success('order.success_store_deal');
		else
			return $this->failure('order.failure_deal');
	}
	
	public function edit($id)
	{
		$order = Order::with(['details','order_express'])->join('order_expresses','order_expresses.id','=','orders.id','INNER')->where('order_expresses.sid', $this->store->getKey())->find($id);
		if (empty($order))
			return $this->failure_noexists();

        if($order->order_express->express_type==39){
            $this->_express_address = UserAddress::find($order->order_express->uaid)->getFullAddressAttribute();
        }else{
            $user_stores = Store::with('user')->find($order->order_express->sid);
            $this->_express_address = $user_stores->name.'-店主:'.$user_stores->user->realname.'-电话:'.$user_stores->phone.'-地址:'.($user_stores->address)?:'无';
        }
		$keys = 'expresses_money';
		$this->_validates = $this->getScriptValidate('order.express', $keys);
		$this->_data = $order;
		return $this->view('store-backend.order.edit');
	}

	public function update(Request $request, $id)
	{
		$order = Order::find($id);
		if (empty($order))
			return $this->failure_noexists();

		$keys = 'expresses_money';
		$data = $this->autoValidate($request, 'order.express', $keys, $order);
		$order->update($data);
		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v)
			$order = Order::destroy($v);
		return $this->success('', count($id) > 5, compact('id'));
	}
}

