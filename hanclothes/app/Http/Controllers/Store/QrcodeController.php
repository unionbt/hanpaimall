<?php

namespace App\Http\Controllers\Store;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Store\BaseController;

use App\Order;
use Addons\Core\Controllers\AdminTrait;

class QrcodeController extends BaseController
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
		return $this->view('store-backend.qrcode.show');
	}
}

