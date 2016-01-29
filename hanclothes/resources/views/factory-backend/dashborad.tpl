<{extends file="factory-backend/extends/main.block.tpl"}>
<{block "head-scripts-plus"}>
<script src="<{'static/js/chart/flot/jquery.flot.min.js'|url}>"></script>
<script>
(function($){
$().ready(function(){
	// Get the elements where we will attach the charts
	var dashWidgetChart = $('#dash-widget-chart');

	// Random data for the chart
	var dataEarnings = [[1, 1560], [2, 1650], [3, 1320], [4, 1950], [5, 1800], [6, 2400], [7, 2100], [8, 2550], [9, 3300], [10, 3900], [11, 4200], [12, 4500]];
	var dataSales = [[1, 500], [2, 420], [3, 480], [4, 350], [5, 600], [6, 850], [7, 1100], [8, 950], [9, 1220], [10, 1300], [11, 1500], [12, 1700]];

	// Array with month labels used in chart
	var chartMonths = [[1, '11周前'], [2, '10周前'], [3, '9周前'], [4, '8周前'], [5, '7周前'], [6, '6周前'], [7, '5周前'], [8, '4周前'], [9, '3周前'], [10, '2周前'], [11, '1周前'], [12, '本周']];

	// Initialize Dash Widget Chart
	$.plot(dashWidgetChart,
		[
			{
				data: dataEarnings,
				lines: {show: true, fill: false},
				points: {show: true, radius: 6, fillColor: '#cccccc'}
			},
			{
				data: dataSales,
				lines: {show: true, fill: false},
				points: {show: true, radius: 6, fillColor: '#ffffff'}
			}
		],
		{
			colors: ['#ffffff', '#353535'],
			legend: {show: false},
			grid: {borderWidth: 0, hoverable: true, clickable: true},
			yaxis: {show: false},
			xaxis: {show: false, ticks: chartMonths}
		}
	);

	// Creating and attaching a tooltip to the widget
	var previousPoint = null, ttlabel = null;
	dashWidgetChart.bind('plothover', function(event, pos, item) {

		if (item) {
			if (previousPoint !== item.dataIndex) {
				previousPoint = item.dataIndex;

				$('#chart-tooltip').remove();
				var x = item.datapoint[0], y = item.datapoint[1];

				// Get xaxis label
				var monthLabel = item.series.xaxis.options.ticks[item.dataIndex][1];

				if (item.seriesIndex === 1) {
					ttlabel = '<strong>' + y + '</strong> sales in <strong>' + monthLabel + '</strong>';
				} else {
					ttlabel = '$ <strong>' + y + '</strong> in <strong>' + monthLabel + '</strong>';
				}

				$('<div id="chart-tooltip" class="chart-tooltip">' + ttlabel + '</div>')
					.css({top: item.pageY - 50, left: item.pageX - 50}).appendTo("body").show();
			}
		}
		else {
			$('#chart-tooltip').remove();
			previousPoint = null;
		}
	});
});
})(jQuery);
</script>
<{/block}>

<{block "block-container"}>

