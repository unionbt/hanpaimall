<?php

namespace App\Http\Controllers\Factory;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Factory;
use Addons\Core\Controllers\AdminTrait;

abstract class BaseController extends Controller{

	public $factory = null;

	public function __construct()
	{
		parent::__construct();

		$this->factory = Factory::find($this->user->getKey());
		if (empty($this->factory)) 
			return $this->error('factory.failure_noexists');

		$this->viewData['_factory'] = $this->factory;
	}


}