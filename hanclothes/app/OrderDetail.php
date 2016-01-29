<?php
namespace App;

use Addons\Core\Models\Model;

class OrderDetail extends Model{
	public $auto_cache = true;
	protected $guarded = ['id'];
	protected $appends = ['money'];


	public function product()
	{
		return $this->hasOne('App\\Product',  'id', 'pid')->with('brand');
	}

	public function size()
	{
		return $this->hasOne('App\\ProductSize',  'id', 'psid')->with(['attr','size_types']);
	}

	public function getMoneyAttribute()
	{
		return $this->unit_price * $this->count;
	}


}