<{extends file="agent-backend/extends/edit.block.tpl"}>

<{block "head-plus"}>

<{/block}>

<{block "inline-script-plus"}>
$('#uid').prop('disabled', true);
<{/block}>

<{block "title"}>门店<{/block}>
<{block "subtitle"}><{$_data.name}><{/block}>

<{block "name"}>store<{/block}>

<{block "fields"}>
<{include file="agent-backend/store/fields.inc.tpl"}>
<{/block}>
