<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class MemberController extends Controller
{

	public function index(Request $request)
	{
		return $this->view('pc.ucenter');
	}
}
