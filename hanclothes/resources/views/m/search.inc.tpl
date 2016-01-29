<header>
<form id="form" action="<{'m/classify'|url}>" method="get">
	<div class="container-fluid">
		<div class="row">
			<a href="<{'m/classify'|url}>">
			<div class="col-xs-2">
				<img src="<{'static/img/m/bj1_03.png'|url}>" class="img-responsive icon-left center-block">
			</div>
			</a>
			<div class="col-xs-8 text-center">
				<input type="text" id="search_key" name="search_key" class="form-control" placeholder="请输入想要搜索的商品" value="<{$_search_key}>">
			</div>
			<a href="<{'m/shopcart'|url}>">
			<div class="col-xs-2 text-center">
				<i class="glyphicon glyphicon-shopping-cart icon-right"></i>
			</div>
			</a>
			<div class="clearfix"></div>
		</div>
	</div>
</form>
</header>
<div class="clearfix"></div>
<script>
(function($){
$().ready(function(){
	$('#search_key').on('keypress',function(e){
		var e = e || window.event;
		if(e.keyCode == 13)
			$('#form').submit();
	});
});
})(jQuery);
</script>