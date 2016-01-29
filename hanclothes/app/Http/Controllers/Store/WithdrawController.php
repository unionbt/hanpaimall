<?php

namespace App\Http\Controllers\Store;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Store\BaseController;

use App\Bill;
use App\Withdraw;
use Addons\Core\Controllers\AdminTrait;
use Addons\Core\Models\UserFinance;
use App\UserBankcard;

class WithdrawController extends BaseController
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$withdraw = new Withdraw;
		$builder = $withdraw->newQuery()->with(['users','bankcards'])->where('uid', $this->store->getKey());
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.store-backend.'.$withdraw->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('store-backend.withdraw.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$withdraw = new Withdraw;
		$builder = $withdraw->newQuery()->with(['users','bankcards'])->where('uid', $this->store->getKey());
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$withdraw = new Withdraw;
		$builder = $withdraw->newQuery()->with(['users','bankcards'])->where('uid', $this->store->getKey());
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $withdraw->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('store-backend.withdraw.export');
		}

		$data = $this->_getExport($request, $builder);
		return $this->success('', FALSE, $data);
	}

	public function show($id)
	{
		return '';
	}

	public function create()
	{
	    //帐户余额
	    $amount = UserFinance::findOrNew($this->store->getKey())->money?:0;
	    //查找当前用户冻结金额 取出7天奖金
	    $freeze_money = Bill::whereRaw("uid = ? and is_dealt = ? and created_at>='?' and event in( 'commission' , 'income')",array($this->store->getKey(),1,date("Y-m-d 00:00:00",strtotime('-7 days'))))->sum('value')?:0;
	    //可取资金
	    $usable_money = intval(($amount - $freeze_money)/($this->site['withdraw_counter_percent']+1));
	    $this->_user_money = compact('amount','freeze_money','usable_money');

	    //查找银行卡信息
	    $this->_bank_cards = (new UserBankcard)->with('bank_name')->newQuery()->where('uid',$this->store->getKey())->get();
	     
	    $keys = 'money,card_id';
		$this->_data = [];
		$this->_validates = $this->getScriptValidate('withdraw.store', $keys);
		return $this->view('store-backend.withdraw.create');
	}

	public function store(Request $request)
	{
		$keys = 'money,card_id';
		$data = $this->autoValidate($request, 'withdraw.store', $keys);
		$data += ['uid' => $this->store->getKey()];
		$withdraw = Withdraw::create($data);
		$withdraw->init();
		return $this->success('', url('store/withdraw'));
	}

	public function update(Request $request, $id)
	{
		$withdraw = Withdraw::find($id);
		if (empty($withdraw))
			return $this->failure_noexists();

		$keys = 'money,card_id';
		$data = $this->autoValidate($request, 'withdraw.store', $keys, $withdraw);
		$withdraw->update($data);
		return $this->success();
	}

	public function destroy(Request $request, $id)
	{
		empty($id) && !empty($request->input('id')) && $id = $request->input('id');
		$id = (array) $id;
		
		foreach ($id as $v){
		    $withdraw = Withdraw::find($v);
		    $withdraw->canceled();
		}
		return $this->success('', count($id) > 5, compact('id'));
	}
}
