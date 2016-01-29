<{extends file="extends/main.block.tpl"}>

<{block "head-meta-responsive"}>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<{/block}>

<{block "head-styles-plus"}>
  	<link href="<{'static/css/pc/base.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/shipping.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/shipping_dfk.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/shipping_dfh.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/shipping_dpj.css'|url}>" rel="stylesheet">
  	
<{/block}>

<{block "head-scripts-plus"}>
	<script src="<{'static/js/pc/shipping.js'|url}>"></script>
<{/block}>

<{block "body-container"}>
  <{include file="pc/header.inc.tpl"}>
   <section>
        <div id="main">
            <div id="leftsidebar">
                <div>我的订单</div>
                <ul>
                    <li id="all_btn"><span class="yuandian">•</span><span class="leftlist">所有订单</span></li>
                    <li id="dfk_btn"><span class="yuandian">•</span><span class="leftlist">待付款</span></li>
                    <li id="dfh_btn"><span class="yuandian">•</span><span class="leftlist">待发货</span></li>
                    <li id="dsh_btn"><span class="yuandian">•</span><span class="leftlist">待收货</span></li>
                    <li id="dpj_btn"><span class="yuandian">•</span><span class="leftlist">待评价</span></li>
                </ul>
            </div>
            <!-- 全部订单选项栏开始-->
            <div id="all_title">
                <h2>全部订单</h2>
                <h3>(近3个月订单)</h3>
                <select name="order_type">
                    <option value="dfk">订单状态</option>
                    <option value="dfk">待发货</option>
                    <option value="dfh">待付款</option>
                    <option value="dsh">待收货</option>
                    <option value="dpj">待评价</option>
                </select>
                <p><a href="">查看历史订单 &gt;</a></p>
            </div>
            <!-- 全部订单选项栏结束-->
            <!-- 待付款开始-->
            <div id="dfk_content">
                <ul class="content_title">
                    <li class="dfk_inform inform_title">商品信息</li>
                    <li class="dfk_price price_title">单价</li>
                    <li class="dfk_number number_title">数量</li>
                    <li class="dfk_aftersale aftersale_title">售后</li>
                    <li class="dfk_total total_title">合计</li>
                    <li class="dfk_state state_title">交易状态</li>
                    <li class="dfk_operation operation_title">操作</li>
                </ul>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dfk_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes1.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dfk_price price_list">398.00</li>
                        <li class="dfk_number number_list">1</li>
                        <li class="dfk_aftersale aftersale_list"></li>
                        <li class="dfk_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dfk_state state_list">
                            <p>等待付款</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dfk_operation operation_list">
                            <h3><a href="confirm_order.html">付款</a></h3>
                        </li>
                    </ul>
                </div>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dfk_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes2.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dfk_price price_list">398.00</li>
                        <li class="dfk_number number_list">1</li>
                        <li class="dfk_aftersale aftersale_list"></li>
                        <li class="dfk_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dfk_state state_list">
                            <p>等待付款</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dfk_operation operation_list">
                            <h3><a href="confirm_order.html">付款</a></h3>
                        </li>
                    </ul>
                </div>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dfk_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes3.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dfk_price price_list">398.00</li>
                        <li class="dfk_number number_list">1</li>
                        <li class="dfk_aftersale aftersale_list"></li>
                        <li class="dfk_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dfk_state state_list">
                            <p>等待付款</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dfk_operation operation_list">
                            <h3><a href="confirm_order.html">付款</a></h3>
                        </li>
                    </ul>
                </div>
            </div>
            <!--待付款结束 -->
            <!-- 待发货开始-->
            <div id="dfh_content">
                <ul class="content_title">
                    <li class="dfh_inform inform_title">商品信息</li>
                    <li class="dfh_price price_title">单价</li>
                    <li class="dfh_number number_title">数量</li>
                    <li class="dfh_aftersale aftersale_title">售后</li>
                    <li class="dfh_total total_title">合计</li>
                    <li class="dfh_state state_title">交易状态</li>
                    <li class="dfh_operation operation_title">操作</li>
                </ul>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dfh_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes1.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dfh_price price_list">398.00</li>
                        <li class="dfh_number number_list">1</li>
                        <li class="dfh_aftersale aftersale_list"></li>
                        <li class="dfh_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dfh_state state_list">
                            <p>等待发货</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dfh_operation operation_list">
                            <h3><a href="">取消订单</a></h3>
                        </li>
                    </ul>
                </div>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dfh_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes2.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dfh_price price_list">398.00</li>
                        <li class="dfh_number number_list">1</li>
                        <li class="dfh_aftersale aftersale_list"></li>
                        <li class="dfh_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dfh_state state_list">
                            <p>等待发货</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dfh_operation operation_list">
                            <h3><a href="">取消订单</a></h3>
                        </li>
                    </ul>
                </div>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dfh_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes3.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dfh_price price_list">398.00</li>
                        <li class="dfh_number number_list">1</li>
                        <li class="dfh_aftersale aftersale_list"></li>
                        <li class="dfh_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dfh_state state_list">
                            <p>等待发货</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dfh_operation operation_list">
                            <h3><a href="">取消订单</a></h3>
                        </li>
                    </ul>
                </div>
            </div>
            <!--待发货结束 -         
