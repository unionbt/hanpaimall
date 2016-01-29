<{extends file="admin/extends/create.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{/block}>

<{block "inline-script-plus"}>
$('#logo_aid').uploader();
<{/block}>

<{block "title"}>品牌<{/block}>

<{block "name"}>brand<{/block}>

<{block "fields"}>
<{include file="admin/brand/fields.inc.tpl"}>
<{/block}>
