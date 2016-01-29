<{extends file="extends/main.block.tpl"}>

<{block "head-meta-seo"}>
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<{/block}>

<{block "head-scripts-plus"}>
<script src="<{'static/js/flexslider/jquery.flexslider-min.js'|url}>"></script>
<{/block}>

<{block "head-styles-plus"}>
	<link rel="stylesheet" href="<{'static/js/flexslider/flexslider.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/common.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/index.css'|url}>">
	
<{/block}>


<{block "body-container"}>
	<{include file="m/search.inc.tpl"}>

	<div class="slider container-fluid">
		<div class="row">
		<div class="flexslider" id="slider">
		<ul class="slides">
			<li><img src="<{'static/img/m/banner_02.jpg'|url}>" alt="" class="img-responsive"></li>
			<li><img src="<{'static/img/m/bj4.png'|url}>" alt="" class="img-responsive"></li>
			<li><img src="<{'static/img/m/bj12.png'|url}>" alt="" class="img-responsive"></li>
		</ul>
		</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="category container-fluid">
		<div class="row">
			<ul>
				<li><a href="<{'m/classify?search_key=女装'|url}>">
					<img class="" src="<{'static/img/m/icon1_03.png'|url}>">
					<div class="text-muted category-text">女装</div>
					</a>
				</li>
				<li><a href="<{'m/classify?search_key=男装'|url}>">
					<img class="" src="<{'static/img/m/icon3_05.png'|url}>">
					<div class="text-muted category-text">男装</div>
					</a>
				</li>
				<li><a href="<{'m/classify?search_key=童装'|url}>">
					<img class="" src="<{'static/img/m/icon3_07.png'|url}>">
					<div class="text-muted category-text">童装</div>
					</a>
				</li>
				<li><a href="<{'m/classify?search_key=裤'|url}>">
					<img class="" src="<{'static/img/m/icon3_09.png'|url}>">
					<div class="text-muted category-text">裤装</div>
					</a>
				</li>
				<li><a href="<{'m/classify?search_key=品牌'|url}>">
					<img class="" src="<{'static/img/m/icon3_11.png'|url}>">
					<div class="text-muted category-text">品牌馆</div>
					</a>
				</li>
			</ul>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="clearfix"></div>
<{foreach $_table_data as $product}>	
	<div class="product container-fluid">
		<div class="row titlebar">
			<div class="col-xs-8 title"><{$product.title}></div>
			<div class="col-xs-4 price text-danger text-center"><{if !empty($product.sizes[0])}>¥ <{$product.sizes[0]->activity()->price}><{/if}></div>
		</div>
		<div class="row cover">
			<a href="<{'m/detail'|url}>?pid=<{$product.id}>" class="col-xs-12 text-center">
				<img src="<{'attachment/resize'|url}>?id=<{$product.covers[0].cover_aid}>&width=640&height=400" class="img-responsive center-block">
			</a>
		</div>
	</div>
<{foreachelse}>
	<div class="product container-fluid" style="height:100px;">
		<div class="row titlebar">
			<div class="col-xs-8 title">暂无关注店铺数据</div>
			<div class="col-xs-4 price text-danger text-center"></div>
		</div>
		<div class="row cover"></div>
	</div>
<{/foreach}>
	<div class="clearfix"></div>
<div class="text-center"><{$_table_data->appends($_input)->render() nofilter}></div>

<{include file="m/footer.inc.tpl"}>
<{/block}>

<{block "body-scripts"}>
<script>
(function($) {
	$('#footer-home').addClass('active');

	$('#search_key').on('keypress',function(e){
		var e = e || window.event;
		if(e.keyCode == 13)
			$('#form').submit();
	});

	$().ready(function(){
		$("#slider").flexslider({
			animation: 'slide',
			directionNav: false,
			controlNav: true,
			touch: true,
		});
	});
})(jQuery);
</script>
<{/block}>