<?php
namespace App;

use Addons\Core\Models\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;
class Bill extends Model{
	use SoftDeletes;
	public $auto_cache = true;
	protected $guarded = ['id'];

	protected $casts = ['is_dealt' => 'true'];
	protected $appends = ['event_tag'];
	
	const PURCHASE = 'purchase'; //购买
	const INCOME = 'income'; //收入
	const COMMISSION = 'commission'; //佣金
	const WITHDRAWALS = 'withdrawals'; //提现
	const HANDLINGFEE = 'handling_fee'; //手续费
	
	public function table()
	{
		return $this->morphTo()->lockForUpdate();
	}
	
	public function users(){
	    return $this->hasOne('App\User','id','uid');
	}
	
	public function getEventTagAttribute()
	{
	   $event_tag = "未知";
	   switch ($this->event){
	      case static::PURCHASE:
	          $event_tag="购买"; break;
	      case static::INCOME:
	          $event_tag="收入"; break;
	      case static::COMMISSION:
	          $event_tag="佣金"; break;
	      case static::WITHDRAWALS:
	           $event_tag="提现"; break;
	      case static::HANDLINGFEE:
	           $event_tag="手续费"; break;
	   }
	   return $event_tag;
	}
	
	public function deal($dealing = true, $transaction = true)
	{
		if ($dealing == $this->is_dealt)
			return false;
		$transaction && DB::beginTransaction();
		$this->is_dealt = $dealing;
		if ($this->fireModelEvent('dealing') !== false)
		{
			$this->save();
			$transaction && DB::commit();
			$this->fireModelEvent('dealt', false);
			return true;
		}

		$transaction && DB::rollBack();
		return false;
	}

	public function setEvent($name, $model, $field_name, $id)
	{
		$this->event = compact('name', 'model', 'field_name', 'id');
		return this;
	}

	public function getEventModel()
	{
		return 'App\\'.ucfirst($this->event['model']);
	}

	public static function dealing($callback, $priority = 0)
	{
		static::registerModelEvent('dealing', $callback, $priority);
	}

	public static function dealt($callback, $priority = 0)
	{
		static::registerModelEvent('dealt', $callback, $priority);
	}

}

Bill::dealing(function($bill){
	$event = $bill->event;
	$model = $field_name = '';
	switch ($bill->event) {
		case Bill::PURCHASE:
			$model = 'App\\UserFinance';
			$field_name = 'used_money';
			break;
		case Bill::HANDLINGFEE:
		case Bill::WITHDRAWALS:
		case Bill::INCOME:
		case Bill::COMMISSION:
			$model = 'App\\UserFinance';
			$field_name = 'money';
			break;
		default:
			# code...
			break;
	}

	$result = (new $model)->newQuery()->find($bill->uid);
	if (empty($result)) return false;

	return $bill->is_dealt ? $result->increment($field_name, $bill->value) : $result->decrement($field_name, $bill->value);
});