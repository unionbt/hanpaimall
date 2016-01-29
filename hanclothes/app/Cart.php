<?php
namespace App;

use Addons\Core\Models\Model;

class Cart extends Model{
	public $auto_cache = true;
	protected $guarded = ['id'];

	public function get($psid, $uid)
	{
		return $this->where('psid', $psid)->where('uid', $uid)->first();
	}

	public function product_size()
	{
		return $this->hasOne('App\ProductSize', 'id', 'psid')->with(['product','attr','size_types']);
	}
}