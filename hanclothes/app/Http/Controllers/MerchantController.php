<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class MerchantController extends Controller
{
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	//申请
    public function apply(Request $request)
    {
        return $this->view('pc.merchant_apply');
    }
	//入驻
	public function settled(Request $request)
	{
	    return $this->view('pc.detail');
	}
}
