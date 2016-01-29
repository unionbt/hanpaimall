<?php
namespace App;

use Addons\Core\Models\Model;
use App\OrderExpress;
use App\User;
use App\Store;
use App\Agent;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;
use Plugins\Monkey\App\ActivityBonus;

class Order extends Model{
	use SoftDeletes;
	public $auto_cache = true;
	protected $guarded = ['id'];
	
	const UNKNOWN = 0; //未知
	const INIT = 1; //商品确认
	const CANCELED = -1; //订单已取消
	const PAID = 2; //订单已支付
	const REFUSED = -2; //订单退款
	const DELIVERED = 3; //订单已发货
	const DEALT = 4; //已确认收货/成交
	const REJECTED = -4; //已拒绝收货
	const CLOSED = -5; //关闭
	const COMPARE_BILL_FAIL = -20; //对账失败

	public function order_status()
	{
	   $status_tag = '';
	   switch ($this->status){
	      case static::INIT:$status_tag='订单已确认';break;
	      case static::CANCELED:$status_tag='订单已取消'; break;
	      case static::PAID:$status_tag='订单已支付'; break;
	      case static::REFUSED:$status_tag='订单退款'; break;
	      case static::DELIVERED:$status_tag='订单已发货'; break;
	      case static::DEALT:$status_tag='已确认收货/成交'; break;
	      case static::REJECTED:$status_tag='已拒绝收货';break;
	      case static::CLOSED:$status_tag='关闭'; break;
	      case static::COMPARE_BILL_FAIL:$status_tag='对账失败';break;
	      default: $status_tag='未知';
	   }   
	   return $status_tag;
	}
	
	public function deliver_status(){
	    $status_tag = '';
	    switch ($this->status){
	        case static::INIT:$status_tag='未付款';break;
	        case static::CANCELED:$status_tag='已取消'; break;
	        case static::PAID:$status_tag='未发货'; break;
	        case static::REFUSED:$status_tag='退款中'; break;
	        case static::DELIVERED:$status_tag='已发货'; break;
	        case static::DEALT:$status_tag='已收货'; break;
	        case static::REJECTED:$status_tag='已拒绝收货';break;
	        case static::CLOSED:$status_tag='关闭'; break;
	        case static::COMPARE_BILL_FAIL:$status_tag='对账失败';break;
	        default: $status_tag='未知';
	    }
	    return $status_tag;
	}
	
	public function users(){
	    return $this->hasOne('App\User','id','uid');
	}
	
	public function details()
	{
		return $this->hasMany('App\\OrderDetail', 'oid', 'id')->with(['product', 'size']);
	}

	public function bills()
	{
		return $this->morphMany('App\\Bill', 'table');
	}
    //预计收益
	public function expect_money($uid)
	{
	    $money = 0;
	    $bills =  $this->bills()->get();
	    foreach ($bills as $bill){
	        ($bill->uid == $uid)&& $money+= $this->value;
	    }
	    return $money;
	}
	public function factory()
	{
		return $this->hasOne('App\\Factory', 'id', 'fid');
	}

	public function order_express()
	{
		return $this->hasOne('App\\OrderExpress', 'id', 'id')->with(['express_types','express_type_names','stores','user_address']);
	}
	
	public function init($transaction = TRUE)
	{
		$transaction && DB::beginTransaction();
		$order = static::where($this->getKeyName(), $this->getKey())->lockForUpdate()->first();

		if ($order->status != static::UNKNOWN) //刚刚加入到数据库
		{
			$transaction && DB::rollback();
			return false;
		}
		//减去库存
		$details = $order->details->keyBy('psid');
		$productSize = ProductSize::whereIn('id', $details->pluck('psid'))->lockForUpdate()->get();
		foreach ($productSize as $ps)
			$ps->decrement('count', $details[$ps->getKey()]->count);
		
        if(intval($order->bonus_id)>0){
		  $bonus = ActivityBonus::where('id',$order->bonus_id)->lockForUpdate()->first();
          $bonus->status=1;//锁定红包
		  $bonus->save();
        }
        
		$order->status = static::INIT;
		$order->save();
		$transaction && DB::commit();
		return true;
	}

	public function canceled($transaction = TRUE)
	{
		$transaction && DB::beginTransaction();
		$order = static::where($this->getKeyName(), $this->getKey())->lockForUpdate()->first();

		if ($order->status != static::INIT && $order->status != static::REFUSED) //初始状态或者是退款状态
		{
			$transaction && DB::rollback();
			return false;
		}
		//归还库存
		$details = $order->details->keyBy('psid')->toArray();//dd($details);
		$productSize = ProductSize::whereIn('id', array_keys($details))->lockForUpdate()->get();
		foreach ($productSize as $id => $ps)
			$ps->increment('count', $details[$ps->getKey()]['count']);
		
		if(intval($order->bonus_id)>0){
		    $bonus = ActivityBonus::where('id',$order->bonus_id)->lockForUpdate()->first();
		    $bonus->status=0;//恢复红包
		    $bonus->save();
		}
		
		$order->status = static::CANCELED;
		$order->save();
		$transaction && DB::commit();
		return true;
	}

