<{extends file="extends/main.block.tpl"}>

<{block "head-meta-responsive"}>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<{/block}>

<{block "head-styles-plus"}>
	<link href="<{'static/js/flexslider/flexslider.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/base.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/index.css'|url}>" rel="stylesheet">
<{/block}>

<{block "head-scripts-plus"}>
	<script src="<{'static/js/flexslider/jquery.flexslider-min.js'|url}>"></script>
<{/block}>

<{block "body-container"}>
<{include file="pc/header.inc.tpl"}>
<div class="flexbox">
    <div class="flexslider">
      <ul class="slides">
        <li>
          <a href=""><img src="<{'static/img/pc/ban_02.png'|url}>"></a>
        </li>
        <li>
          <a href=""><img src="<{'static/img/pc/02.jpg'|url}>"></a>
        </li>
        <!--重复用-->
      </ul>
    </div>
  </div>

<div class="content">
    <div class="party1">
      <div class="left">
        <h5><a href=""><img src="<{'static/img/pc/index-1.png'|url}>">商家入驻申请</a></h5>
        <div>
          <a href=""><img src="<{'static/img/pc/logo1_07.png'|url}>"></a>
        </div>
        <h6>最新入驻商家</h6>
      </div>
      <div class="middle">
        <h5>新款推荐<sub></sub></h5>
        <div class="flexslider">
          <ul class="slides">
            <li>
              <div class="li-item">
                <div class="li-item1">
                  <h4><a href="">酷玩街酷玩街酷玩街酷玩街酷玩街酷玩街</a></h4>
                  <h6>可穿戴手链可穿戴手链可穿戴手链可穿戴手链</h6>
                  <h6>可穿戴手链</h6>
                  <a href=""><img src="<{'static/img/pc/img1_07.png'|url}>"></a>
                </div>
                <div class="li-item2">
                  <a href=""><img src="<{'static/img/pc/plus.png'|url}>"></a>
                </div>
                <div class="solid"></div>
                <!--  中间实线 -->
              </div>
              <div class="li-item">
                <div class="li-item1">
                  <h4><a href="">酷玩街</a></h4>
                  <h6>可穿戴手链</h6>
                  <h6>可穿戴手链</h6>
                  <a href=""><img src="<{'static/img/pc/img1_07.png'|url}>"></a>
                </div>
                <div class="li-item2">
                  <a href=""><img src="<{'static/img/pc/img1_07.png'|url}>"></a>
                </div>
              </div>
            </li>
            <li>
              <div class="li-item">
                <div class="li-item1">
                  <h4><a href="">酷玩街酷玩街酷玩街酷玩街酷玩街酷玩街</a></h4>
                  <h6>可穿戴手链可穿戴手链可穿戴手链可穿戴手链</h6>
                  <h6>可穿戴手链</h6>
                  <a href=""><img src="<{'static/img/pc/img1_07.png'|url}>"></a>
                </div>
                <div class="li-item2">
                  <a href=""><img src="<{'static/img/pc/img1_07.png'|url}>"></a>
                </div>
                <div class="solid"></div>
                <!--  中间实线 -->
              </div>
              <div class="li-item">
                <div class="li-item1">
                  <h4><a href="">酷玩街</a></h4>
                  <h6>可穿戴手链</h6>
                  <h6>可穿戴手链</h6>
                  <a href=""><img src="<{'static/img/pc/img1_07.png'|url}>"></a>
                </div>
                <div class="li-item2">
                  <a href=""><img src="<{'static/img/pc/img1_07.png'|url}>"></a>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div class="right">
        <ul>
          <li index=0 class="active">公告</li>
          <li index=1>新闻</li>
          <li index=2>留言</li>
        </ul>
        <div class="tab">
          <!-- 公告-->
          <h6><a href="">公告公告</a></h6>
          <h6><a href=""> 运动着时尚 Nike潮鞋专场</a></h6>
          <h6><a href=""> 雅诗兰黛低至37元</a></h6>
          <h6><a href=""> 运动着时尚 Nike潮鞋专场雅</a></h6>
        </div>
        <div class="tab">
          <!-- 新闻-->
          <h6><a href=""> 新闻</a></h6>
          <h6><a href=""> 运动着时尚 Nike潮鞋专场</a></h6>
          <h6><a href=""> 雅诗兰黛低至37元</a></h6>
          <h6><a href=""> 运动着时尚 Nike潮鞋专场雅</a></h6>
        </div>
        <div class="tab">
          <!-- 留言-->
          <h6><a href=""> 留言留言留言留言</a></h6>
          <h6><a href=""> 运动着时尚 Nike潮鞋专场</a></h6>
          <h6><a href=""> 雅诗兰黛低至37元</a></h6>
          <h6><a href=""> 运动着时尚 Nike潮鞋专场雅</a></h6>
        </div>
      </div>
    </div>
    <div class="party2">
      <div class="party2-hot">
        <a href=""><img src="<{'static/img/pc/img6_07.png'|url}>"></a>
      </div>
      <div class="item1">
        <div class="item1-detail">
          <h4><a href="<{'detail'|url}>"> 欧美风拼接撞色长袖衬衫女欧 欧美风拼接撞色长袖衬衫女欧 欧美风拼接撞色长袖衬衫女欧</a></h4>
          <h5><small>¥&nbsp;</small>166.00 <br /></h5>
          <h6>雪纺柔软型</h6>
        </div>
        <div class="item1-img">
          <a href="<{'detail'|url}>"><img src="<{'static/img/pc/img6_11.png'|url}>"></a>
        </div>
      </div>
      <div class="item2">
        <div class="item2-detail">
          <h4><a href="<{'detail'|url}>"> 欧美风拼接撞色长袖衬衫女欧</a></h4>
          <h5><small>¥&nbsp;</small>166.00 <br /></h5>
          <h6>雪纺柔软型</h6>
        </div>
        <div class="item2-img">
          <a href="<{'detail'|url}>"><img src="<{'static/img/pc/img6_09.png'|url}>"></a>
        </div>
      </div>
      <div class="item3">
        <div class="item3-detail">
          <h4><a href="<{'detail'|url}>"> 欧美风拼接撞色长袖衬衫女欧袖衬衫女欧袖衬衫女欧袖衬衫女欧</a></h4>
          <h5><small>¥&nbsp;</small>166.00 <br /></h5>
          <h6>雪纺柔软型</h6>
        </div>
        <div class="item3-img">
          <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg1_33.png'|url}>"></a>
        </div>
      </div>
      <div class="item4">
        <div class="item4-img">
          <a href="<{'detail'|url}>"><img src="<{'static/img/pc/img6_19.png'|url}>"></a>
        </div>
        <div class="item4-detail">
          <h4><a href="<{'detail'|url}>"> 欧美风拼接撞色长袖衬衫女欧袖衬衫女欧袖衬衫女欧袖衬衫女欧</a></h4>
          <h5><small>¥&nbsp;</small>166.00 <br /></h5>
          <h6>雪纺柔软型</h6>
        </div>
      </div>
      <div class="item5">
        <div class="item5-detail">
          <h4><a href="<{'detail'|url}>"> 欧美风拼接撞色长袖衬衫女欧袖衬衫女欧袖衬衫女欧袖衬衫女欧</a></h4>
          <h5><small>¥&nbsp;</small>166.00 <br /></h5>
          <h6>雪纺柔软型</h6>
        </div>
        <div class="item5-img">
          <a href="<{'detail'|url}>"><img src="<{'static/img/pc/img6_22.png'|url}>"></a>
        </div>
      </div>
    </div>
    <!-- -->
    <div class="show">
      <h3>时尚女装<br /><small>WOMEN</small><a href="<{'classify?search_key=女装'|url}>" class="text-right"><img src="<{'static/img/pc/icon5_29.png'|url}>" alt=""></a></h3>
      <ul>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg1_40.png'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg1_33.png'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg4.png'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg2.png'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg3.png'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
      </ul>
    </div>
    <div class="banner">
      <ul>
        <li>
          <a href=""><img src="<{'static/img/pc/logo1_49.png'|url}>"></a>
        </li>
        <li>
          <a href=""><img src="<{'static/img/pc/logo1_07.png'|url}>"></a>
        </li>
        <li>
          <a href=""><img src="<{'static/img/pc/logo1_51.png'|url}>"></a>
        </li>
        <li>
          <a href=""><img src="<{'static/img/pc/logo1_55.png'|url}>"></a>
        </li>
        <li>
          <a href=""><img src="<{'static/img/pc/logo1_57.png'|url}>"></a>
        </li>
        <li>
          <a href=""><img src="<{'static/img/pc/logo1_59.png'|url}>"></a>
        </li>
        <li>
          <a href=""><img src="<{'static/img/pc/logo1_61.png'|url}>"></a>
        </li>
        <li>
          <a href=""><img src="<{'static/img/pc/logo1_63.png'|url}>"></a>
        </li>
      </ul>
    </div>
    <div class="show">
      <h3>精品男装<br /><small>MEN</small> <a href="<{'classify?search_key=男装'|url}>" class="text-right"><img src="<{'static/img/pc/icon5_29.png'|url}>" alt=""></a> </h3>
      <ul>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg6_74.png'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg6_76.png'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg6_79.png'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg6_80.png'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/listimg6_83.png'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
      </ul>
    </div>
    <div class="show">
      <h3>亲子童装<br /><small>KIDS</small><a href="<{'classify?search_key=童装'|url}>" class="text-right"><img src="<{'static/img/pc/icon5_29.png'|url}>" alt=""></a></h3>
      <ul>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/kids1_08.jpg'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/kids1_10.jpg'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/kids1_12.jpg'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/kids1_14.jpg'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
        <li>
          <div class="showimg">
            <a href="<{'detail'|url}>"><img src="<{'static/img/pc/kids1.jpg'|url}>"></a>
            <div class="showfloat">
              <a href=""><img src="<{'static/img/pc/cart.png'|url}>" alt=""></a>
                <a href=""><img src="<{'static/img/pc/sc_13.png'|url}>" alt=""></a>
                <a href="" class="showfloat-word">立即购买</a>
            </div>
          </div>
          <h5><a href="<{'detail'|url}>">欧美风拼接撞色长袖衬衫男宽松欧美风拼接撞色</a></h5>
          <h4><small>¥&nbsp;</small>166.00 <span>已售366件</span></h4>
        </li>
      </ul>
    </div>
  </div>
	
  <{include file="pc/footer.inc.tpl"}>
  <{include file="pc/aside.inc.tpl"}>
  <{include file="pc/search.inc.tpl"}>
