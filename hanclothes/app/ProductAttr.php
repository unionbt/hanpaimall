<?php
namespace App;

use Addons\Core\Models\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductAttr extends Model{
	use SoftDeletes;
	public $auto_cache = true;
	protected $guarded = ['id'];
    //属于一个商品
	public function product()
	{
	    return $this->belongsTo('App\\Product', 'pid', 'id');
	}
	//拥有一个附件图片
	public function pics()
	{
		return $this->hasOne('App\\Attachment', 'aid', 'id')->take(1);
	}
	//拥有商品库存表 一对多
	public function sizes()
	{
	    return $this->hasMany('App\\ProductSize','attr_id','id')->with('size_types');
	}
	
}