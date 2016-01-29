<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Bill;
use App\Withdraw;
use Addons\Core\Controllers\AdminTrait;
use Addons\Core\Models\UserFinance;

class WithdrawController extends Controller
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
		$builder = $withdraw->newQuery()->with(['users','bankcards']);
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$withdraw->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;

		//view's variant
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('admin.withdraw.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$withdraw = new Withdraw;
		$builder = $withdraw->newQuery()->with(['users','bankcards']);
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$withdraw = new Withdraw;
		$builder = $withdraw->newQuery()->with(['users','bankcards']);
		$page = $request->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $withdraw->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('admin.withdraw.export');
		}

		$data = $this->_getExport($request, $builder);
		return $this->success('', FALSE, $data);
	}

	public function show($id)
	{
		return '';
	}

	public function edit($id)
	{
	    $withdraw = Withdraw::find($id);
	    //帐户余额
	    $amount = UserFinance::findOrNew($withdraw->uid)->money;
	    //查找当前用户冻结金额
	    $freeze_money = Bill::whereRaw("uid = ? and is_dealt = ? and created_at>='?' and event in( 'commission' , 'income')",array($withdraw->uid,1,date("Y-m-d 00:00:00",strtotime('-7 days'))))->sum('value')?:0;
	    //可取资金
	    $usable_money = intval(($amount - $freeze_money)/($this->site['withdraw_counter_percent']+1));
	    $this->_user_money = compact('amount','freeze_money','usable_money');
	    
		$withdraw = Withdraw::with(['bankcards'])->find($id);
		if (empty($withdraw))
			return $this->failure_noexists();

		$keys = 'audit,note';
		$this->_validates = $this->getScriptValidate('withdraw.audit', $keys);
		$this->_data = $withdraw;
		return $this->view('admin.withdraw.edit');
	}

	public function update(Request $request, $id)
	{
		$withdraw = Withdraw::find($id);
		if (empty($withdraw))
			return $this->failure_noexists();

		$keys = 'audit,note';
		$data = $this->autoValidate($request, 'withdraw.audit', $keys, $withdraw);
		$dealing = array_pull($data,'audit');
		$withdraw->update($data);
		$withdraw->deal($dealing);
		return $this->success('withdraw.audit_success',url('admin/withdraw'));
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
