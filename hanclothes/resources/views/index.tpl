<{extends file="extends/main.block.tpl"}>

<{block "head-styles"}>
	<link rel="stylesheet" href="<{'static/css/bootstrap/css/bootstrap.min.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/index/index.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/index/commn.css'|url}>">
<{/block}>


<{block "body-container"}>
	<header>
		 <div class="container-fluid">
			<div class="row">
				<a href="classify">
				<div class="col-xs-2 text-center">
				<img src="static/img/bj1_03.png" class="img-responsive icon-left center-block">	
				</div>
				</a>
				<div class="col-xs-8 text-center">
					<input type="text" class="form-control" placeholder="请输入想要搜索的商品">
				</div>
				<a href="shoppingcart.html">
				<div class="col-xs-2 text-center">
					<i class="glyphicon glyphicon-shopping-cart icon-right">
				</div>
				</a>
			</div>
		 </div>

	</header>
	 <div class="clearfix"></div>

	<div class="slider container-fluid">
		<div class="row">
		<ul>
			<li><img src="static/img/banner_02.jpg" alt="" class="img-responsive"></li>
			<li><img src="static/img/banner_02.jpg" alt="" class="img-responsive"></li>
			<li><img src="static/img/banner_02.jpg" alt="" class="img-responsive"></li>
		</ul>
		</div>
	</div>
	 <div class="clearfix"></div>
	<div class="category container-fluid">
		<div class="row">
			<ul>
				<li><a href="classify">
					<img src="static/img/icon1_03.png" class="">
					<div class="text-muted category-text">女装</div>
					</a>
				</li>
				<li><a href="classify">
					<img src="static/img/icon3_05.png" class="">
					<div class="text-muted category-text">男装</div>
					</a>
				</li>
				<li><a href="classify">
					<img src="static/img/icon3_07.png" class="">
					<div class="text-muted category-text">童装</div>
					</a>
				</li>
				<li><a href="classify">
					<img src="static/img/icon3_09.png" class="">
					<div class="text-muted category-text">裤装</div>
					</a>
				</li>
				<li><a href="classify">
					<img src="static/img/icon3_11.png" class="">
					<div class="text-muted category-text">品牌馆</div>
					</a>
				</li>
			</ul>
			<div class="clearfix"></div>
		</div>
	</div>
 <div class="clearfix"></div>
	<div class="product container-fluid">
		<a href="detail.html">
			<div class="row titlebar">
				<div class="col-xs-8 title ">标题是什么呢</div>
				<div class="col-xs-4 price text-danger text-center">¥ 123.34</div>
			</div>
			<div class="row cover">
				<img src="static/img/bj4.png" class="img-responsive">
			</div>
		</a>
	</div>
 <div class="clearfix"></div>
	<div class="product container-fluid">
	<a href="detail.html">
		<div class="row titlebar">
			<div class="col-xs-8 title ">标题是什么呢</div>
			<div class="col-xs-4 price text-danger text-center">¥ 123.34</div>
		</div>
		<div class="row cover">
			<img src="static/img/bj5.png" class="img-responsive">
		</div>
	</a>
	</div>
 <div class="clearfix"></div>
	<div class="product product-last container-fluid">
	<a href="detail.html">
		<div class="row titlebar">
			<div class="col-xs-8 title ">标题是什么呢</div>
			<div class="col-xs-4 price text-danger text-center">¥ 123.34</div>
		</div>
		<div class="row cover">
			<img src="static/img/bj5.png" class="img-responsive">
		</div>
	</a>
	</div>
	
	 <div class="clearfix"></div>

	<footer>
		<div class="container-fluid">
			<div class="row group">
				<a href="index.htm">
				<div class="col-xs-3 item active">
						
					<i class="glyphicon glyphicon-home icon"></i>
					<div class="text">商城</div>

				</div>
				</a>
				<a href="index.htm">
				<div class="col-xs-3 item">
					<i class="glyphicon glyphicon-time icon"></i>
					<div class="text">限时优惠</div>
				</div>
				</a>
				<a href="shoppingcart.html">
				<div class="col-xs-3 item">
					<i class="glyphicon glyphicon-shopping-cart icon"></i>
					<div class="text">购物车</div>
				</div>
				</a>
				<a href="usercenter.html">
				<div class="col-xs-3 item">
					<i class="glyphicon glyphicon-user icon"></i>
					<div class="text">我</div>
				</div>
				</a>
			</div>
		</div>
	</footer>
<{/block}>