<{extends file="agent-backend/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>品牌<{/block}>

<{block "name"}>brand<{/block}>

<{block "filter"}>
<{include file="agent-backend/brand/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>名称</th>
<th>LOGO</th>
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
	{'data': 'products-count', orderable: false}
];
<{/block}>
<{block "table-th-options"}><{/block}>
<{block "datatable-columns-options"}>
var columns_options = [];
<{/block}>