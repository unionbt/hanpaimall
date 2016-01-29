<{extends file="factory-backend/extends/edit.block.tpl"}>

<{block "head-plus"}>

<{/block}>

<{block "inline-script-plus"}>
$('#uid').prop('disabled', true);
<{/block}>

<{block "title"}>代理商<{/block}>
<{block "subtitle"}><{$_data.name}><{/block}>

<{block "name"}>agent<{/block}>

<{block "fields"}>
<{include file="factory-backend/agent/fields.inc.tpl"}>
<{/block}>
