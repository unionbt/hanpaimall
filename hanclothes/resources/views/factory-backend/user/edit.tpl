<{extends file="factory-backend/extends/edit.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
$('#avatar_aid').uploader();
$('#username').replaceWith('<p class="form-control-static"><{$_data.username}></p>');
$('#form [name="no-password"]').removeClass('hidden');
<{/block}>

<{block "title"}>用户<{/block}>
<{block "subtitle"}><{$_data.username}>资料<{/block}>

<{block "name"}>user<{/block}>

<{block "fields"}>
<{include file="factory-backend/user/fields.inc.tpl"}>
<{/block}>
