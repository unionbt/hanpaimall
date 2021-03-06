<?php
namespace Plugins\Wechat\App;

use Addons\Core\Models\Model;

class WechatMessageText extends Model{
	public $auto_cache = true;
	protected $guarded = [];
	public $incrementing = false;

	public function message()
	{
		return $this->hasOne(get_namespace($this).'\\WechatMessage', 'id', 'id');
	}

	
}