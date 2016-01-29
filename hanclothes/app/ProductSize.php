<?php
namespace App;

use Addons\Core\Models\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Plugins\Activity\App\ActivityType;
use Plugins\Activity\App\Activity;

class ProductSize extends Model{
	use SoftDeletes;
	public $auto_cache = true;
	protected $guarded = ['id'];

	public function product()
	{
		return $this->belongsTo('App\\Product', 'pid', 'id');
	}
	
	public function attr()
	{
		return $this->belongsTo('App\\ProductAttr','attr_id','id');
	}
	
	public function size_types()
	{
		return $this->belongsTo('App\\Field','size_type','id');
	}
	
	//活动
	public function activity($htmlshow=false)
	{
	    $activity_type = Product::find($this->pid)->activity_type;
	    if(!empty($activity_type)){
	      $activity = Activity::find($activity_type);
	      if(!empty($activity) && $activity->start_date <= date("Y-m-d H:i:s") && $activity->end_date >= date("Y-m-d H:i:s") && $activity->status == 1){
	          $class_dir = ActivityType::find($activity->type_id)->class_dir;
	          $config = json_decode($activity->argc,true);
	      }else{
	          return $this;
	      }
	    }else{
	      return $this;
	    }
	    return with(new $class_dir)->config($config)->product_size_decorate($this,$htmlshow);
	}
	//活动红包
	public function activity_bonus($uid)
	{
	    $activity_type = Product::find($this->pid)->activity_type;
	    if(!empty($activity_type)){
	        $activity = Activity::find($activity_type);
	        if(!empty($activity) && $activity->start_date <= date("Y-m-d H:i:s") && $activity->end_date >= date("Y-m-d H:i:s") && $activity->status == 1){
	            $class_dir = ActivityType::find($activity->type_id)->class_dir;
	            $config = json_decode($activity->argc,true);
	        }else{
	           return '';
	        }
	    }else{
	        return '';
	    }
	    $bonus_config = ['fid'=>Product::find($this->pid)->fid,'uid'=>$uid,'aid'=>$activity_type];
	    return with(new $class_dir)->config($config)->bonus($bonus_config);
	}
}