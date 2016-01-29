<?php
namespace App;

use Addons\Core\Models\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Plugins\Activity\App\ActivityType;
use Plugins\Activity\App\Activity;

class Product extends Model{
	use SoftDeletes;
	
	public $auto_cache = true;
	protected $guarded = ['id'];

	public function factory()
	{
		//return $this->hasOne('App\\Factory', 'id', 'fid');
		return $this->belongsTo('App\\Factory', 'fid', 'id');
	}

	public function brand()
	{
		//return $this->hasOne('App\\Brand', 'id', 'bid');
		return $this->belongsTo('App\\Brand', 'bid', 'id');
	}

	public function sizes()
	{
		return $this->hasMany('App\\ProductSize', 'pid', 'id');
	}

	public function covers()
	{
		return $this->hasMany('App\\ProductCover', 'pid', 'id');
	}

	public function cover_aids()
	{
		return $this->covers()->get(['cover_aid'])->pluck('cover_aid');
	}

	public function cover()
	{
		return $this->covers()->take(1);
	}
	
	public function attrs()
	{
		return $this->hasMany('App\\ProductAttr',  'pid', 'id');
	}
	
	public function activiy()
	{
	    return $this->belongsTo('App\\Activity', 'activity_type', 'id');
	}
	
	public function activity_product()
	{
	    if(!empty($this->activity_type)){        
	        $activity = Activity::find($this->activity_type);
	        if(!empty($activity) && $activity->start_date <= date("Y-m-d H:i:s") && $activity->end_date >= date("Y-m-d H:i:s") && $activity->status == 1){
	           $class_dir = ActivityType::find($activity->type_id)->class_dir;
	           $config = json_decode($activity->argc,true);
	        }else{
	            return $this;
	        }
	    }else{
	        return $this;
	    }
	    return with(new $class_dir)->config(($config))->product_decorate($this);
	}
}