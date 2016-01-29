<{extends file="admin/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->


<{block "title"}><{$_product->title|truncate:10:'...':true}>产品属性<{/block}>

<{block "name"}>product-attr<{/block}>

<{block "item_add"}><a href="<{'admin/product-attr/create?pid='|url}><{$_product.id}>">添加</a><{/block}>

<{block "table-th-plus"}>
<th>封面</th>
<th>属性</th>
<{/block}>

<!-- 基本视图的Block -->
<{block "table-td-options-plus"}>
<a href="<{'product-stock?pid='|url}><{$item->pid}>" data-toggle="tooltip" title="库存" class="btn btn-xs btn-danger"><i class="fa fa-pencil"></i></a>
<{/block}>

<{block "table-td-plus"}>
<td class="text-center"><img src="<{'attachment/resize'|url}>?id=<{$item->aid}>&width=80&height=80" alt="avatar" class="img-circle"></td>
<td><{$item->title}></td>
<{/block}>

<{block "table-td-options-delete-confirm"}>您确定删除这个产品：<{$item->title}>吗？<{/block}>