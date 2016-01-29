<{extends file="admin/extends/edit.block.tpl"}>

<{block "head-plus"}>

<{/block}>

<{block "inline-script-plus"}>
$('#uid').prop('disabled', true);
<{/block}>

<{block "title"}>厂家<{/block}>
<{block "subtitle"}><{$_data.name}><{/block}>

<{block "name"}>factory<{/block}>

<{block "fields"}>
<{include file="admin/factory/fields.inc.tpl"}>
<{/block}>
