<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Queue;
use Illuminate\Support\Str;

class HomeController extends Controller
{
	//首页
	public function index(Request $request)
	{
		return $this->view('pc.index');
	}
}
