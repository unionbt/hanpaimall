<{extends file="factory-backend/extends/edit.block.tpl"}>

<{block "title"}>库存<{/block}>
<{block "subtitle"}><{$_product.title}><{/block}>

<{block "name"}>product-stock<{/block}>

<{block "fields"}>
<{include file="factory-backend/product-stock/fields.inc.tpl"}>
<{/block}>
