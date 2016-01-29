<{extends file="admin/extends/create.block.tpl"}>

<{block "title"}><{$_product->title|truncate:10:'...':true}>产品库存<{/block}>

<{block "name"}>product-stock<{/block}>

<{block "fields"}>
<{include file="admin/product-stock/fields.inc.tpl"}>
<{/block}>
