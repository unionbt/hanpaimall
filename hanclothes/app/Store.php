<?php
namespace App;

use Addons\Core\Models\Model;

class Store extends Model{
	public $auto_cache = true;
	protected $guarded = [];

	public function user()
	{
		return $this->hasOne('App\\User', 'id', 'id');
	}

	public function agents()
	{
		return $this->belongsToMany('App\\Agent', 'agent_store', 'sid', 'aid');
	}

	public function agent_ids()
	{
		return $this->agents()->get(['agents.id'])->pluck('id');
	}

	public function brands()
	{
		return $this->belongsToMany('App\\Brand', 'store_brand', 'sid', 'bid');
	}

	public function brand_ids()
	{
		return $this->brands()->get(['brands.id'])->pluck('id');
	}

	public function users()
	{
		return $this->belongsToMany('App\\User', 'store_user', 'sid', 'uid');
	}

	public function user_ids()
	{
		return $this->users()->get(['users.id'])->pluck('id');
	}
}