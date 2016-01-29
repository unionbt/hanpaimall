<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class SearchController extends Controller
{
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
    //搜索列表页
	public function classify(Request $request)
	{
	    return $this->view('pc.classify');
	}
}
