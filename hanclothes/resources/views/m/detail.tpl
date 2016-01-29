<{extends file="extends/main.block.tpl"}>

<{block "head-meta-seo"}>
<meta name="Keywords" content="<{$_product.keywords}>" />
<meta name="Description" content="<{$_product.description}>" />
<{/block}>
	
<{block "head-scripts-plus"}>
<script src="<{'static/js/flexslider/jquery.flexslider-min.js'|url}>"></script>
<{/block}>

<{block "head-styles-plus"}>
	<link rel="stylesheet" href="<{'static/js/flexslider/flexslider.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/detail.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/common.css'|url}>">
<style>
input::-webkit-outer-spin-button,input::-webkit-inner-spin-button{-webkit-appearance: none !important;margin: 0;}
input[type="number"]{-moz-appearance:textfield;}
</style>
<{/block}>

<{block "body-container"}>
<div class="container-fluid headdetail">
	<div class="row">
		<div class="col-xs-1">
			<a href="javascript:history.go(-1);"><img src="<{'static/img/m/detail/detail-back.png'|url}>" class="img-responsive icon-left center-block"></a>
		</div>
		<div class="col-xs-9 detailtitle text-center"><{$_product.title}></div>
		<div class="col-xs-2">
			<a href="<{'m/shopcart'|url}>"><img src="<{'static/img/m/detail/detail-cart.png'|url}>" class="img-responsive icon-right center-block"></a>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row " >
		<div class="flexslider" id="slider">
			<ul class="slides">
			<{foreach $_product.covers as $cover}>
				<li><img src="<{'attachment/resize'|url}>?id=<{$cover.cover_aid}>&width=200&height=400" class="img-responsive"></li>
			<{/foreach}>
			</ul>
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<div class="clearfix"></div>

<div class="container-fluid">
	<div class="row min-line">
		<div class="col-xs-12">商品详情</div>
	</div>
	<!-- 	
		<div class="row center-block detailbtn btn-group" data-toggle="buttons">
			<label class="btn btn-default btn-lg col-xs-4 active">
				<input type="radio" name="options" id="option1" autocomplete="off" checked>详情
			</label>
			<label class="btn btn-default btn-lg col-xs-4">
				<input type="radio" name="options" id="option2" autocomplete="off">参数
			</label>
			<label class="btn btn-default btn-lg col-xs-4">
				<input type="radio" name="options" id="option3" autocomplete="off">评论
			</label>
		</div>
	-->
</div>

<div class="clearfix"></div>

<div class="detailcontent container-fluid">
	<div class="row ">
		<div class="content">
			<{$_product.content|escape:'noscript' nofilter}>
		</div>
	</div>
</div>

<div class="clearfix"></div>
<h6 class="support text-center">联合创美提供技术支持</h6>
<div class="container-fluid"><div class="commheight"></div></div>

<div class="deailfooter container-fluid row">
	<div id="add_cart" class="col-xs-6 addcart">
		<a class="btn btn-default btn-block" data-toggle="modal" data-target="#size-modal" >
			加入购物车
		</a>
	</div>
	<div id="purch_now" class="col-xs-6 detailbuy">
		<a class="btn btn-block" data-toggle="modal" data-target="#size-modal">
			立即购买
		</a>
	</div>
</div>
<div class="clearfix"></div>

