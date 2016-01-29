<?php
namespace App;

use Addons\Core\Models\Model;
use App\OrderExpress;
class UserAddress extends Model{
	public $auto_cache = true;
	protected $guarded = ['id'];

	protected $dates = ['used_at'];
	protected $appends = ['full_address'];

	public function full_address($format = '%P%C%D %A')
	{
		$data = [
			'%P' => $this->province,
			'%C' => $this->city,
			'%D' => $this->district,
			'%A' => $this->address,
		];
		return strtr($format, $data);
	}

	public function getFullAddressAttribute()
	{
		return $this->full_address();
	}
}