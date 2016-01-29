<{extends file="factory-backend/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>代理商申请<{/block}>

<{block "name"}>agent-audit<{/block}>

<{block "filter"}>
<{include file="factory-backend/agent/audit/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>负责人账号</th>
<th>负责人姓名</th>
<th>负责人身份证</th>
<th>代理商名称</th>
<th>地址</th>
<th>电话</th>
<th>状态</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'username'},
	{'data': 'realname', orderable: false},
	{'data': 'idcard', orderable: false},
	{'data': 'name', orderable: false},
	{'data': 'address', orderable: false},
	{'data': 'phone', orderable: false},
	{'data': 'audited', orderable: false, render: function(data){
		return data ? '<span class="label label-success">通过</span>' : '<span class="label label-danger">正在审核</span>';
	}}
];
<{/block}>
<{block "table-th-options"}><{/block}>
<{block "datatable-columns-options"}>
var columns_options = [];
<{/block}>