<{extends file="factory-backend/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>产品<{/block}>

<{block "name"}>product<{/block}>

<{block "filter"}>
<{include file="factory-backend/product/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>封面</th>
<th>标题</th>
<th>店铺返利</th>
<th>代理返利</th>
<th>快递费/件</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'covers', orderable: false, render: function(data){
		return data[0] ? '<img src="<{'attachment/resize'|url}>?id='+data[0].cover_aid+'&width=80&height=80" alt="" class="img-rounded">' : '';
	}},
	{'data': 'title'},
	{'data': 'shop_rate',render:function(data){return data+'%';}},
	{'data': 'agent_rate',render:function(data){return data+'%';}},
	{'data': 'express_price'},
];
<{/block}>
<{block "datatable-columns-options-plus"}>
var columns_options_plus = [
	'<a href="product-attr?pid='+full['id']+'" data-toggle="tooltip" title="属性" class="btn btn-xs btn-info"><i class="fa fa-pencil"></i></a>'+
	'<a href="product-stock?pid='+full['id']+'" data-toggle="tooltip" title="库存" class="btn btn-xs btn-danger"><i class="fa fa-pencil"></i></a>'
];
<{/block}>
<{block "datatable-columns-options-delete-confirm"}>var columns_options_delete_confirm = '您确定删除这个产品：'+full['title']+'吗？';<{/block}>
