<?php
namespace Plugins\Wechat\App;

use Addons\Core\Models\Model;

class WechatDepotImage extends Model{
	public $auto_cache = true;
	protected $guarded = [];
	public $incrementing = false;

	public function depot()
	{
		return $this->belongsTo(get_namespace($this).'\\WechatDepot', 'wdid', 'id');
	}
}