<{extends file="store-backend/extends/show.block.tpl"}>

<{block "title"}>店铺二维码<{/block}>

<{block "block-container"}>
<center>
<img src="<{'qrcode/store?id='|url}><{$_store->getKey()}>"/>
</center>
<{/block}>