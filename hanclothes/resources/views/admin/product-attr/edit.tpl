<{extends file="admin/extends/edit.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{include file="common/editor.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
$('#aid').uploader(400, 400, undefined, undefined, 1);
//var $editor_content = UE.getEditor('content1',$.ueditor_default_setting.simple);
<{/block}>

<{block "title"}>属性<{/block}>
<{block "subtitle"}><{$_data.name}><{/block}>

<{block "name"}>product-attr<{/block}>

<{block "fields"}>
<{include file="admin/product-attr/fields.inc.tpl"}>
<{/block}>
