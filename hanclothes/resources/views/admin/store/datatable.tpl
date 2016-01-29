<{extends file="admin/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>门店<{/block}>

<{block "name"}>store<{/block}>

<{block "filter"}>
<{include file="admin/store/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>门店名称</th>
<th>负责人</th>
<th>手机</th>
<th>身份证</th>
<th>品牌数量</th>
<th>代理数量</th>
<th>用户数量</th>
<th>二维码</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'name'},
	{'data': 'user.realname', orderable: false},
	{'data': 'user.phone', orderable: false},
	{'data': 'user.idcard', orderable: false},
	{'data': 'brands-count', orderable: false},
	{'data': 'agents-count', orderable: false},
	{'data': 'users-count', orderable: false},
	{'data': null, orderable: false, render: function(data, type, full){
		return '<div class="text-center"><a href="#modal-qrcode" data-toggle="modal" class="enable-tooltip" data-sid="'+full['id']+'" title="" data-original-title="查看二维码"><i class="fa fa-qrcode"></i></a></div>';
	}}
];
<{/block}>
<{block "datatable-columns-options-delete-confirm"}>var columns_options_delete_confirm = '您确定删除这个门店：'+full['name']+'吗？';<{/block}>

<{block "datatable-columns-options-plus"}>var columns_options_plus = [
	'<a href="<{'admin'|url}>/store-user/?filters[sid][in][]='+full['id']+'" data-toggle="tooltip" title="用户列表" class="btn btn-xs btn-default"><i class="fa fa-registered"></i> 用户列表</a>'
];<{/block}>

<{block "body-plus"}>
<{include file="admin/store/qrcode-modal.inc.tpl"}>
<{/block}>