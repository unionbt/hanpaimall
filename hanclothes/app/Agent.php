<?php
namespace App;

use Addons\Core\Models\Model;

class Agent extends Model{
	public $auto_cache = true;
	protected $guarded = [];

	public function user()
	{
		return $this->hasOne('App\\User', 'id', 'id');
	}

	public function factories()
	{
		return $this->belongsToMany('App\\Factory', 'factory_agent', 'aid', 'fid');
	}

	public function factory_ids()
	{
		return $this->factories()->get(['factories.id'])->pluck('id');
	}

	public function brands()
	{
		return $this->belongsToMany('App\\Brand', 'agent_brand', 'aid', 'bid');
	}

	public function brand_ids()
	{
		return $this->brands()->get(['brands.id'])->pluck('id');
	}

	public function stores()
	{
		return $this->belongsToMany('App\\Store', 'agent_store', 'aid', 'sid');
	}

	public function store_ids()
	{
		return $this->stores()->get(['stores.id'])->pluck('id');
	}
}