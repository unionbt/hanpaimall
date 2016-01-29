<?php

namespace App\Http\Controllers\Store;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Agent;
use Addons\Core\Controllers\AdminTrait;
use App\Store;

abstract class BaseController extends Controller{

	public $store = null;

	public function __construct()
	{
		parent::__construct();

		$this->store = Store::find($this->user->getKey());
		if (empty($this->store)) 
			return $this->error('store.failure_noexists');

		$this->viewData['_store'] = $this->store;
	}


}