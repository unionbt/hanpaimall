<{extends file="admin/extends/create.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{include file="common/editor.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
$('#aid').uploader(400, 400, undefined, undefined, 1);
<{/block}>

<{block "title"}><{$_product->title|truncate:10:'...':true}>产品属性<{/block}>

<{block "name"}>product-attr<{/block}>

<{block "fields"}>
<{include file="admin/product-attr/fields.inc.tpl"}>
<{/block}>
