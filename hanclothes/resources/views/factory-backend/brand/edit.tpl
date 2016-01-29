<{extends file="factory-backend/extends/edit.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
$('#logo_aid').uploader();
<{/block}>

<{block "title"}>品牌<{/block}>
<{block "subtitle"}><{$_data.name}><{/block}>

<{block "name"}>brand<{/block}>

<{block "fields"}>
<{include file="factory-backend/brand/fields.inc.tpl"}>
<{/block}>
