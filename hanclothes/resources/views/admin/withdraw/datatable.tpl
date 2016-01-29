<{extends file="admin/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>提现<{/block}>

<{block "name"}>withdraw<{/block}>

<{block "filter"}>
<{include file="admin/withdraw/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>用户名</th>
<th>提现金额</th>
<th>手续费</th>
<th>提现银行卡信息</th>
<th>备注</th>
<th>状态</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'users', orderable: false, render: function(data){
		return data.realname;
	}},
	{'data': 'money'},
	{'data': 'counter_fee'},
	{'data': 'bankcards', orderable: false, render: function(data){
		return (data != null)?data.bank_name.title+'-'+data.bank_branch+'&nbsp;&nbsp;'+data.cardholder+'('+data.card_no+')':'暂无银行卡信息';
	}},
	{'data': 'note'},
	{'data': 'audit_tag'},
];
<{/block}>

<{block "datatable-columns-options"}>
		var columns_options = [{'data': null, orderable: false, 'render': function (data, type, full){
			<{block "datatable-columns-options-plus"}>var columns_options_plus = [];<{/block}>
			<{block "datatable-columns-options-delete-confirm"}>var columns_options_delete_confirm = '您确定取消提现：'+full['id']+'吗？';<{/block}>
			return '<div class="btn-group">\
				'+(full['audit']==1?'<a href="<{''|url}>/admin/withdraw/'+full['id']+'/edit" data-toggle="tooltip" title="审核" class="btn btn-xs btn-default"><i class="fa fa-tint"></i></a>':'')
				+(full['audit']!=1?'无':'')+'</div>';
			}
		}];
<{/block}>
