<{extends file="factory-backend/extends/create.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{include file="common/editor.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
$('#cover_aids').uploader(640, 400, undefined, undefined, 20);
var $editor_content = UE.getEditor('content1',$.ueditor_default_setting.simple);
<{/block}>

<{block "title"}>产品<{/block}>

<{block "name"}>product<{/block}>

<{block "fields"}>
<{include file="factory-backend/product/fields.inc.tpl"}>
<{/block}>
