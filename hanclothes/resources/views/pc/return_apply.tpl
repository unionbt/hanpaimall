<{extends file="extends/main.block.tpl"}>

<{block "head-meta-responsive"}>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<{/block}>

<{block "head-styles-plus"}>
  	<link href="<{'static/css/pc/base.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/service.css'|url}>" rel="stylesheet">
<{/block}>

<{block "body-container"}>
  <{include file="pc/header.topnav.inc.tpl"}>
  <div class="container">
		<div class="orderNum">
			<h5>订单号：<span>155051032311</span></h5>
			<h5>创建时间：<span>2015-11-5&nbsp;&nbsp;10:15</span></h5>
		</div>
		<div class="item">
			<div><a href="page.html"><img src="<{'static/img/pc/xq1_03.jpg'|url}>"></a></div>
			<div class="item_title">
				<h5><a href="page.html">限时雪纺钉珠连衣裙雪纺钉珠连衣裙雪纺钉珠连衣裙衣裙雪纺衣裙雪纺衣裙雪纺衣裙雪纺衣裙雪纺衣裙雪纺裙雪纺衣裙雪纺裙雪纺衣裙雪纺</a></h5>
				<h6>¥&nbsp;388<br><small>×&nbsp;1</small></h6>
				<div>
					<h5>颜色：<span>天然色</span></h5>
					<h5>尺寸：<span>M</span></h5>
				</div>
			</div>

		</div>
		<div class="return">
			<h5>退货理由</h5>
			<textarea placeholder="请详细描述退换货理由..." class=""></textarea>
		</div>

		<div class="buttons"><span id="btnstroe">转附近门店退换货</span><span class="active" id="btnpost">快递退换货</span></div>
		<div class="postReturn">
			<h4>厂商退货地址</h4>
			<div class="address">
				<h5>厂商退货地址厂商退货地址厂商退货地址厂商退货地址</h5>
				<small>呵呵：13987654321</small><br>
				<small>邮编：434300</small>
			</div>
			<div class="postCompany">
				<span>快递公司</span>

					<select>
						<option>顺丰</option>
						<option>申通</option>
						<option>韵达</option>
						<option>圆通</option>
					</select>
			
			</div>
			<div class="postNum">快递单号
				<input type="text">
			</div>
		</div>		

		<div class="storeReturn">
				<h4>门店退换货</h4>

				<div class="store">
					<div class="address"><h5>格林鸟服饰</h5><small>小黄&nbsp;13987654321</small><br><small>湖北省武汉市江夏区xxluxx号</small></div>
					<div class="storeRange"><img src="<{'static/img/pc/marker.png'|url}>"><span>1.3km</span>	</div>
					<div class="storeChoose"><img class="active" src="<{'static/img/pc/choose.png'|url}>"></div>
				</div>				
				<div class="store">
					<div class="address"><h5>格林鸟服饰</h5><small>小黄&nbsp;13987654321</small><br><small>湖北省武汉市江夏区xxluxx号</small></div>
					<div class="storeRange"><img src="<{'static/img/pc/marker.png'|url}>"><span>1.3km</span>	</div>
					<div class="storeChoose"><img src="<{'static/img/pc/choose.png'|url}>"></div>
				</div>				
				<div class="store">
					<div class="address"><h5>格林鸟服饰</h5><small>小黄&nbsp;13987654321</small><br><small>湖北省武汉市江夏区xxluxx号</small></div>
					<div class="storeRange"><img src="<{'static/img/pc/marker.png'|url}>"><span>1.3km</span>	</div>
					<div class="storeChoose"><img src="<{'static/img/pc/choose.png'|url}>"></div>
				</div>
					
				<div class="showMore"><a href="">显示更多<i class="glyphicon glyphicon-chevron-down"></i></a></div>
		</div>


		<div class="submit">
			<a class="btn" href="">提交申请</a>
		</div>
	</div>
  <{include file="pc/footer.inc.tpl"}>
<{/block}>

<{block "body-scripts-jquery"}>
(function($) {
	var bs = $('#btnstroe');
	var bp = $('#btnpost');
	var pr = $('.postReturn');
	var sr = $('.storeReturn');
	function change(arg1,arg2,arg3,arg4){
		arg1.on('click',function(){
		$(this).addClass('active');
		arg2.removeClass('active');
		arg3.css('display','block');
		arg4.css('display','none');
		});
	}
	change(bs,bp,sr,pr);
	change(bp,bs,pr,sr);

	$('.storeChoose').find('img').on('click',function(){
		$('.storeChoose').find('img').removeClass('active');
		$(this).addClass('active');
	});
})(jQuery);
<{/block}>