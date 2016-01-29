<?php

namespace App\Http\Controllers\Agent;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Agent;
use Addons\Core\Controllers\AdminTrait;

abstract class BaseController extends Controller{

	public $agent = null;

	public function __construct()
	{
		parent::__construct();

		$this->agent = Agent::find($this->user->getKey());
		if (empty($this->agent)) 
			return $this->error('agent.failure_noexists');
		
		$this->stores_ids = Agent::find($this->agent->getKey())->store_ids()->toArray();
		$this->viewData['_agent'] = $this->agent;
	}


}