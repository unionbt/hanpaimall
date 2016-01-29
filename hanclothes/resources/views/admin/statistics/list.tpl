<{extends file="admin/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>对帐<{/block}>
<{block "namespace"}>admin<{/block}>
<{block "name"}>statistics<{/block}>

<{block "filter"}>
<{include file="admin/statistics/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>标题</th>
<th>金额</th>
<{/block}>

<!-- 基本视图的Block -->
<{block "table-td-options"}>
	<td class="text-center">
		<div class="btn-group">
			无
		</div>
	</td>
<{/block}>

<{block "table-td-plus"}>
<td><{$item->event_tag}></td>
<td><{$item->value}></td>
<{/block}>