<{/block}>

<{block "body-scripts-jquery"}>
(function($) {
	 $('.flexbox .flexslider').flexslider({
      controlNav: true,
      directionNav: false,
      slideshow: true,
      slideshowSpeed: 3000,
      pauseOnHover: true
    });
})(jQuery);

  (function($) {
    //新款推荐 滑动展示 
    $('.middle .flexslider').flexslider({
      animation: "slide",
      controlNav: false,
      directionNav: true,
      slideshow: true,
      slideshowSpeed: 3000,
      pauseOnHover: true
    });
  })(jQuery);

  (function($){
    //鼠标放商品图显示立即购买按钮
    $('.show .showimg').hover(
      function() {$(this).find('.showfloat').animate({"top": "-36px","opacity": "0.8"}, 400, 'swing');},
      function() {$(this).find('.showfloat').stop(true, false).animate({"top": "0px","opacity": "0"}, 400, 'swing');}
    );
  })(jQuery);


  (function($) {
   //首页公告新闻tab切换
    var litab = $('.party1 .right ul>li');
    var tab = $('.party1 .right .tab');
    tab.hide();
    tab.eq(0).show();
    litab.on('click', function() {
      litab.removeClass('active');
      $(this).addClass('active');
      tab.hide();
      tab.eq($(this).attr('index')).show();
    });
  })(jQuery);



<{/block}>