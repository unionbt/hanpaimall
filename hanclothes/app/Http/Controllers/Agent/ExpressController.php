<?php

namespace App\Http\Controllers\Agent;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Agent\BaseController;

use App\Order;
use App\OrderDetail;
use Addons\Core\Controllers\AdminTrait;
use App\OrderExpress;
use App\Store;
use App\UserAddress;
use App\User;

class ExpressController extends BaseController
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$order = new Order;
		$builder = $order->newQuery()->with(['order_express'])->join('order_expresses','order_expresses.id','=','orders.id','INNER')->whereIn('order_expresses.sid', $this->stores_ids);
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$order->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('agent-backend.express.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$order = new Order;
		$builder = $order->newQuery()->with(['order_express'])->join('order_expresses','order_expresses.id','=','orders.id','INNER')->whereIn('order_expresses.sid', $this->stores_ids);
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		//dd($data);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function create(){}

	public function store(Request $request){}
}

