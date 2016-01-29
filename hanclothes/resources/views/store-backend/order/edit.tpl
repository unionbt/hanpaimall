<{extends file="store-backend/extends/edit.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{include file="common/editor.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
<{/block}>

<{block "title"}>订单详情<{/block}>
<{block "subtitle"}>编号:<{$_data.id}><{/block}>
<{block "namespace"}>store<{/block}>
<{block "name"}>order<{/block}>
<{block "id"}>deal/<{$_data->getKey()}><{/block}>

<{block "fields"}>
<{include file="store-backend/order/fields.inc.tpl"}>
<{/block}>
