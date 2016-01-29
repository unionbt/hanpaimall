<{extends file="extends/main.block.tpl"}>

<{block "head-styles-plus"}>
	<link rel="stylesheet" href="<{'static/css/m/pay.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/common.css'|url}>">
<{/block}>

<{block "body-container"}>
	<div class="container-fluid">
		<div class="row pay-order-num">
			<div class="col-xs-9"><p>订单号：<{sprintf("%010d",$_order.id)}></p></div>
			<div class="col-xs-3"><span>¥&nbsp;<{$_order.total_money}></span></div>
		</div>

	</div>
 <div class="clearfix"></div>
	<div class="container-fluid pay-success">
		<div class="row text-center text-success">
			<h4><i class="glyphicon glyphicon-ok-circle">支付成功</i></h4>
		</div>
		<h5 class="row text-muted">您的订单已提交成功，我们将会在5-7天内将宝贝寄出，请耐心等待!</h5>
	</div>
	 <div class="clearfix"></div>
	<div class="container-fluid text-center">
		<a  href="<{'m/ucenter'|url}>"><button type="button" class="btn btn-default btn-lg pay-other">转到订单中心查看</button></a>
	</div>
<{/block}>