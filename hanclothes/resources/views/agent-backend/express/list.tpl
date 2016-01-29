<{extends file="factory-backend/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>物流<{/block}>
<{block "namespace"}>factory<{/block}>
<{block "name"}>express<{/block}>

<{block "filter"}>
<{include file="factory-backend/express/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>物流方式</th>
<th>配送地址</th>
<th>配送店铺</th>
<th>快递公司</th>
<th>快递单号</th>
<th>状态</th>
<{/block}>

<!-- 基本视图的Block -->
<{block "table-td-options"}>
	<td class="text-center">
		<div class="btn-group">
			<a href="<{''|url}>/<{block "namespace"}>factory<{/block}>/<{block "name"}><{/block}>/<{$item->getKey()}>/edit" data-toggle="tooltip" title="查看" class="btn btn-xs btn-default"><i class="fa fa-pencil"></i></a>
		</div>
	</td>
<{/block}>

<{block "table-td-plus"}>
<td><{$item->express_type}></td>
<td><{$item->uaid}>%</td>
<td><{$item->sid}>%</td>
<td><{$item->express_name}></td>
<td><{$item->no}></td>
<td><{$item->status}></td>
<{/block}>
