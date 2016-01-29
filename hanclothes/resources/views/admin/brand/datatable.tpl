<{extends file="admin/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>品牌<{/block}>

<{block "name"}>brand<{/block}>

<{block "filter"}>
<{include file="admin/brand/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>名称</th>
<th>LOGO</th>
<th>厂家</th>
<th>代理数量</th>
<th>门店数量</th>
<th>产品数量</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'name'},
	{'data': "logo_aid", orderable: false, 'render': function(data, type, full){
		return '<img src="<{'attachment/resize'|url}>?id='+data+'&width=80&height=80" alt="LOGO" class="img-rounded">';
	}},
	{'data': 'factory', orderable: false, 'render': function(data, type, full){
		return data ? data.name : '';
	}},
	{'data': 'agents-count', orderable: false},
	{'data': 'stores-count', orderable: false},
	{'data': 'products-count', orderable: false}
];
<{/block}>
<{block "datatable-columns-options-delete-confirm"}>var columns_options_delete_confirm = '您确定删除这个品牌：'+full['name']+'吗？此操作会删除对应的产品！';<{/block}>

<{block "datatable-columns-options-plus"}>var columns_options_plus = [
	'<a href="<{'admin'|url}>/product/?filters[bid][in][]='+full['id']+'" data-toggle="tooltip" title="产品列表" class="btn btn-xs btn-default"><i class="fa fa-shopping-cart"></i> 产品列表</a>'
];<{/block}>
