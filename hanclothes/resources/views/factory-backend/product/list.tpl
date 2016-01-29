<{extends file="admin/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>产品<{/block}>

<{block "name"}>product<{/block}>

<{block "filter"}>
<{include file="admin/product/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>封面</th>
<th>标题</th>
<th>店铺返利</th>
<th>代理返利</th>
<th>快递费/件</th>
<{/block}>

<!-- 基本视图的Block -->
<{block "table-td-options-plus"}>
<a href="<{'product-attr?='|url}><{$item->getKey()}>" data-toggle="tooltip" title="属性" class="btn btn-xs btn-info"><i class="fa fa-pencil"></i></a>
<a href="<{'product-stock?='|url}><{$item->getKey()}>" data-toggle="tooltip" title="库存" class="btn btn-xs btn-danger"><i class="fa fa-pencil"></i></a>
<{/block}>

<{block "table-td-plus"}>

<td class="text-center"><img src="<{'attachment/resize'|url}>?id=<{$item->cover.cover_aid}>&width=80&height=80" alt="avatar" class="img-circle"></td>
<td><{$item->title}></td>
<td><{$item->shop_rate}>%</td>
<td><{$item->agent_rate}>%</td>
<td><{$item->express_price}></td>
<{/block}>

<{block "table-td-options-delete-confirm"}>您确定删除这个产品：<{$item->title}>吗？<{/block}>