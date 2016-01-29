<?php

namespace App\Http\Controllers\Store;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Store\BaseController;

use App\User;
use Addons\Core\Controllers\AdminTrait;

class MemberController extends BaseController
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
    public function index(Request $request)
	{
		$user = new User;
		$builder = $user->newQuery()->with(['_gender'])->join('store_user', 'store_user.uid', '=', 'users.id', 'INNER')->where('store_user.sid',$this->store->getKey())->groupBy('users.id');
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$user->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['users.*'], ['base' => $base]) : [];
		return $this->view('store-backend.member.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$user = new User;
		$builder = $user->newQuery()->with(['_gender'])->join('store_user', 'store_user.uid', '=', 'users.id', 'INNER')->where('store_user.sid',$this->store->getKey())->groupBy('users.id');
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder, null, ['users.*']);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$user = new User;
		$builder = $user->newQuery()->with(['_gender'])->join('store_user', 'store_user.uid', '=', 'users.id', 'INNER')->where('store_user.sid',$this->store->getKey())->groupBy('users.id');
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $user->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('store-backend.member.export');
		}

		$data = $this->_getExport($request, $builder, function(&$v){
			$v['_gender'] = !empty($v['_gender']) ? $v['_gender']['title'] : NULL;
		}, ['users.*']);
		return $this->success('', FALSE, $data);
	}

	public function edit($id)
	{
		$user = User::find($id);
		if (empty($user))
			return $this->failure_noexists();

		$this->_data = $user;
		return $this->view('store-backend.member.edit');
	}
}
