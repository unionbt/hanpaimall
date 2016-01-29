<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class ReturnController extends Controller
{
	//退货申请
	public function apply()
	{
		return $this->view('pc.return_apply');
	}
}
