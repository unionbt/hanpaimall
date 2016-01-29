<{extends file="admin/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->


<{block "title"}><{$_product->title|truncate:10:'...':true}>产品库存<{/block}>

<{block "name"}>product-stock<{/block}>

<{block "item_add"}><a href="<{'admin/product-stock/create?pid='|url}><{$_product->id}>">添加</a><{/block}>  

<{block "table-th-plus"}>
<th>图片</th>
<th>属性</th>
<th>大小</th>
<th>价格</th>
<th>库存</th>
<{/block}>

<!-- 基本视图的Block -->
<{block "table-td-plus"}>
<td class="text-center"><img src="<{'attachment/resize'|url}>?id=<{$item->attr->aid}>&width=80&height=80" alt="avatar" class="img-circle"></td>
<td><{$item->attr->name}></td>
<td><{$item->size_types->name}></td>
<td><{$item->price}></td>
<td><{$item->count}></td>
<{/block}>

<{block "table-td-options-delete-confirm"}>您确定删除这条<{$_product->title}>:属性为<{$item->attr->name}>,大小为<{$item->size_types->name}> 库存吗？<{/block}>