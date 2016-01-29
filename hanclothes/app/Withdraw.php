<?php
namespace App;

use Addons\Core\Models\Model;
use Addons\Core\Models\UserFinance;
use DB;

class Withdraw extends Model{
	public $auto_cache = true;
	protected $guarded = ['id'];
	protected $appends = ['audit_tag'];

	const UNKNOWN = 0; //未知
	const INIT = 1; //提交审核
	const FINISHED = 2; //已处理
	const NOPASS = -2; //审核未通过
	const CANCELED = -1; //取消
	
	public function users()
	{
		return $this->belongsTo('App\\User', 'uid', 'id');
	}
	
	public function user_finance()
	{
	    return $this->hasOne('App\\UserFinance','id','uid');
	}
	
	public function bills()
	{
	    return $this->morphMany('App\\Bill', 'table');
	}
	
	public function bankcards()
	{
	    return $this->hasOne('App\\UserBankCard','id','card_id')->withTrashed()->with(['bank_name']);
	}
	
	public function audit_tag(){
	    $tag = '';
	    switch ($this->audit){
	        case static::UNKNOWN:
	            $tag = "未知"; break;
	        case static::INIT:
	            $tag = "提交"; break;
	        case static::FINISHED:
	            $tag = "已提现"; break;
	        case static::NOPASS:
	            $tag = "审核未通过"; break;
	        case static::CANCELED:
	            $tag = "已取消"; break;
	    }
	    return $tag;
	}
	
	public function getAuditTagAttribute()
	{
	    return $this->audit_tag();
	}
	
	public function init($dealing = TRUE , $transaction = TRUE)
	{
	    $transaction && DB::beginTransaction();
	    $withdraw = static::where($this->getKeyName(), $this->getKey())->lockForUpdate()->first();
	
	    if ($withdraw->audit != static::UNKNOWN) //刚刚加入到数据库
	    {
	        $transaction && DB::rollback();
	        return false;
	    }
	    //减去可用金额
	    foreach($withdraw->bills()->lockForUpdate()->get() as $stat)
	    {
	        if (!$stat->deal($dealing, false))
	        {
	            $transaction && DB::rollBack();
	            return false;
	        }
	    }
	
	    $withdraw->audit = static::INIT;
	    $withdraw->save();
	    $transaction && DB::commit();
	    return true;
	}
	//取消
	public function canceled($transaction = TRUE)
	{
	    $transaction && DB::beginTransaction();
	    $withdraw = static::where($this->getKeyName(), $this->getKey())->lockForUpdate()->first();
	
	    if ($withdraw->audit != static::INIT) //初始状态或者是退款状态
	    {
	        $transaction && DB::rollback();
	        return false;
	    }
	    //归还金额
	    foreach($withdraw->bills()->lockForUpdate()->get() as $stat)
	    {
	        if (!$stat->deal(false, false))
	        {
	            $transaction && DB::rollBack();
	            return false;
	        }
	    }
	
	    $withdraw->audit = static::CANCELED;
	    $withdraw->save();
	    $transaction && DB::commit();
	    return true;
	}
	
	//处理提现请求
	public function deal($dealing = true, $transaction = TRUE)
	{
	    $transaction && DB::beginTransaction();
	    $withdraw = static::where($this->getKeyName(), $this->getKey())->lockForUpdate()->first();
	
	    if ($withdraw->audit != static::INIT) //未审核
	    {
	        $transaction && DB::rollback();
	        return false;
	    }
	    if(!$dealing){
	        //归还金额
    	    foreach($withdraw->bills()->lockForUpdate()->get() as $stat)
    	    {
    	        if (!$stat->deal(false, false))
    	        {
    	            $transaction && DB::rollBack();
    	            return false;
    	        }
    	    }
	    }
	    $withdraw->audit = ($dealing)?static::FINISHED:static::NOPASS;
	    $withdraw->save();
	    $transaction && DB::commit();
	    return true;
	}
}


Withdraw::creating(function($withdraw){
    $withdraw->counter_fee = round($withdraw->money * app('config')->get('site.withdraw_counter_percent'),2);
});

Withdraw::created(function($withdraw){
    //提现
    $withdraw->bills()->create([
        'value' => -$withdraw->money,
        'uid' => $withdraw->uid,
        'event' => Bill::WITHDRAWALS,
    ]);
    //手续费
    $withdraw->bills()->create([
        'value' => -$withdraw->counter_fee,
        'uid' => $withdraw->uid,
        'event' => Bill::HANDLINGFEE,
    ]);
});