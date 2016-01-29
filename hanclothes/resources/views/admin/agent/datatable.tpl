<{extends file="admin/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>代理商<{/block}>

<{block "name"}>agent<{/block}>

<{block "filter"}>
<{include file="admin/agent/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>代理商名称</th>
<th>负责人</th>
<th>手机</th>
<th>身份证</th>
<th>厂商数量</th>
<th>品牌数量</th>
<th>门店数量</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'name'},
	{'data': 'user.realname', orderable: false},
	{'data': 'user.phone', orderable: false},
	{'data': 'user.idcard', orderable: false},
	{'data': 'factories-count', orderable: false},
	{'data': 'brands-count', orderable: false},
	{'data': 'stores-count', orderable: false}
];
<{/block}>
<{block "datatable-columns-options-delete-confirm"}>var columns_options_delete_confirm = '您确定删除这个代理商：'+full['name']+'吗？';<{/block}>

<{block "datatable-columns-options-plus"}>var columns_options_plus = [
	'<a href="<{'admin'|url}>/store/?filters[aid][in][]='+full['id']+'" data-toggle="tooltip" title="门店列表" class="btn btn-xs btn-default"><i class="fa fa-registered"></i> 门店列表</a>'
];<{/block}>
