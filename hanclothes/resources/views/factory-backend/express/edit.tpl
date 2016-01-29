<{extends file="factory-backend/extends/edit.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{include file="common/editor.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
<{/block}>

<{block "title"}>物流详情<{/block}>
<{block "subtitle"}>编号:<{$_data.id}><{/block}>
<{block "namespace"}>factory<{/block}>
<{block "name"}>express<{/block}>

<{block "fields"}>
<{include file="factory-backend/express/fields.inc.tpl"}>
<{/block}>
