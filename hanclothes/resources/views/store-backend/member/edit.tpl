<{extends file="store-backend/extends/edit.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
$('#avatar_aid').uploader();
$('#username').replaceWith('<p class="form-control-static"><{$_data.username}></p>');
$('#form [name="no-password"]').removeClass('hidden');
$('#password,#password_confirmation').attr('placeholder', '(无需修改则不用填写)');
<{/block}>

<{block "title"}>用户<{/block}>
<{block "subtitle"}><{$_data.username}><{/block}>

<{block "name"}>member<{/block}>

<{block "fields"}>
<{include file="store-backend/member/fields.inc.tpl"}>
<{/block}>
