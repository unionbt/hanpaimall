<{extends file="admin/extends/edit.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{include file="common/editor.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
$('#cover_aids').uploader(400, 400, undefined, undefined, 20);
var $editor_content = UE.getEditor('content1',$.ueditor_default_setting.simple);
<{/block}>

<{block "title"}>产品<{/block}>
<{block "subtitle"}><{$_data.name}><{/block}>

<{block "name"}>product<{/block}>

<{block "fields"}>
<{include file="admin/product/fields.inc.tpl"}>
<{/block}>
