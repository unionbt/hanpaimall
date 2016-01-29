<{extends file="admin/extends/list.block.tpl"}>
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

<!-- 基本视图的Block -->

<{block "table-td-plus"}>
<td><{$item->name}></td>
<td><img src="<{'attachment/resize'|url}>?id=<{$item->logo_aid}>&width=80&height=80" alt="LOGO" class="img-rounded"></td>
<td><{$item->factory->name}></td>
<td><{$item->agents()->count()}></td>
<td><{$item->stores()->count()}></td>
<td><{$item->products()->count()}></td>
<{/block}>

<{block "table-td-options-delete-confirm"}>您确定删除这个品牌：<{$item->name}>吗？此操作会删除对应的产品！<{/block}>

<{block "table-td-options-plus"}>
	<a href="<{'admin'|url}>/product/?filters[bid][in][]=<{$item->getKey()}>" data-toggle="tooltip" title="产品列表" class="btn btn-xs btn-default"><i class="fa fa-shopping-cart"></i> 产品列表</a>
<{/block}>
