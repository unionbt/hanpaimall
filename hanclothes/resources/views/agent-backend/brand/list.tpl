<{extends file="agent-backend/extends/list.block.tpl"}>
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

<!-- 基本视图的Block -->

<{block "table-td-plus"}>
<td><{$item->name}></td>
<td><img src="<{'attachment/resize'|url}>?id=<{$item->logo_aid}>&width=80&height=80" alt="LOGO" class="img-rounded"></td>
<td><{$item->products()->count()}></td>
<{/block}>

<{block "table-th-options"}><{/block}>

<{block "table-td-options"}>
<{/block}>