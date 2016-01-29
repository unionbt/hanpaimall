<{extends file="extends/main.block.tpl"}>

<{block "head-styles-plus"}>
	<link rel="stylesheet" href="<{'static/css/m/common.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/usercenter.css'|url}>">
	
<{/block}>

<{block "head-scripts-plus"}>

<{/block}>

<{block "body-container"}>

<div class="container-fluid">
	<div class="userinfo row">
		<div class="col-xs-4 userinfo_1 text-center">
			<p>可用红包</p>
			<h4><{$_user.finance.bonus}></h4-->
		</div>
		<div class="col-xs-4 text-center userinfo_2">
			<img src="<{'attachment'|url}>?id=<{$_user.avatar_aid}>" alt="..." class="img-circle img-responsive center-block">
			<div><{$_user.nickname}> <i class="glyphicon glyphicon-user icon"></i></div>
		</div>
		<div class="col-xs-4 userinfo_1 text-center">
			<p>账户余额</p>
			<h4><{$_user.finance.money}></h4>
		</div>		
	</div>
</div>
<div class="clearfix"></div>
<div class="container-fluid btn-header">
	<div class="row  center-block order_status text-center">
		<a href="<{'m/ucenter'|url}>?status=<{App\Order::INIT}>" class="btn btn-default<{if $_status==App\Order::INIT}> active<{/if}>">待付款</a>
		<a href="<{'m/ucenter'|url}>?status=<{App\Order::PAID}>" class="btn btn-default<{if $_status==App\Order::PAID}> active<{/if}>">已付款</a>
		<a href="<{'m/ucenter'|url}>?status=<{App\Order::DEALT}>" class="btn btn-default<{if $_status==App\Order::DEALT}> active<{/if}>">已完成</a>
		<a href="<{'m/ucenter'|url}>" class="btn btn-default<{if empty($_status)}> active<{/if}>">全部</a>
	</div>
</div>
<div class="clearfix"></div>

<{foreach $_order_list as $order_item}>
	<div class="orderinfo container-fluid"><!-- 订单信息 -->
		<div class="row order-num">
			<ul>
				<li class="col-xs-7 text-left text-muted">订单：<{sprintf("%010d",$order_item.id)}></li>
				<li class="col-xs-5 text-center text-muted"><{$order_item.created_at}></li>
			</ul>
		</div>
		<{foreach $order_item.details as $detail}>
		<div class="row orderinfo-bd">
			<div class="col-xs-4">
				<a href="<{'m/detail'|url}>?pid=<{$detail.pid}>">
					<img src="<{'attachment/resize'|url}>?id=<{$detail.size.attr.aid}>&width=186&height=170" class="img-responsive">
				</a>
			</div>	
			<div class="col-xs-8 orderinfo-title">
				<div class="col-xs-12"><a href="<{'m/detail'|url}>?pid=<{$detail.pid}>"><{$detail.product.title}></a></div>
				<span class="text-muted col-xs-12"><{$detail.size.attr.name}> <{$detail.size.size_types.name|upper}></span>
				<h5 class="text-left col-xs-12">¥&nbsp;<{$detail.size.price}><small>&nbsp;&nbsp;&#215;<{$detail.count}></small></h5>
			</div>
		</div>
			<{if $detail@last}>
				<div class="row text-right orderinfo-btn">
					<h6 class="text-right text-danger col-xs-12"><span class="text-muted">快递&nbsp;¥&nbsp;<{$order_item.expresses_money}></span><{$order_item->bonus() nofilter}>&nbsp;&nbsp;合计：¥<{$order_item.total_money}></h6>
					<{if $order_item.status==App\Order::INIT}>
					<a class="btn btn-default text-muted" href="<{'m/pay/order'|url}>?id=<{$order_item->getKey()}>">去支付</a>
					<{else if $order_item.status==App\Order::PAID}>
					<span class="col-xs-12 text-muted">已支付</span>
					<{else if $order_item.status==App\Order::DELIVERED}>
					<a class="btn btn-default text-muted" href="<{'m/order/dealing'|url}>?id=<{$order_item->getKey()}>" method="GET">确认收货</a>
					<{else if $order_item.status==App\Order::DEALT}>
					<span class="col-xs-12 text-muted">已完成</span>
					<{else if $order_item.status==App\Order::CANCELED}>
					<span class="col-xs-12 text-muted">已取消</span>
					<!--a class="btn btn-default" href="#"><span  class="text-muted">申诉</span></a>
					<a class="btn btn-default" href="service.html"><span  class="text-muted">退换货</span></a-->
					<{/if}>
				</div>
				<{/if}>

	<{/foreach}>
	</div>
	<div class="clearfix"></div>
<{foreachelse}>
	<div class="orderinfo container-fluid">
		<div class="row order-num">
			<ul>
				<li class="col-xs-7 text-left text-muted">暂无订单信息</li>
			</ul>
		</div>
	</div> 
	<div class="clearfix"></div>
<{/foreach}>		
<{include file="m/footer.inc.tpl"}>
<{/block}>


<{block "body-scripts"}>
<script>
(function( $ ) {
	$('#footer-ucenter').addClass('active');

	$('a[method]').query();
})(jQuery);
</script>
<{/block}>