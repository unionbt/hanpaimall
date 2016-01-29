<{extends file="factory-backend/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}><{$_product->title|truncate:10:'...':true}>产品属性<{/block}>

<{block "name"}>product-attr<{/block}>

<{block "item_add"}><a href="<{'factory/product-attr/create?pid='|url}><{$_product.id}>">添加</a><{/block}>

<{block "table-th-plus"}>
<th>图片</th>
<th>属性</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'aid', orderable: false, render: function(data){
		return data ? '<img src="<{'attachment/resize'|url}>?id='+data+'&width=80&height=80" alt="" class="img-rounded">' : '';
	}},
	{'data': 'name'},
];
<{/block}>
<{block "datatable-columns-options-plus"}>
var columns_options_plus = [
	'<a href="product-stock?pid='+full['pid']+'" data-toggle="tooltip" title="库存" class="btn btn-xs btn-danger"><i class="fa fa-pencil"></i></a>'
];
<{/block}>
<{block "datatable-columns-options-delete-confirm"}>var columns_options_delete_confirm = '您确定删除这个产品：'+full['title']+'吗？';<{/block}>
