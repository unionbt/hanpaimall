<{extends file="extends/main.block.tpl"}>

<{block "head-meta-responsive"}>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<{/block}>

<{block "head-styles-plus"}>
  	<link href="<{'static/css/pc/base.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/shopping_cart.css'|url}>" rel="stylesheet">
<{/block}>

<{block "head-scripts-plus"}>
	<script src="<{'static/js/pc/shipping.js'|url}>"></script>
<{/block}>

<{block "body-container"}>
  <{include file="pc/header.topnav.inc.tpl"}>
   <section>
    	<div class="topbar">
        	<ul>
            	<li id="may_cart">
                	<div><span>❶</span>我的购物车</div>
                </li>
                <li>
                	<div><span>❷</span>确认订单</div>
                </li>
                <li>
                	<div><span>❸</span>付款方式</div>
                </li>
                <li id="success">
                	<div><span>❹</span>支付成功</div>
                </li>
            </ul>
        </div>
        <div id="content_top">
        	<h2>以下是你的订单信息</h2>
            <p><a href="">继续购物 &gt;</a></p>
        </div>
        <div id="cart_content">
        	<ul class="content_title">
                <li class="cart_inform inform_title">共（2）件商品</li>
                <li class="cart_price price_title">单价</li>
                <li class="cart_number number_title">数量</li>
                <li class="cart_total total_title">小计</li>
                <li class="cart_operation operation_title">删除</li>                
            </ul>
            <div class="content_list">
                <ul class="content_detail">
                     <li class="cart_inform inform_list">
                        <a href="page.html">   
                            <div class="goods_photo">
                                <img width="90" height="90" src="<{'static/img/pc/shopping_cart/Clothes4.jpg'|url}>">
                            </div>
                            <div class="goods_detail">
                                <h2>秋冬新款加厚毛呢外套</h2>
                                <div><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>                        
                            </div>
                        </a>
                    </li>
                    <li class="cart_price price_list">400.00</li>
                    <li class="cart_number number_list">                    	
                        <button name="jiahao" type="button" class="leftbtn"><span>-</span></button>
                        <input type="text" value="1" name="number">
                        <button name="jiahao" type="button" class="rigthbtn"><span>+</span></button>                     	
                    </li>
                    <li class="cart_total total_list">
                        <p>400.00</p>
                    </li>
                    <li class="cart_operation operation_list">
                        <p><img src="<{'static/img/pc/shopping_cart/remove_ico.jpg'|url}>"></p>
                    </li>
                </ul>
            </div>
        </div>
        <div id="content_bottom">
        	<p class="shiyong_hb">使用红包 <img src="<{'static/img/pc/shopping_cart/down_arrow.jpg'|url}>"></p>
           <a value="去结算" type="button" class="jiesuan_btn btn" href="confirm_order.html">去结算</a>
            <span class="zongjin_e">￥400.00</span>
            <div class="zongji">
            	<h4>总计</h4>
                <p>（不含运费）</p>
            </div>
            <div class="hb_dikou">
            	<h4>红包抵扣</h4>
                <p>- ￥168</p>
            </div>
        </div>
        <div class="active" id="empty_chart">
            <div class="kong_chart">
                <img width="108" height="86" src="<{'static/img/pc/shopping_cart/chart.png'|url}>">
                <div>    
                    <h3>您的购物车还是空的</h3>
                    <p>请立即登录查看</p>
                    <span>立即登录</span>
                </div>   
            </div>
        </div>
        <div id="recommend">
        	<div class="recommend_top">
                <h2>新款推荐</h2>
                <img width="25" height="16" src="<{'static/img/pc/shopping_cart/newico.jpg'|url}>">
                <ul>
                	<li class="rec_leftbtn"></li>
                    <li class="rec_rightbtn"></li>
                </ul>
            </div>
            <div class="rec">
                <ul id="rec_list">
                    <li>
                        <a><img width="231" height="307" src="<{'static/img/pc/shopping_cart/rec_clothes1.jpg'|url}>"><span class="rec_slide">私人订制品牌服装</span></a>
                        <span class="rec_name">欧美风拼接撞色长袖衬衫宽松</span>
                        <div>
                            <i><span>￥</span>188.00</i>
                            <p>立刻购买</p>
                        </div>
                    </li>
                    <li>
                        <a><img width="231" height="307" src="<{'static/img/pc/shopping_cart/rec_clothes2.jpg'|url}>"><span class="rec_slide">私人订制品牌服装</span></a>
                        <span class="rec_name">欧美风拼接撞色长袖衬衫松男宽松长袖衬衫男宽松</span>
                        <div>
                            <i><span>￥</span>298.00</i>
                            <p>立刻购买</p>
                        </div>
                    </li>
                    <li>
                        <a><img width="231" height="307" src="<{'static/img/pc/shopping_cart/rec_clothes3.jpg'|url}>"><span class="rec_slide">私人订制品牌服装</span></a>
                        <span class="rec_name">欧美风拼接撞色长袖衬衫男宽松</span>
                        <div>
                            <i><span>￥</span>220.00</i>
                            <p>立刻购买</p>
                        </div>
                    </li>
                    <li>
                        <a><img width="231" height="307" src="<{'static/img/pc/shopping_cart/rec_clothes4.jpg'|url}>"><span class="rec_slide">私人订制品牌服装</span></a>
                        <span class="rec_name">欧美风拼接撞色长袖衬衫男宽松长袖</span>
                        <div>
                            <i><span>￥</span>98.00</i>
                            <p>立刻购买</p>
                        </div>
                    </li>
                    <li>
                        <a><img width="231" height="307" src="<{'static/img/pc/shopping_cart/rec_clothes5.jpg'|url}>"><span class="rec_slide">私人订制品牌服装</span></a>
                        <span class="rec_name">欧美风拼接撞色长袖衬衫男宽松长袖衬衫</span>
                        <div>
                            <i><span>￥</span>168.00</i>
                            <p>立刻购买</p>
                        </div>
                    </li>
                    <li>
                        <a><img width="231" height="307" src="<{'static/img/pc/shopping_cart/rec_clothes1.jpg'|url}>"><span class="rec_slide">私人订制品牌服装</span></a>
                        <span class="rec_name">欧美风拼接撞色长袖衬衫男宽松</span>
                        <div>
                            <i><span>￥</span>188.00</i>
                            <p>立刻购买</p>
                        </div>
                    </li>
                    <li>
                        <a><img width="231" height="307" src="<{'static/img/pc/shopping_cart/rec_clothes2.jpg'|url}>"><span class="rec_slide">私人订制品牌服装</span></a>
                        <span class="rec_name">欧美风拼接撞色长袖衬衫松男宽松长袖衬衫男宽松</span>
                        <div>
                            <i><span>￥</span>298.00</i>
                            <p>立刻购买</p>
                        </div>
                    </li>
                    <li>
                        <a><img width="231" height="307" src="<{'static/img/pc/shopping_cart/rec_clothes3.jpg'|url}>"><span class="rec_slide">私人订制品牌服装</span></a>
                        <span class="rec_name">欧美风拼接撞色长袖衬衫男宽松</span>
                        <div>
                            <i><span>￥</span>220.00</i>
                            <p>立刻购买</p>
                        </div>
                    </li>
                    <li>
                        <a><img width="231" height="307" src="<{'static/img/pc/shopping_cart/rec_clothes4.jpg'|url}>"><span class="rec_slide">私人订制品牌服装</span></a>
                        <span class="rec_name">欧美风拼接撞色长袖衬衫男宽松长袖</span>
                        <div>
                            <i><span>￥</span>98.00</i>
                            <p>立刻购买</p>
                        </div>
                    </li>
                    <li>
                        <a><img width="231" height="307" src="<{'static/img/pc/shopping_cart/rec_clothes5.jpg'|url}>"><span class="rec_slide">私人订制品牌服装</span></a>
                        <span class="rec_name">欧美风拼接撞色长袖衬衫男宽松长袖衬衫</span>
                        <div>
                            <i><span>￥</span>168.00</i>
                            <p>立刻购买</p>
                        </div>
                    </li>
                   
                </ul>
            </div>
        </div>
    </section>
  <{include file="pc/footer.inc.tpl"}>
<{/block}>