<!-- 待收货开始-->
            <div id="dsh_content">
                <ul class="content_title">
                    <li class="dsh_inform inform_title">商品信息</li>
                    <li class="dsh_price price_title">单价</li>
                    <li class="dsh_number number_title">数量</li>
                    <li class="dsh_aftersale aftersale_title">售后</li>
                    <li class="dsh_total total_title">合计</li>
                    <li class="dsh_state state_title">交易状态</li>
                    <li class="dsh_operation operation_title">操作</li>
                </ul>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dsh_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes1.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dsh_price price_list">398.00</li>
                        <li class="dsh_number number_list">1</li>
                        <li class="dsh_aftersale aftersale_list"></li>
                        <li class="dsh_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dsh_state state_list">
                            <p>等待收货</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dsh_operation operation_list">
                            <h3><a href="">确认收货</a></h3>
                            <p><a href="service.html">退/换货</a></p>
                            <p><a href="">我要投诉</a></p>
                        </li>
                    </ul>
                </div>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dsh_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes2.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dsh_price price_list">398.00</li>
                        <li class="dsh_number number_list">1</li>
                        <li class="dsh_aftersale aftersale_list"></li>
                        <li class="dsh_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dsh_state state_list">
                            <p>等待收货</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dsh_operation operation_list">
                            <h3><a href="">确认收货</a></h3>
                            <p><a href="service.html">退/换货</a></p>
                            <p><a href="">我要投诉</a></p>
                        </li>
                    </ul>
                </div>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dsh_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes3.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dsh_price price_list">398.00</li>
                        <li class="dsh_number number_list">1</li>
                        <li class="dsh_aftersale aftersale_list"></li>
                        <li class="dsh_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dsh_state state_list">
                            <p>等待收货</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dsh_operation operation_list">
                            <h3><a href="">确认收货</a></h3>
                            <p><a href="service.html">退/换货</a></p>
                            <p><a href="">我要投诉</a></p>
                        </li>
                    </ul>
                </div>
            </div>
            <!--待收货结束 -->
            <!-- 待评价开始-->
            <div id="dpj_content">
                <ul class="content_title">
                    <li class="dpj_inform inform_title">商品信息</li>
                    <li class="dpj_price price_title">单价</li>
                    <li class="dpj_number number_title">数量</li>
                    <li class="dpj_aftersale aftersale_title">售后</li>
                    <li class="dpj_total total_title">合计</li>
                    <li class="dpj_state state_title">交易状态</li>
                    <li class="dpj_operation operation_title">操作</li>
                </ul>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dpj_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes1.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dpj_price price_list">398.00</li>
                        <li class="dpj_number number_list">1</li>
                        <li class="dpj_aftersale aftersale_list"></li>
                        <li class="dpj_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dpj_state state_list">
                            <p>交易成功</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dpj_operation operation_list">
                            <h3><a href="">评价</a></h3>
                        </li>
                    </ul>
                </div>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dpj_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes2.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dpj_price price_list">398.00</li>
                        <li class="dpj_number number_list">1</li>
                        <li class="dpj_aftersale aftersale_list"></li>
                        <li class="dpj_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dpj_state state_list">
                            <p>交易成功</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dpj_operation operation_list">
                            <h3><a href="">评价</a></h3>
                        </li>
                    </ul>
                </div>
                <div class="content_list">
                    <ul class="content_listtop">
                        <li class="order_number">订单号：155050150006</li>
                        <li class="order_time">创建时间：2015-11-05 10:15</li>
                    </ul>
                    <ul class="content_detail">
                        <li class="dpj_inform inform_list">
                            <a href="page.html">
                                <div class="goods_photo">
                                    <img width="90" height="90" src="<{'static/img/pc/shipping/Clothes3.jpg'|url}>">
                                </div>
                                <div class="goods_detail">
                                    <h2>秋冬新款加厚毛呢外套</h2>
                                    <div><span class="kuaizhao">【交易快照】</span><span class="clothcolor">颜色：樱花粉 尺码：M</span></div>
                                </div>
                            </a>
                        </li>
                        <li class="dpj_price price_list">398.00</li>
                        <li class="dpj_number number_list">1</li>
                        <li class="dpj_aftersale aftersale_list"></li>
                        <li class="dpj_total total_list">
                            <p>398.00</p>
                            <p>免运费</p>
                        </li>
                        <li class="dpj_state state_list">
                            <p>交易成功</p>
                            <p><a href="">订单详情</a></p>
                        </li>
                        <li class="dpj_operation operation_list">
                            <h3><a href="">评价</a></h3>
                        </li>
                    </ul>
                </div>
            </div>
            <!--待评价结束 -->
        </div>
    </section>
  <{include file="pc/footer.inc.tpl"}>
<{/block}>