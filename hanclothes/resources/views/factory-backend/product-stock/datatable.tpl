<{extends file="factory-backend/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}><{$_product->title|truncate:10:'...':true}>产品库存<{/block}>

<{block "name"}>product-stock<{/block}>

<{block "item_add"}><a href="<{'factory/product-stock/create?pid='|url}><{$_product->id}>">添加</a><{/block}>

<{block "table-th-plus"}>
<th>图片</th>
<th>属性</th>
<th>大小</th>
<th>价格</th>
<th>库存</th> 
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'attr', orderable: false, render: function(data){
		return data? '<img src="<{'attachment/resize'|url}>?id='+data.aid+'&width=80&height=80" alt="" class="img-rounded">' : '';
	}},
	{'data': 'attr',render:function(data){return data.name}},
	{'data': 'size_types',render:function(data){return data.name}},
	{'data': 'price'},
	{'data': 'count'},
];
<{/block}>
<{block "datatable-columns-options-delete-confirm"}>var columns_options_delete_confirm = '您确定删除这条<{$_product->title}>:属性为'+full['attr']['name']+',大小为'+full['size_types']['name']+' 库存吗？';<{/block}>
