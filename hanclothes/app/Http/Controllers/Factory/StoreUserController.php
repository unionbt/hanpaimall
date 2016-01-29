<?php

namespace App\Http\Controllers\Factory;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\User;
use App\Store;
use Addons\Core\Controllers\AdminTrait;
use DB;
use App\Factory;
use App\Agent;
class StoreUserController extends BaseController
{
	use AdminTrait;
	public $RESTful_permission = 'store';
	public function index(Request $request)
	{
	    $user = new User;
	    $builder = $user->newQuery()->with('stores')->join('store_user', 'store_user.uid', '=', 'users.id')->groupBy('users.id');
	    $pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$user->getTable(), $this->site['pagesize']['common']);
	    $base = boolval($request->input('base')) ?: false;
	
	    //view's variant
	    $this->_base = $base;
	    $this->_pagesize = $pagesize;
	    $this->_filters = $this->_getFilters($request, $builder);
	    $this->_table_data = $base ? $this->_getPaginate($request, $builder, ['users.*', DB::raw('COUNT(`store_user`.`sid`) as `stores-count`')], ['base' => $base]) : [];
	    return $this->view('factory-backend.store.user.'. ($base ? 'list' : 'datatable'));
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function data(Request $request)
	{
		$user = new User;
		$builder = $user->newQuery()->with('stores')->join('store_user', 'store_user.uid', '=', 'users.id')->groupBy('users.id');//->whereIn('store_user.sid',$store_ids)
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder, null, ['users.*', DB::raw('COUNT(`store_user`.`sid`) as `stores-count`')] );
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}
}
