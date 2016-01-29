<{extends file="admin/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>财务报表<{/block}>
<{block "namespace"}>admin<{/block}>
<{block "name"}>statistics<{/block}>

<{block "filter"}>
<{include file="admin/statistics/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>日期</th>
<th>购买</th>
<th>收入</th>
<th>佣金</th>
<th>提现</th>
<th>手续费</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 's_date',orderable:false,render:function(s_date){
		return '<a href="<{'admin/statement?'|url}>base=&filters[created_at][min]='+s_date+' 00:00:00&filters[created_at][max]='+s_date+' 23:59:59" target="_blank">'+s_date+'</a>';
	}},
	{'data': 'purchase',orderable:false},
	{'data': 'income',orderable:false},
	{'data': 'commission',orderable:false},
	{'data': 'withdrawals',orderable:false},
	{'data': 'handling_fee',orderable:false}
];
<{/block}>

<{block "table-th-timestamps"}>
<{/block}>

<{block "datatable-columns-timestamps"}>
		var columns_timestamps = [];
<{/block}>

<{block "datatable-columns-options"}>
		var columns_options = [{'data': null, orderable: false, 'render': function (data, type, full){
			return '<div class="btn-group">无</div>';
			}
		}];
<{/block}>
