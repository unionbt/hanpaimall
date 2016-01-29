<?php
namespace App;

use Addons\Core\Models\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Brand extends Model{
	use SoftDeletes;
	public $auto_cache = true;
	protected $guarded = ['id'];

	public function factory()
	{
		return $this->hasOne('App\\Factory', 'id', 'fid');
	}

	public function agents()
	{
		return $this->belongsToMany('App\\Agent', 'agent_brand', 'bid', 'aid');
	}

	public function agent_ids()
	{
		return $this->agents()->get(['agents.id'])->pluck('id');
	}

	public function stores()
	{
		return $this->belongsToMany('App\\Store', 'store_brand', 'bid', 'sid');
	}

	public function store_ids()
	{
		return $this->stores()->get(['stores.id'])->pluck('id');
	}

	public function products()
	{
		return $this->hasMany('App\\Product', 'bid', 'id');
	}

	public function product_ids()
	{
		return $this->products()->get(['products.id'])->pluck('id');
	}

}