<div class="row">
	<div class="col-sm-6 col-md-4">
		<!-- Widget -->
		<div class="widget">
			<div class="widget-simple">
				<a href="javascript:void(0)" class="widget-icon pull-left animation-fadeIn themed-background">
					<i class="gi gi-shopping_cart"></i>
				</a>
				<h4 class="widget-content text-right animation-hatch">
					<a href="<{'factory/order?'|url}>base=&filters[created_at][min]=<{date("Y-m-d")}>&filters[created_at][max]=<{date("Y-m-d",strtotime("+1 days"))}>"><{$_data.today_cnt}> <strong>订单</strong></a>
					<small>今日订单</small>
				</h4>
			</div>
		</div>
		<!-- END Widget -->
	</div>
	<div class="col-sm-6 col-md-4">
		<!-- Widget -->
		<div class="widget">
			<div class="widget-simple">
				<a href="javascript:void(0)" class="widget-icon pull-left animation-fadeIn themed-background-fancy">
					<i class="fa fa-yen"></i>
				</a>
				<h4 class="widget-content text-right animation-hatch">
					<a href="<{'factory/order?'|url}>base=&filters[created_at][min]=<{date("Y-m-d")}>&filters[created_at][max]=<{date("Y-m-d",strtotime("+1 days"))}>"><strong>¥</strong> <{$_data.today_income}></a>
					<small>今日收入</small>
				</h4>
			</div>
		</div>
		<!-- END Widget -->
	</div>
	<div class="col-sm-6 col-md-4">
		<!-- Widget -->
		<div class="widget">
			<div class="widget-simple">
				<a href="javascript:void(0)" class="widget-icon pull-left animation-fadeIn themed-background-fire">
					<i class="fa fa-thumbs-o-down"></i>
				</a>
				<h4 class="widget-content text-right animation-hatch">
					<a href="javascript:void(0)">0 <strong>件</strong></a>
					<small>今日退换货</small>
				</h4>
			</div>
		</div>
		<!-- END Widget -->
	</div>
	<div class="col-sm-6 col-md-4">
		<!-- Widget -->
		<div class="widget">
			<div class="widget-simple themed-background-dark">
				<a href="javascript:void(0)" class="widget-icon pull-left animation-fadeIn themed-background">
					<i class="gi gi-shopping_cart"></i>
				</a>
				<h4 class="widget-content widget-content-light text-right animation-hatch">
					<a href="<{'factory/order?'|url}>base=&filters[created_at][min]=<{date("Y-m-01")}>&filters[created_at][max]=<{date("Y-m-01",strtotime("+1 month"))}>"><{$_data.month_cnt}> <strong>订单</strong></a>
					<small>月订单</small>
				</h4>
			</div>
		</div>
		<!-- END Widget -->
	</div>
	<div class="col-sm-6 col-md-4">
		<!-- Widget -->
		<div class="widget">
			<div class="widget-simple themed-background-dark-fire">
				<a href="javascript:void(0)" class="widget-icon pull-left animation-fadeIn themed-background-fire">
					<i class="fa fa-cny"></i>
				</a>
				<h4 class="widget-content widget-content-light text-right animation-hatch">
					<a href="<{'factory/order?'|url}>base=&filters[created_at][min]=<{date("Y-m-01")}>&filters[created_at][max]=<{date("Y-m-01",strtotime("+1 month"))}>" class="themed-color-fire"><strong>¥</strong> <{$_data.month_income}></a>
					<small>月收入</small>
				</h4>
			</div>
		</div>
		<!-- END Widget -->
	</div>
	<div class="col-sm-6 col-md-4">
		<!-- Widget -->
		<div class="widget">
			<div class="widget-simple themed-background-dark-autumn">
				<a href="javascript:void(0)" class="widget-icon pull-left animation-fadeIn themed-background-autumn">
					<i class="fa fa-thumbs-o-down"></i>
				</a>
				<h4 class="widget-content widget-content-light text-right animation-hatch">
					<a href="javascript:void(0)" class="themed-color-autumn">0 <strong>件</strong></a>
					<small>月退换货</small>
				</h4>
			</div>
		</div>
		<!-- END Widget -->
	</div>
