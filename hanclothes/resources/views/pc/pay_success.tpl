<{extends file="extends/main.block.tpl"}>

<{block "head-meta-responsive"}>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<{/block}>

<{block "head-styles-plus"}>
  	<link href="<{'static/css/pc/base.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/payment_success.css'|url}>" rel="stylesheet">
<{/block}>

<{block "head-scripts-plus"}>
	<script src="<{'static/js/pc/shipping.js'|url}>"></script>
<{/block}>

<{block "body-container"}>
  <{include file="pc/header.topnav.inc.tpl"}>
  <section>    	
        <div id="content_top">
        	<div class="dd_hao">订单号:<span>155050150006</span></div>
            <div class="cj_time">创建时间:<span>2015-11-05 10:15</span></div>
            <p>￥ 398.00</p>
        </div>
        <div id="success">
        	<h1>支付成功</h1>
            <p>您的订单提交成功，我们将会在 5-7 天将宝贝寄出，请耐心等待！</p>
        </div>
        <a id="tiaozhuan_btn" href="shipping.html">转到订单中心查看</a>
   </section>
  <{include file="pc/footer.inc.tpl"}>
<{/block}>