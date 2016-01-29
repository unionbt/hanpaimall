<{extends file="extends/main.block.tpl"}>

<{block "head-styles-plus"}>
	<link rel="stylesheet" href="<{'static/css/m/pay.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/common.css'|url}>">
<{/block}>

<{block "body-container"}>

	<h5 class="paytitle">支付方式</h5>

	<div class="container-fluid">
		<div class="row setpay">
			<label for="pay1" class="col-xs-12">
				<div class="radio col-xs-2 text-center">
					<input type="radio" name="chosepay" id="pay1"  class="form-control" value="" disabled="disabled" aria-label="">
				</div>
				<div class="col-xs-2 center-block">
					<img src="<{'static/img/m/zf_03.png'|url}>" class="img-responsive center-block">
				</div>
				<div class="col-xs-8">
					<h6 class="col-xs-12">支付宝</h6>
					<small class="col-xs-12">快捷安全，可支持银行卡支付</small>
				</div>
			</label>
		</div>

		<div class="row setpay">
			<label for="pay2" class="col-xs-12">
				<div class="radio col-xs-2 text-center">
					<input type="radio" name="chosepay" id="pay2" class="form-control" value="" checked="checked" aria-label="">
				</div>
				<div class="col-xs-2 center-block">
					<img src="<{'static/img/m/wx_06.png'|url}>" class="img-responsive center-block">
				</div>
				<div class="col-xs-8">
					<h6 class="col-xs-12">微信</h6>
					<small class="col-xs-12">快捷安全，可支持银行卡支付</small>
				</div>
			</label>
		</div>		

		<div class="row setpay">
			<label for="pay3" class="col-xs-12">
				<div class="radio col-xs-2 text-center">
					<input type="radio" name="chosepay" id="pay3" class="form-control" value="" disabled="disabled" aria-label="">
				</div>
				<div class="col-xs-2 center-block">
					<img src="<{'static/img/m/ye_07.png'|url}>" class="img-responsive center-block">
				</div>
				<div class="col-xs-8">
					<h6 class="col-xs-12">余额</h6>
					<small class="col-xs-12">快捷安全，可支持银行卡支付</small>
				</div>
			</label>
		</div>
	</div>
		
 	<div class="clearfix"></div>

	<div class="container-fluid">
		<div class="row paynum">
			<h4 class="col-xs-12 text-right">商品总价：<span class="text-danger">¥&nbsp;<{$_order.details_money}></span></h4>
			<small class="col-xs-12 text-muted text-right">快递 ¥&nbsp;<{$_order.expresses_money}>元</small>
		 </div>
	</div>

	<div class="container-fluid payfooter">
		<div class="row">	
			<div class="col-xs-7 paycount text-center">合计：<span>¥&nbsp;<{$_order.total_money}></span></div>
			<a href="javascript:void(0)" id="pay" class="col-xs-5 paygopay text-center">去支付</a>
		</div>		
	</div>

<{/block}>

<{block "body-scripts"}>
<script>
(function($){
$().ready(function(){
	function jsApiCall()
	{
		WeixinJSBridge.invoke(
			'getBrandWCPayRequest',
			<{$_parameters|json_encode nofilter}>,
			function(res){
				if (res.err_msg == "get_brand_wcpay_request:ok")
				{
					location.href="<{'m/pay/paysuccess?oid='|url}><{$_order.id}>";
				}
			}
		);
	}
	function callpay()
	{
		if (typeof WeixinJSBridge == "undefined"){
			if( document.addEventListener ){
				document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
			}else if (document.attachEvent){
				document.attachEvent('WeixinJSBridgeReady', jsApiCall); 
				document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
			}
		}else{
			jsApiCall();
		}
	}
	$('#pay').on('click',function(){
		var $this = $(this);
		if ($this.prop('disabled')) return false;

		$this.prop('disabled',true).attr('disabled', 'disabled').addClass('disabled');
		callpay();
		$this.delay(2000).queue(function(){
			$this.prop('disabled',false).removeAttr('disabled').removeClass('disabled');
			$this.dequeue();
		});
	});
});
})(jQuery);
</script>
<{/block}>