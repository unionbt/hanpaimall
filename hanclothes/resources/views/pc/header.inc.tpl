<header>
    <div class="container">
      <div class="nav">
        <div class="logo">
          <a href="/"><img src="<{'static/img/pc/logo.png'|url}>"></a>
        </div>
        <div class="search">
          <div class="search-list">
            <li class="active">男装<i class="caret"></i></li>
            <li>女装<i class=""></i></li>
            <li>亲子装<i class=""></i></li>
            <li>童装<i class=""></i></li>
            <li>童装<i class=""></i></li>
          </div>
          <label><input type="text"> <a href="">搜索按钮</a></label>
        </div>
        <script type="text/javascript">
            (function($){
                        //header nav 搜索框
              $('.search .search-list li').on('click', function() {
              $('.search .search-list>li>i').removeClass();
              $('.search .search-list>li').removeClass();
              $(this).find('i').addClass('caret');
              $('.search .search-list').prepend($(this));
              $(this).addClass('active');
                });

              $('.search .search-list .active').hover(function() {
              $('.search-list>li').css('display', 'block');
                });

              $('.search .search-list li').hover(function() {
              $('.search .search-list li').css('display', 'block');
                }, function() {
                $('.search .search-list>li').css('display', 'none');
                $('.search .search-list .active').css('display', 'block');
                });

            })(jQuery);
          </script>
        <ul class="navbar">
          <li class="active"><a href="/">首页</a></li>
          <li><a href="<{'classify?search_key=女装'|url}>">时尚女装</a></li>
          <li><a href="<{'classify?search_key=男装'|url}>">精品男装</a></li>
          <li><a href="<{'classify?search_key=亲子童装'|url}>">亲子童装</a></li>
          <li><a href="<{'classify?search_key=潮流靓仔'|url}>">潮流靓仔</a></li>
          <li><a href="<{'classify?search_key=裙裤'|url}>">汉派裙裤</a></li>
          <li><a href="<{'classify?search_key=温馨妈妈'|url}>">温馨妈妈</a></li>
        </ul>
      </div>
    </div>
    <div class="topnav">
      <div class="login"><img src="<{'static/img/pc/icon1_03.png'|url}>"><a href="/">商城首页</a><span>欢迎来到汉派商城！</span><a class="vline" href="<{'auth'|url}>">登录</a><a href="">注册</a></div>
      <div class="itemright"><a class="vline" href="">投诉建议</a><a href="">网站地图</a></div>
      <ul>
        <li><a href="">我的汉派<span class="caret"></span></a></li>
        <li><img src="<{'static/img/pc/icon2_03.png'|url}>"><a href="shopping_cart.html">购物车( 0 )</a></li>
        <li class="collect"><a href="">我的收藏</a><span class="caret"></span>
          <div class="topsc">
            <a href="">最新搜藏宝贝</a>
            <a href="">我搜藏的店铺</a>
          </div>
        </li>
        <li><img src="<{'static/img/pc/icon5_03.png'|url}>"><a href="">手机商城</a></li>
      </ul>
    </div>
  </header>