	//支付
	public function pay($total_fee, $transaction = TRUE)
	{
		$transaction && DB::beginTransaction();
		$order = static::where($this->getKeyName(), $this->getKey())->lockForUpdate()->first();

		if ($order->status != static::INIT) //初始状态
		{
			$transaction && DB::rollback();
			return false;
		}

		//对账失败
		if (abs($total_fee - $order->total_money * 100) >= 0.01 )
		{
			$order->status = static::COMPARE_BILL_FAIL;
			$order->save();
			$transaction && DB::commit();
			return false;
		}

		//用户已消费
		$order->bills()->create([
			'value' => -$order->total_money,
			'uid' => $order->uid,
			'event' => Bill::PURCHASE,
		]);


		//一个订单里面只能有一个厂家的details
		$details = $order->details;
		$total = $details->sum('money');
		$factory_money = $order->total_money;$store_money = $agent_money = [];
		$user_stores = User::find($order->uid)->stores()->get(['stores.id']); //关注的店铺
		foreach ($details as $detail)
		{
			$rate = $order->details_money * $detail->money / $total;
			$brand = $detail->product->brand;
			$store = Store::whereIn('stores.id', $user_stores->pluck('id')->toArray())->join('store_brand','store_brand.sid', '=', 'stores.id')->where('store_brand.bid', $brand->getKey())->first(['stores.*']);
			if (!empty($store))
			{
				!isset($store_money[$store->getKey()]) && $store_money[$store->getKey()] = 0;
				$store_money[$store->getKey()] += ($value = $rate * $detail->product->shop_rate / 100);
				$factory_money -= $value;
				
				
				$agent = Agent::whereIn('agents.id', $store->agent_ids()->toArray())->join('agent_brand','agent_brand.aid', '=', 'agents.id')->where('agent_brand.bid', $brand->getKey())->first(['agents.*']);
				if (!empty($agent))
				{
					!isset($agent_money[$agent->getKey()]) && $agent_money[$agent->getKey()] = 0;
					$agent_money[$agent->getKey()] += ($value = $rate * $detail->product->agent_rate / 100);
					$factory_money -= $value;
				}
			}
		}
		if (!empty($details))
		{
			//门店提成
			foreach ($store_money as $uid => $value) 
				$order->bills()->create([
					'value' => $value,
					'uid' => $uid,
					'event' => Bill::COMMISSION,
				]);
			//代理商提成
			foreach ($agent_money as $uid => $value) 
				$order->bills()->create([
					'value' => $value,
					'uid' => $uid,
					'event' => Bill::COMMISSION,
				]);
			//厂商收入
			$order->bills()->create([
				'value' => $factory_money < 0 ? 0 : $factory_money,
				'uid' => $details[0]->product->fid,
				'event' => Bill::INCOME,
			]);
		}
		$order->status = static::PAID;
		$order->save();
		if(intval($order->bonus_id)>0){
		    $bonus = ActivityBonus::where('id',$order->bonus_id)->lockForUpdate()->first();
		    $bonus->status=2;//已使用红包
		    $bonus->save();
		}
		$transaction && DB::commit();
		return true;
	}

	//快递
	public function express($express_name, $express_no, $transaction = TRUE)
	{
		$transaction && DB::beginTransaction();
		$order = static::where($this->getKeyName(), $this->getKey())->lockForUpdate()->first();

		if ($order->status != static::PAID) //未支付
		{
			$transaction && DB::rollback();
			return false;
		}

		$express = OrderExpress::where($this->getKeyName(), $this->getKey())->lockForUpdate()->first();
		$express->update([
			'express_name' => $express_name,
			'no' => $express_no,
		]);

		$order->status = static::DELIVERED;
		$order->save();
		$transaction && DB::commit();
		return true;
	}

	//确认收货
	public function deal($dealing = true, $transaction = TRUE)
	{
		$transaction && DB::beginTransaction();
		$order = static::where($this->getKeyName(), $this->getKey())->lockForUpdate()->first();

		if ($order->status != static::DELIVERED) //未发货
		{
			$transaction && DB::rollback();
			return false;
		}

		foreach($order->bills()->lockForUpdate()->get() as $stat)
		{
			if (!$stat->deal($dealing, false))
			{
				$transaction && DB::rollBack();
				return false;
			}
		}
		$order->status = static::DEALT;
		$order->save();
		$transaction && DB::commit();
		return true;
	}

	//优惠其他
	public function bonus()
	{
	    $bonus_str = "";
	    if($this->bonus_id > 0){
	       $bonus_str.="&nbsp;&nbsp;&nbsp;&nbsp;红包抵扣：¥".(ActivityBonus::find($this->bonus_id)->bonus);
	    }
	    return $bonus_str;
	}
}

Order::creating(function($order){
	$order->total_money = $order->details_money + $order->expresses_money;
    if(intval($order->bonus_id)>0){
        $bonus = ActivityBonus::find($order->bonus_id);
        $order->total_money -= $bonus->bonus;
    }
});

Order::updating(function($order){	
	if ($order->isDirty('details_money') || $order->isDirty('expresses_money'))
	{
		if ($order->status != Order::INIT)
			return false;
		$order->total_money = $order->details_money + $order->expresses_money;
	}

});