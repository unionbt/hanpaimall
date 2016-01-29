<{extends file="store-backend/extends/edit.block.tpl"}>

<{block "title"}>银行卡<{/block}>
<{block "subtitle"}><{$_data.id}><{/block}>

<{block "name"}>bankcard<{/block}>

<{block "fields"}>
<{include file="store-backend/bank-card/fields.inc.tpl"}>
<{/block}>


<{block "inline-script-plus"}>
<{/block}>