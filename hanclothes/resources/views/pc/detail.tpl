<{extends file="extends/main.block.tpl"}>

<{block "head-meta-responsive"}>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<{/block}>

<{block "head-styles-plus"}>
	  <link href="<{'static/js/flexslider/flexslider.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/base.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/detail.css'|url}>" rel="stylesheet">
<{/block}>

<{block "head-scripts-plus"}>
	<script>var $ = jQuery.noConflict();</script>
	<script src="<{'static/js/flexslider/jquery.flexslider-min.js'|url}>"></script>
    <script src="<{'static/js/pc/details_page.js'|url}>"></script>
<{/block}>

<{block "body-container"}>
  <{include file="pc/header.inc.tpl"}>

<section>
    <div class="bannerbox">
      <div class="flexslider">
        <ul class="slides">
          <li>
            <a href=""><img src="<{'static/img/pc/02.jpg'|url}>"></a>
          </li>
          <li>
            <a href=""><img src="<{'static/img/pc/ban_02.png'|url}>"></a>
          </li>
          <!--重复用-->
        </ul>
      </div>
    </div>
    <!--banner结束-->
    <div class="contentbox">
      <div class="bigbox01">
        <div class="details">
          <div class="detailsbox">
            <h3><a href="/">首页</a>&nbsp; &#62; &nbsp;韩版针织包臀打底连衣裙&nbsp; &#62; &nbsp;</h3>
            <div class="leftbox">
              <div class="sp-wrap">
              	<a href="<{'static/img/pc/xq1_03max.jpg'|url}>"><img src="<{'static/img/pc/xq1_03.jpg'|url}>"></a>
              </div>
              <div class="suol">
                <ul>
                  <li><img src="<{'static/img/pc/xq1_03.jpg'|url}>"></li>
                  <li><img src="<{'static/img/pc/xq1_09.jpg'|url}>"></li>
                  <li><img src="<{'static/img/pc/xq1_11.jpg'|url}>"></li>
                  <li><img src="<{'static/img/pc/xq1_13.jpg'|url}>"></li>
                  <li><img src="<{'static/img/pc/xq1_16.jpg'|url}>"></li>
                </ul>
              </div>
              <h5><img src="<{'static/img/pc/details_page/star.png'|url}>" width="15" height="15" /> 收藏宝贝（26人气）</h5>
            </div>
            <div class="rightbox1">
              <div class="mia01">美都汇</div>
              <div class="mia02">韩版针织包臀打底连衣裙</div>
              <div class="mia03">￥
                <span class="danjia">339.00</span>
                <span class="zhekou">
                  <a>5折</a><br/>
                  <s>￥668</s>
                </span>
              </div>
              <div class="mia04">
                <p>运费<span>新会员购物满39元即可享包邮优惠</span></p>
              </div>
              <div class="mia05">
                <span>颜色</span>
                <span class="suolue">
                  <img class="suoluetu" src="<{'static/img/pc/color1_06.jpg'|url}>" width="49" height="60" />
                    <img class="gouxuan" src="<{'static/img/pc/gouxuan.png'|url}>" width="50" height="60">
                </span>
                <span class="suolue">
                  <img class="suoluetu" src="<{'static/img/pc/color1_08.jpg'|url}>" width="49" height="60" />
                    <img class="gouxuan" src="<{'static/img/pc/gouxuan.png'|url}>">
                </span>
                <span class="suolue">
                  <img class="suoluetu" src="<{'static/img/pc/color1_10.jpg'|url}>" / width="49" height="60">
                    <img class="gouxuan" src="<{'static/img/pc/gouxuan.png'|url}>">
                </span>
              </div>
              <div class="mia06">
                <span>尺码</span>
                <ol>
                  <li>S</li>
                  <li>M</li>
                  <li>L</li>
                </ol>
              </div>
              <div class="pro-jia">
                <h5>数量</h5>
                <div class="pro-jia1">
                  <input name="jian" class="shuz11" value="－" type="button" />
                  <input name="geshu" class="shuz22" type="text" value="1" />
                  <input name="jia" class="shuz33" type="button" value="＋" />
                </div>
                <h6>&nbsp; &nbsp;(库存
                <span class="kc_count">23</span>
                件)</h6>
                <div class="spacer"></div>
                <div class="num_stop">
                   <span class="glyphicon glyphicon-minus-sign num_stop_ico"></span>
                    您所填写的数量已经超过库存！
                </div>
              </div>
              <div class="mai07">
                <a class="btn01" href="" data-toggle="modal" data-target=".bs-example-modal-sm">加入购物车</a>
                <a class="btn02" href="" data-toggle="modal" data-target=".bs-example-modal-sm">￥立即购买</a>
              </div>

              <!-- Small modal 模态框 
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button>
-->
              <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                <div class="modal-dialog modal-sm">
                  <div class="modal-content">
                    <h5 class="text-center text-danger">请使用微信扫描二维码购买商品</h5>
                    <div><img src="<{'static\img\pc\weixin_code_145.png'|url}>" class="center-block" alt=""> </div>
                  </div>
                </div>
              </div>

              <div class="mai08">
                <ul>
                  <li>
                    <ul>
                      <li class="mai08_li1">承诺</li>
                      <li><div><img src="<{'static/img/pc/zf_16.jpg'|url}>" width="24" height="23" /></div></li>
                      <li>7天无理由</li>
                    </ul>
                    <ul class="zhif">
                      <li class="mai08_li1">支付</li>
                      <li><div><img src="<{'static/img/pc/zf_20.jpg'|url}>" width="25" height="24" /></div></li>
                      <li>支付宝支付</li>
                    </ul>
                  </li>
                </ul>
              </div>
              <!--右边结束-->
            </div>
          </div>
          <div class="xq01">
            <div class="xql">
                <div class="flbox">
                  <p>商品分类</p>
                  <ul>
                    <li><span>查看所有商品</span></li>
                    <li>最新上架 热门单卖 </li>
                    <li><span>全部商品</span></li>
                    <li>时尚女装</li>
                    <li>精品男装</li>
                    <li>亲子童装</li>
                    <li>潮流靓仔</li>
                    <li>汉派裙裤</li>
                    <li>温馨妈妈</li>
                  </ul>
                </div>
                <div class="xq02">
                  <p class="shangp">买了本商品还买了</p>
                  <!-- 侧边展示栏 -->
                  <div class="liebiao">
                    <ul>
                      <li>
                        <a href="<{'detail'|url}>"><img src="<{'static/img/pc/kids1_08.jpg'|url}>" /></a>
                        <h5><a>小狐狸茧型短毛绒呢子大衣秋冬新品</a></h5>
                        <h4><small>¥&nbsp;</small>189.00 <span>立刻购买</span></h4>
                      </li>
                      <li>
                        <a href="<{'detail'|url}>"><img src="<{'static/img/pc/kids1_08.jpg'|url}>" /></a>
                        <h5><a>童装女童针织毛衣长袖淑女公主套裙</a></h5>
                        <h4><small>¥&nbsp;</small>89.00 <span>立刻购买</span></h4>
                      </li>          
                      <li>
                        <a href="<{'detail'|url}>"><img src="<{'static/img/pc/kids1_08.jpg'|url}>" /></a>
                        <h5><a>童装女童针织毛衣长袖淑女公主套裙</a></h5>
                        <h4><small>¥&nbsp;</small>89.00 <span>立刻购买</span></h4>
                      </li>
                    </ul>
                  </div>
                </div>

            </div>
            <div class="xqr">
                <div class="tabbtn">
                  <ul>
                    <li class="active">商品详情</li>
                    <li>购买评价</li>
                    <li class="jil">成交记录</li>
                  </ul>
                </div>
                <div class="chima">
                    <div class="chimabox1">
                       <!-- 商品详情在这里 -->
                      <img src="<{'static/img/pc/xq3_42.jpg'|url}>" width="597" height="353" class="img01">
                      <img src="<{'static/img/pc/xq3_46.jpg'|url}>" width="645" height="952" class="img02">
                      <img src="<{'static/img/pc/xq3_53.jpg'|url}>" width="640" height="1428" class="img03">
                    </div>
                </div>
            </div>
          </div>
          <!--下面部分-->
          <div class="imgbox01">
            <span>热门推荐</span>
            <a href=""></a>
          </div>
          <div class="rem">
            <ul>
              <li>
                <div class="rem_slide">
                  <a href="">
                    <img src="<{'static/img/pc/listimg6_74.png'|url}>" />
                  </a>
                  <div class="showslide">
                    <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                    <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                    <a href="" class="showfloat-word">立即购买</a>
                  </div>
                </div>
                <h5><a>欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色长袖衬衫男宽松</a></h5>
                <h4><small>¥&nbsp;</small>166.00 <span>立刻购买</span></h4>
              </li>
              <li>
                <div class="rem_slide">
                  <a href="">
                    <img src="<{'static/img/pc/listimg6_76.png'|url}>" />
                  </a>
                  <div class="showslide">
                    <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                    <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                    <a href="" class="showfloat-word">立即购买</a>
                  </div>
                </div>
                <h5><a>欧美风拼接撞色长袖衬衫男宽松长袖衬衫男宽松</a></h5>
                <h4><small>¥&nbsp;</small>166.00 <span>立刻购买</span></h4>
              </li>
              <li>
                <div class="rem_slide">
                  <a href="">
                    <img src="<{'static/img/pc/listimg6_79.png'|url}>" />
                  </a>
                  <div class="showslide">
                    <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                    <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                    <a href="" class="showfloat-word">立即购买</a>
                  </div>
                </div>
                <h5><a>欧美风拼接撞色长袖衬衫男宽松</a></h5>
                <h4><small>¥&nbsp;</small>166.00 <span>立刻购买</span></h4>
              </li>
              <li>
                <div class="rem_slide">
                  <a href="">
                    <img src="<{'static/img/pc/listimg6_83.png'|url}>" />
                  </a>
                  <div class="showslide">
                    <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                    <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                    <a href="" class="showfloat-word">立即购买</a>
                  </div>
                </div>
                <h5><a>欧美风拼接撞色长袖衬衫男宽松</a></h5>
                <h4><small>¥&nbsp;</small>166.00 <span>立刻购买</span></h4>
              </li>
              <li class="last_remen">
                <div class="rem_slide">
                  <a href="">
                    <img src="<{'static/img/pc/listimg6_80.png'|url}>" />
                  </a>
                  <div class="showslide">
                    <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                    <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                    <a href="" class="showfloat-word">立即购买</a>
                  </div>
                </div>
                <h5><a>欧美风拼接撞色长袖衬衫男宽松</a></h5>
                <h4><small>¥&nbsp;</small>166.00 <span>立刻购买</span></h4>
              </li>
            </ul>
          </div>
          <div class="clear"></div>
  </section>

  <{include file="pc/footer.inc.tpl"}>
  <{include file="pc/aside.inc.tpl"}>
  <{include file="pc/search.inc.tpl"}>
<{/block}>

<{block "body-scripts-jquery"}>
(function($) {
	 $('.flexslider').flexslider({
      controlNav: true,
      directionNav: false,
      slideshow: true,
      slideshowSpeed: 3000,
      animation: "fade",
      
    });
})(jQuery);
<{/block}>