</div>
<div class="row">
	<div class="col-md-6">
		<div class="widget">
			<div class="widget-advanced">
				<!-- Widget Header -->
				<div class="widget-header text-center themed-background-dark">
					<h3 class="widget-content-light">
						<a href="javascript:void(0)" class="themed-color">订单列表</a><br>
						<small>最新5个订单</small>
					</h3>
				</div>
				<!-- END Widget Header -->

				<!-- Widget Main -->
				<div class="widget-main">
					<a href="javascript:void(0)" class="widget-image-container animation-bigEntrance">
						<span class="widget-icon themed-background"><i class="gi gi-shopping_cart"></i></span>
					</a>
					<table class="table table-borderless table-striped table-condensed table-vcenter">
						<tbody>
						 <{if isset($_data.new_orders)&&$_data.new_orders->count()>0}>
						  	<{foreach $_data.new_orders as $order}>
							<tr>
								<td colspan=2>
								<{foreach $order.details as $detail}>
								<{$detail.product.title|truncate:15:"...":true}> <{$detail.size.attr.name}> <{$detail.size.size_types.name|upper}> x<{$detail.count}><br/>
								<{/foreach}>
								</td>
								<td class="text-right">¥<{$order.total_money}></td>
								<td class="text-center"><{$order.created_at}></td>
								<td class="text-center" style="width: 70px;">
									<span class="label label-success"><{$order->order_status()}></span>
								</td>
							</tr>
							<{/foreach}>
						  <{else}>
							<tr>
								<td colspan=5>暂无订单信息.</td>
							</tr>
						  <{/if}>
						</tbody>
					</table>
					<div class="text-center"><a href="<{'factory/order'|url}>">更多..</a></div>
				</div>
				<!-- END Widget Main -->
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="widget">
			<div class="widget-advanced">
				<!-- Widget Header -->
				<div class="widget-header text-center themed-background-dark-flatie">
					<h3 class="widget-content-light">
						<a href="javascript:void(0)" class="themed-color-flatie">物流列表</a><br>
						<small>最新5个物流信息</small>
					</h3>
				</div>
				<!-- END Widget Header -->

				<!-- Widget Main -->
				<div class="widget-main">
					<a href="javascript:void(0)" class="widget-image-container animation-bigEntrance">
						<span class="widget-icon themed-background-flatie"><i class="fa fa-truck"></i></span>
					</a>
					<table class="table table-borderless table-striped table-condensed table-vcenter">
						<tbody>
							<{if isset($_data.new_orders)&&$_data.new_orders->count()>0}>
						  	<{foreach $_data.new_orders as $order}>
							<tr>
								<td colspan=2>
								<{foreach $order.details as $detail}>
								<{$detail.product.title|truncate:15:"...":true}> <{$detail.size.attr.name}> <{$detail.size.size_types.name|upper}> x<{$detail.count}><br/>
								<{/foreach}>
								</td>
								<td class="text-right">¥<{$order.total_money}></td>
								<td class="text-center"><{$order.created_at}></td>
								<td class="text-center" style="width: 70px;">
									<span class="label label-success"><{$order->deliver_status()}></span>
								</td>
							</tr>
							<{/foreach}>
						  <{else}>
							<tr>
								<td colspan=5>暂无订单信息.</td>
							</tr>
						  <{/if}>
						</tbody>
					</table>
					<div class="text-center"><a href="<{'factory/express'|url}>">更多..</a></div>
				</div>
				<!-- END Widget Main -->
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<!-- Your Plan Widget -->
		<div class="widget">
			<div class="widget-simple themed-background-dark">
				<a href="javascript:void(0)" class="widget-icon pull-right themed-background-dark">
					<i class="fa fa-line-chart animation-pulse"></i>
				</a>
				<h1 class="widget-content widget-content-light">
					<a href="javascript:void(0)" class="themed-color"> <strong>财务报表</strong></a>
				</h1>
			</div>
			<div class="widget-advanced widget-advanced-alt">
				<!-- Widget Header -->
				<div class="widget-header text-center themed-background">
					<h3 class="widget-content-light text-left pull-left animation-pullDown">
						<strong>收入</strong><br>
						<small>单位：元</small>
					</h3>
					<!-- Flot Charts (initialized in js/pages/index.js), for more examples you can check out http://www.flotcharts.org/ -->
					<div id="dash-widget-chart" class="chart"></div>
				</div>
				<!-- END Widget Header -->
			</div>
		</div>
		<!-- END Your Plan Widget -->
	</div>
	<div class="col-md-6">
		<div class="widget">
			<div class="widget-simple themed-background-dark-fire">
				<a href="javascript:void(0)" class="widget-icon pull-right themed-background-fire">
					<i class="fa fa-trademark animation-pulse"></i>
				</a>
				<h2 class="widget-content widget-content-light">
					<a href="javascript:void(0)" class="themed-color-fire"> <strong>品牌列表</strong></a>
					
				</h2>
			</div>
			<div class="widget-extra ">
				<div class="gallery gallery-widget" data-toggle="lightbox-gallery">
					<div class="row">
					<{foreach $_factory->brands as $item}>
						<div class="col-xs-4 col-sm-3 text-center">
							<img src="<{if !empty($item->logo_aid)}><{'attachment'|url}>?id=<{$item->logo_aid}><{else}><{'placeholder'|url}>?text=<{$item->name|escape:'url' nofilter}><{/if}>" alt="image" class="img-responsive">
							<p class="text-center"><{$item->name}></p>
						</div>
					<{/foreach}>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>
<{/block}>