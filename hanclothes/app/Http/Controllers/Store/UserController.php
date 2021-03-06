<?php

namespace App\Http\Controllers\Store;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Store\BaseController;

use Addons\Core\Controllers\AdminTrait;
use App\User;

class UserController extends BaseController
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$user = User::find($this->store->getKey());
	    if (empty($user))
	        return $this->failure_noexists();
	
	    $keys = 'username,nickname,realname,gender,email,phone,idcard,avatar_aid,role_ids';
	    $this->_validates = $this->getScriptValidate('member.store', $keys);
	    $this->_data = $user;
	    $this->_type = 'show';
		return $this->view('store-backend.user.edit');
	}

	public function password()
	{
	    $user = User::find($this->store->getKey());
	    if (empty($user))
	        return $this->failure_noexists();
	
	    $keys = 'password,password_confirmation';
	    $this->_validates = $this->getScriptValidate('member.store', $keys);
	    $this->_data = $user;
	    $this->_type = 'password';
	    return $this->view('store-backend.user.password');
	}
	
	public function update(Request $request, $id)
	{
	    $user = User::find($this->store->getKey());
	    if (empty($user))
	        return $this->failure_noexists();
	
	    //modify the password
	    if (!empty($request->input('password')))
	    {
	        $data = $this->autoValidate($request, 'member.store', 'password');
	        $data['password'] = bcrypt($data['password']);
	        $user->update($data);
	    }else{
    	    $keys = 'nickname,realname,gender,email,phone,idcard,avatar_aid';
    	    $data = $this->autoValidate($request, 'member.store', $keys, $user);
    	    $user->update($data);
	    }
	    return $this->success();
	}
}

