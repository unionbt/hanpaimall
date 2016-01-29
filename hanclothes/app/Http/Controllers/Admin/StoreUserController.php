<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\User;
use App\Store;
use Addons\Core\Controllers\AdminTrait;
use DB;
class StoreUserController extends Controller
{
	use AdminTrait;
	public $RESTful_permission = 'store';
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
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
		return $this->view('admin.store.user.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$user = new User;
		$builder = $user->newQuery()->with('stores')->join('store_user', 'store_user.uid', '=', 'users.id')->groupBy('users.id');
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder, null, ['users.*', DB::raw('COUNT(`store_user`.`sid`) as `stores-count`')] );
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$user = new User;
		$builder = $user->newQuery()->join('store_user', 'store_user.uid', '=', 'users.id')->groupBy('users.id');
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $user->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('admin.store.export');
		}

		$data = $this->_getExport($request, $builder, null, ['users.*', DB::raw('COUNT(`store_user`.`sid`) as `stores-count`')]);
		return $this->success('', FALSE, $data);
	}

}