<!-- 模态框（Modal） -->
<div class="modal modal-bottom" id="size-modal" taonex="-1" role="dialog">
	<div class="">
		<div class="modal-content">
		<form id="form" action="<{'m/addcart'|url}>" method="post">
			<{csrf_field() nofilter}>
			<input type="hidden" id="quickly" name="quickly" value="0" autocomplete="off"/>
			<div class="modal-header">
				<a class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
				<div class="container-fluid">
					<div class="row order-title">
						<div class="col-xs-5 avatar-container">
							<div class="img">
								<img id="attr_img" src="<{'attachment'|url}>?id=<{$_product.attrs->find($_product.sizes[0].attr_id)->aid}>" class="img-responsive img-rounded">
							</div>
						</div>
						<div class="col-xs-5 order-title-info">
							<h4>¥<label id="product_price"><{$_product.sizes[0].price}></label></h4>
							<small id="product_price_discount"></small><br/>
							<small>库存<label id="product_stock"><{$_product.sizes[0].count}></label>件</small><br />
							<small>请选择尺码</small>
						</div>
						<!-- <div class="col-xs-2"><i class="glyphicon glyphicon-remove-circle text-right"></i></div> -->
					</div>
				</div><!-- container-fluid end  -->
			 <div class="clearfix"></div>
			</div>
	
			<div class="container-fluid secondcontaner">
				<fieldset class="flcolor">
					<legend>属性</legend>
					<div id="product_attrs" class="btn-group" data-toggle="buttons">
					<{foreach $_product.attrs as $attr}>
						<label data-attr_id="<{$attr.id}>" data-attr_aid="<{$_product.attrs->find($attr.id)->aid}>" class="btn btn-default<{if $attr@index == 0}> active<{/if}>">
							<input type="radio" name="attr_id" autocomplete="off" value="<{$attr.id}>"<{if $_product.sizes[0].attr_id==$attr.id}> checked="checked"<{/if}>><{$attr.name}>
						</label>
					<{/foreach}>
					</div>

				</fieldset>

				<fieldset class="flsize">
					<legend>尺码</legend>
					<div id="chothes_sizes" class="btn-group" data-toggle="buttons">
						<{foreach $_product.sizes as $ps}>
						<label class="btn btn-default<{if $attr@index == 0}> active<{/if}>" style="display:none;" data-price="<{$ps.price}>" data-discount-price="<{$ps->activity(true)->price}>" data-count="<{$ps.count}>" name="size-<{$ps->attr_id}>">
							<input type="radio" name="psid" autocomplete="off" value="<{$ps.id}>"><{$ps.size_types.name|upper}>
						</label>
						<{/foreach}>
					</div>
				</fieldset>

				<!-- 购买数量 -->
				<div class="row goodsnum" >
					<div class="col-xs-4 ">
						<span>购买数量<span>
					</div>
					<div class="col-xs-6 col-xs-offset-2 goodsnumbutton">
						<button id="minus_bnt" type="button" class="btn btn-default col-xs-4"><i class="glyphicon glyphicon-minus icon-minus"></i></button>
						<input id="product_cnt" name="count" type="number" min="1" step="1" class="form-control number col-xs-4 text-center" placeholder="" value="1">
						<button id="add_bnt" type="button" class="btn btn-default col-xs-4"><i class="glyphicon glyphicon-plus icon-plus"></i></button>
					</div>
				</div>
			</div><!-- container-fluid-->
			<div class="clearfix"></div>
			<!-- 确认 button -->
			<button type="submit" class="btn-block confirminfo" disabled="disabled">确认</button>
		</div>
	 </div><!-- /.modal-content -->
	 </form>
</div><!-- /.modal -->
<{/block}>
<{block "body-scripts"}>
<script>
(function($) {
	var $attrs = $('label', '#product_attrs');
	var $sizes = $('label', '#chothes_sizes');
	var $cnt = $('#product_cnt');
	//规格点击
	$sizes.on('click', function(){
		var $this = $(this);
		var count = $this.data('count');
		$cnt.val(count > 0 ? 1 : 0).prop('max', count); //設置最大值
		$('#product_price').text($this.data('price')); //顯示價格
		if($this.data('price')!=$this.data('discount-price'))
			$('#product_price_discount').text($this.data('discount-price')).attr('style','color:green;font-size:15px;'); //顯示價格
		$('#product_stock').text(count); //顯示庫存
		$(':submit','#form').prop('disabled', count <= 0);
	});
	//属性点击
	$attrs.on('click', function(){
		var $this = $(this);
		$sizes.hide().filter('[name="size-'+$this.data('attr_id')+'"]').show().eq(0).trigger('click');
		$('#attr_img').attr('src',"<{'attachment'|url}>?id="+$this.data('attr_aid'));
	}).eq(0).trigger('click');
	//加減按鈕
	$('#minus_bnt,#add_bnt').on('click',function(e){
		var val = parseInt($cnt.val());
		val += $(this).is('#add_bnt') ? 1 : -1;
		if (val <= 0 || val > $cnt.prop('max'))
			return false;
		$cnt.val(val);
	});
	
	//加入购物车
	$("#add_cart").on('click',function(){
		$("#quickly").val(0);
	});
	//立即购买
	$("#purch_now").on('click',function(){
		$("#quickly").val(1);
	});
	//ajax提交
	$("#form").query(function(json){
		$('#size-modal').modal('hide');
	});
	$().ready(function(){
		//$('#slider').find('img').height($(window).width()*0.8);
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