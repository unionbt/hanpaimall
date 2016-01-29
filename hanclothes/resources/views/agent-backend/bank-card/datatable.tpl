<{extends file="agent-backend/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>银行卡<{/block}>

<{block "name"}>bankcard<{/block}>

<{block "table-th-plus"}>
<th>用户名</th>
<th>银行类型</th>
<th>银行支行</th>
<th>持卡人</th>
<th>卡号</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'users', orderable: false, render: function(data){
		return data.realname;
	}},
	{'data': 'bank_name', orderable: false, render: function(data){
		return data.title;
	}},
	{'data': 'bank_branch'},
	{'data': 'cardholder'},
	{'data': 'card_no'},
];
<{/block}>