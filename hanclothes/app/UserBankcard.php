<?php
namespace App;

use Addons\Core\Models\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserBankcard extends Model{
    use SoftDeletes;
	public $auto_cache = true;
	protected $guarded = ['id'];

	protected $dates = ['used_at'];
	
	public function users()
	{
		return $this->belongsTo('App\\User', 'uid', 'id');
	}
	
	public function bank_name()
	{
	    return $this->belongsTo('App\\Field','bank_type','id');
	}
}