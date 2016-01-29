<{extends file="extends/main.block.tpl"}>

<{block "head-styles-plus"}>
	<link rel="stylesheet" href="<{'static/js/flexslider/flexslider.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/classify.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/common.css'|url}>">
<{/block}>

<{block "head-scripts-plus"}>
<script src="<{'static/js/flexslider/jquery.flexslider-min.js'|url}>"></script>
<script src="<{'static/js/masonry.pkgd.min.js'|url}>"></script>
<script src="<{'static/js/imagesloaded.pkgd.min.js'|url}>"></script>
<{/block}>

<{block "body-container"}>
	
	<{include file="m/search.inc.tpl"}>
	
	<div class="container-fluid">
		<div class="row">
			<div class="flexslider" id="slider">
				<ul class="slides">
					<li><img src="<{'static/img/m/ban.jpg'|url}>" alt="" class="img-responsive"></li>
					<li><img src="<{'static/img/m/ban.jpg'|url}>" alt="" class="img-responsive"></li>
					<li><img src="<{'static/img/m/ban.jpg'|url}>" alt="" class="img-responsive"></li>
				</ul>
			</div>
		</div>
	</div>
		
	<h3><{$_skey}>每日9点更新</h3>
	
	<div class="container-fluid">
		<div class="row masonry-container" id="masonry-container">

			<{foreach $_table_data as $product}>
				<div class="col-xs-6 sortitem item">
					<div class="col-xs-12">
						<img src="<{'attachment/resize'|url}>?id=<{$product.covers[0].cover_aid}>&width=640&height=280" alt="" class="img-responsive">
					</div>
					<h5 class="col-xs-12"><{$product.title|truncate:18:'...':true}></h5>
					<h6 class="col-xs-12">
						<b class="text-danger"><{if !empty($product.sizes[0])}>¥&nbsp;<{$product.sizes[0].price}><{/if}></b>
						<span class="text-muted"><{$product.content|strip_tags|truncate:20:'...':true}></span>
					</h6>

				</div>				
			<{foreachelse}>
			<{$_table_data->appends($_input)->render() nofilter}>
				<div class="col-xs-6 sortitem">
					<a>
						<div class="rounded">
							<div class="caption">
								<h5>暂无检索商品数据.</h5>
								<div class="row detail">
									<div class="col-xs-3 price"></div>
									<div class="col-xs-9 descript"></div>
								</div>
							</div>
						</div>
					</a>
				</div>
			<{/foreach}>

		</div>
	</div>
			<!--div class="sort sortitem col-xs-6">				
				<div class="row">
					<div class="col-xs-6 sortitem-left text-center">
						<button class="btn btn-default btn-block">A字裙</button>
					</div>
					<div class="col-xs-6 sortitem-right text-center">
						<button class="btn btn-default btn-block">长裙</button>
					</div>
					<div class="col-xs-6 sortitem-left text-center">
						<button class="btn btn-default btn-block">大摆型</button>
					</div>
					<div class="col-xs-6 sortitem-right text-center">
						<button class="btn btn-default btn-block">一步裙</button>
					</div>
					<div class="col-xs-6 sortitem-left text-center">
						<button class="btn btn-default btn-block">百褶裙</button>
					</div>
					<div class="col-xs-6 sortitem-right text-center">
						<button class="btn btn-default btn-block">甜美</button>
					</div>
					<div class="col-xs-6 sortitem-left text-center">
						<button class="btn btn-default btn-block">名媛</button>
					</div>
					<div class="col-xs-6 sortitem-right text-center">
						<button class="btn btn-default btn-block">欧美</button>
					</div>
				</div>
			</div>
			<div class="clearfix">
		</div-->

<!-- 联合创美 -->
	<h6 class="support text-center">联合创美提供技术支持</h6>
		
	<{include file='m/footer.inc.tpl'}>
<{/block}>



<{block "body-scripts"}>
<script>
(function( $ ) {
$().ready(function(){
	$('#footer-classify').addClass('active');

	var $container = $('#masonry-container');
	$container.imagesLoaded( function () {
		$container.masonry({
			columnWidth: '.sortitem',
			itemSelector: '.sortitem'
		});
	});

	$("#slider").flexslider({
		animation: 'slide',
		directionNav: false,
		controlNav: false,
		touch: true,
	});
	
});
})(jQuery);
</script>
<{/block}>