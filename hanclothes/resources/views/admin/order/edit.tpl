<{extends file="admin/extends/edit.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{include file="common/editor.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
<{/block}>

<{block "title"}>订单详情<{/block}>
<{block "subtitle"}>编号:<{$_data.id}><{/block}>

<{block "name"}>order<{/block}>

<{block "fields"}>
<{include file="admin/order/fields.inc.tpl"}>
<{/block}>
