<?php

namespace App;

use Addons\Core\Models\User as BaseUser;

class User extends BaseUser 
{
	public function factory()
	{
		return $this->hasOne('App\\Factory', 'id', 'id');
	}

	public function agent()
	{
		return $this->hasOne('App\\Agent', 'id', 'id');
	}

	public function store()
	{
		return $this->hasOne('App\\Store', 'id', 'id');
	}

	public function addresses()
	{
		return $this->hasMany('App\\UserAddress', 'uid', 'id')->orderBy('used_at', 'DESC');
	}

	public function stores()
	{
		return $this->belongsToMany('App\\Store', 'store_user', 'uid', 'sid')->with('user');
	}
	
	public function finances()
	{
	    return $this->hasOne('App\\UserFinance','id','id');
	}
}
