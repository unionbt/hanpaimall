<?php
namespace App;

use Addons\Core\Models\Model;

class Factory extends Model{
	public $auto_cache = true;
	protected $guarded = [];

	public function user()
	{
		return $this->hasOne('App\\User', 'id', 'id');
	}

	public function brands()
	{
		return $this->hasMany('App\\Brand', 'fid', 'id');
	}

	public function brand_ids()
	{
		return $this->brands()->get(['brands.id'])->pluck('id');
	}

	public function agents()
	{
		return $this->belongsToMany('App\\Agent', 'factory_agent', 'fid', 'aid');
	}

	public function agent_ids()
	{
		return $this->agents()->get(['agents.id'])->pluck('id');
	}

	public function orders()
	{
		return $this->hasMany('App\\Order', 'fid', 'id');
	}

}