<{extends file="extends/main.block.tpl"}>

<{block "head-meta-responsive"}>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<{/block}>

<{block "head-styles-plus"}>
  	<link href="<{'static/css/pc/base.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/select_payment.css'|url}>" rel="stylesheet">
<{/block}>

<{block "head-scripts-plus"}>
	<script src="<{'static/js/pc/shipping.js'|url}>"></script>
<{/block}>

<{block "body-container"}>
  <{include file="pc/header.topnav.inc.tpl"}>
   <section> 
    	 <div id="main"> 	
            <div id="should_pay">本次应支付 : <span>￥400.00</span></div>
            <div id="fangshi">选择支付方式</div>
            <form method="get" action="" name="input">
                <div id="select">
                	<div id="select_zhifu">
                        <input type="radio" checked="checked" value="balance_zf" name="pay"> <span><img width="26" height="25" src="<{'static/img/pc/select_pay/yue_pay.jpg'|url}>">  余额支付</span>
                        <input type="radio" value="weixin_zf" name="pay">  <span><img width="25" height="25" src="<{'static/img/pc/select_pay/weixin_ico.jpg'|url}>">  微信支付</span>
                        <input type="radio" value="zfb_zf" name="pay"> <span><img width="24" height="24" src="<{'static/img/pc/select_pay/zfb_ico.jpg'|url}>">  支付宝支付</span>
                      </div>
                    <div id="wx_erwei">
                        <img width="155" height="155" src="<{'static/img/pc/select_pay/erwei_ico.jpg'|url}>">
                        <span>使用微信扫一扫，关注汉派商城平台，并完成支付</span>
                    </div>
                </div>            
                <div id="zh_fh">	
                    <div id="fh_btn">返回</div>
                    <a href="payment_success.html">支付成功</a>
                    <!-- <input type="submit" value="支付成功" id="zf_btn"> -->
                </div>
             </form> 
    	</div>
    </section>
  <{include file="pc/footer.inc.tpl"}>
<{/block}>