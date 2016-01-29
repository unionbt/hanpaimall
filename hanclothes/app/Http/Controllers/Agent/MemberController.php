<?php

namespace App\Http\Controllers\Agent;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Agent\BaseController;

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

	}

	public function data(Request $request)
	{
		$user = new User;
		$builder = $user->newQuery()->with(['_gender']);
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

}
