<{extends file="admin/extends/edit.block.tpl"}>

<{block "head-plus"}>

<{/block}>

<{block "inline-script-plus"}>
$('#uid').prop('disabled', true);
<{/block}>

<{block "title"}>代理商<{/block}>
<{block "subtitle"}><{$_data.name}><{/block}>

<{block "name"}>agent<{/block}>

<{block "fields"}>
<{include file="admin/agent/fields.inc.tpl"}>
<{/block}>
