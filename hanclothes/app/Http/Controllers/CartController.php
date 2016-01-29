<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class CartController extends Controller
{
	//购物车页
	public function shopCart(Request $request)
	{
		return $this->view('pc.shopcart');
	}
}
