<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class ProductController extends Controller
{
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	//详情页
	public function detail(Request $request)
	{
	    return $this->view('pc.detail');
	}
}
