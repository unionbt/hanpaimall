<{extends file="extends/main.block.tpl"}>

<{block "head-styles-plus"}>
	<link rel="stylesheet" href="<{'static/css/m/shoppingcart.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/common.css'|url}>">
<style>
input::-webkit-outer-spin-button,input::-webkit-inner-spin-button{-webkit-appearance: none !important;margin: 0;}
input[type="number"]{-moz-appearance:textfield;}
</style>
<{/block}>

<{block "body-container"}>
<form id="form" class="shoppingcart" method="GET" action="<{'m/to/order'|url}>">
	<{csrf_field() nofilter}>
	<input type="hidden" name="uaid" value="0">
	<div class="container-fluid">
		<div class="row headtitle">
			<label class="col-xs-8">商品信息</label>
			<label class="col-xs-4">
				<input class="check-all check" type="checkbox" checked="checked"/><span>&nbsp;&nbsp;全选</span>
			</label> 
		</div>
		<{foreach $_cart_list as $cart}>
		<div class="row checkbox choosegoods">		
			<div>
				<div class="col-xs-5 goodsthumbnail"><a href="<{'m/detail'|url}>?pid=<{$cart.product_size.pid}>"><img class="img-responsive center-block" src="<{'attachment'|url}>?id=<{$cart.product_size.attr.aid}>"></a></div>
				<div class="col-xs-7">
					<div class="goodstitle col-xs-12">
						<a href="<{'m/detail'|url}>?pid=<{$cart.pid}>"><{$cart.product_size.product.title}></a>
					</div>
					<div class="col-xs-12">
						<h5>
							<small class="col-xs-6"><{$cart.product_size.attr.name}> <{$cart.product_size.size_types.name|upper}></small>
							<span class="pull-right">
								<input name="cart[]" type="checkbox" value="<{$cart.psid}>" checked="checked" <{if empty($cart.product_size.count)}>disabled="disabled"<{/if}>>
							</span>
							<div class="clearfix"></div>
						</h5>
					</div>
					<div class="col-xs-12">
						<div class="price col-xs-12">¥&nbsp;<{$cart.product_size->activity(true)->price}></div>
						<div class="addnum pull-right col-xs-12">
							<{if empty($cart.product_size.count)}>
								无货
							<{else}>
							<button class="btn btn-default col-xs-4 cnt_minus" type="button"><i class="glyphicon glyphicon-minus icon-minus"></i></button>
							<span class="col-xs-4 cnt"><input name="buy_cnt[<{$cart.psid}>]" min="0" max="<{$cart.product_size.count}>" type="number" value="<{$cart.count}>" placeholder="1" class="form-control number input-mini text-center" autocomplete="off"></span>
							<button class="btn btn-default col-xs-4 cnt_plus" type="button"><i class="glyphicon glyphicon-plus icon-plus"></i></button>
							<{/if}>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		<{foreachelse}>
		<div class="checkbox choosegoods text-center">
		~你的购物车空空如也~
		</div>
		<{/foreach}>	
	</div>
	<div class="clearfix"></div>
	<div class="container-fluid"><div class="commheight"></div></div>
	<div class="container-fluid row cartfooter">
		<div class="col-xs-7 cartcount">
			合计：<span>¥&nbsp;<label id="total_money">0</label></span>
		</div>
		<div class="col-xs-5 cartgopay text-center">
			<button type="submit" class="btn btn-link btn-block">去支付</button>
		</div>
	</div>
</form>	

<{/block}>


<{block "body-scripts"}>
<script>
//计算总价格
(function( $ ) {
$('#footer-cart').addClass('active');

function calc() {
	$.GET('<{'m/order/calc'|url}>', $('#form').serialize(), function(json){
		if (json.result == 'success')
			$('#total_money').text(json.data.details_money);
		else
		{
			$('#total_money').text(0);
			$.showtips(json);
		}
	}, false);
}

$().ready(function(){
	var $carts = $(":checkbox[name^='cart[']", '#form');
	var $buy_cnts = $("input[name^='buy_cnt[']", '#form');

	//全选处理
	$('.check-all').on('click',function(){
		$carts.prop('checked',this.checked).each(function(){$(this).triggerHandler('click', [true]);});
		calc();
	});

	$carts.on('click', function(e, cancelCalc){
		$('.cnt_minus,.cnt_plus,input[name^="buy_cnt["]', $(this).closest('.choosegoods')).prop('disabled', !this.checked);
		if (!cancelCalc) calc();
	});

	//+-按钮
	$buy_cnts.each(function(){
		var $this = $(this)
		.on('change', function(){
			var t = $(this);
			var v = parseInt(t.val());
			if (v <= 0)
				$.confirm('您希望在购物车里删除本条记录吗？', function(){
					calc();t.closest('.choosegoods').remove();
				}, function(){
					t.val(1);
				});
			else if (v > t.prop('max'))
				t.val(t.prop('max'));
			else calc();
		})
		$('button', $this.closest('.addnum')).on('click', function(e){
			$this.val(parseInt($this.val()) + ($(this).hasClass('cnt_plus') ? 1 : -1)).triggerHandler('change');
		});
	});

	calc();
});
})(jQuery);
</script>

<{/block}>