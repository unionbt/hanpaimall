<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Addons\Core\Controllers\AdminTrait;
use App\Bill;
use DB;

class StatisticsController extends Controller
{
	use AdminTrait;
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request)
	{
		$bill = new Bill;
		$builder = $bill->newQuery()->where('is_dealt',1)->groupBy(DB::raw('date(created_at)'));
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.admin.'.$bill->getTable(), $this->site['pagesize']['common']);
		$base = boolval($request->input('base')) ?: false;
        //$static_data = $this->static_all($bill->newQuery()->where('is_dealt',1)->groupBy(DB::raw('date(created_at) desc,event'))->get());
        
		$this->_base = $base;
		$this->_pagesize = $pagesize;
		$this->_filters = $this->_getFilters($request, $builder);
		$this->_table_data = $base ? $this->_getPaginate($request, $builder, ['*'], ['base' => $base]) : [];
		return $this->view('admin.statistics.'. ($base ? 'list' : 'datatable'));
	}

	public function data(Request $request)
	{
		$bill = new Bill;
		$builder = $bill->newQuery()->with(['users'])->where('is_dealt',1)->groupBy(DB::raw('date(created_at)'));
		$_builder = clone $builder;$total = $_builder->count();unset($_builder);
		$static_data = $this->static_all($bill->newQuery()->where('is_dealt',1)->groupBy(DB::raw('date(created_at) desc,event'))->get(['*', DB::raw('date(created_at) as s_date,sum(`value`) as `s_val`')]));
		
		$data = $this->_getData($request, $builder);
		$data['recordsTotal'] = $total;
		$data['recordsFiltered'] = $data['total'];
		$data['data'] = $static_data;
		return $this->success('', FALSE, $data);
	}

	public function export(Request $request)
	{
		$bill = new Bill;
		$builder = $bill->newQuery();
		$page = $bill->input('page') ?: 0;
		$pagesize = $request->input('pagesize') ?: config('site.pagesize.export', 1000);
		$total = $this->_getCount($request, $builder);

		if (empty($page)){
			$this->_of = $request->input('of');
			$this->_table = $bill->getTable();
			$this->_total = $total;
			$this->_pagesize = $pagesize > $total ? $total : $pagesize;
			return $this->view('admin.statistics.export');
		}

		$data = $this->_getExport($request, $builder);
		return $this->success('', FALSE, $data);
	}
	//统计数据整理
	private function static_all($data)
	{
	    $return_data = array();$i=1;
	    foreach ($data as $item)
	    {
	       $date = date("Y-m-d",strtotime($item['created_at']));
	       if(!isset($return_data[$date]))
	           $return_data[$date] = ['id'=>$i++,'s_date'=>$date,'purchase'=>0,'income'=>0,'commission'=>0,'withdrawals'=>0,'handling_fee'=>0];
	       $return_data[$date][$item['event']]+=$item['s_val'];
	    }
	    return array_values($return_data);
	}
}

