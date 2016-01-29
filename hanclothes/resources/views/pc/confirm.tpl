<{extends file="extends/main.block.tpl"}>

<{block "head-meta-responsive"}>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<{/block}>

<{block "head-styles-plus"}>
	<link href="<{'static/js/flexslider/flexslider.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/base.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/confirm_order.css'|url}>" rel="stylesheet">
<{/block}>

<{block "head-scripts-plus"}>
	<script src="<{'static/js/flexslider/jquery.flexslider-min.js'|url}>"></script>
<{/block}>

<{block "body-container"}>
  <{include file="pc/header.topnav.inc.tpl"}>
  
  <div class="content">
		<div class="start">
			<h3>订单详情</h3>
		</div>
		<div class="item">.jpg
			<div><a href="page.html"><img src="<{'static/img/pc/xq1_03.jpg'|url}>"></a></div>
			<div class="item_title">
				<h5><a href="page.html">限时雪纺钉珠连衣裙雪纺钉珠连衣裙雪纺钉珠连衣裙衣裙雪纺衣裙雪纺衣裙雪纺衣裙雪纺衣裙雪纺衣裙雪纺裙雪纺衣裙雪纺裙雪纺衣裙雪纺</a></h5>
				<h6>¥&nbsp;400<br><small>×&nbsp;1</small></h6>
				<div>
					<h5>颜色：<span>天然色</span></h5>
					<h5>尺寸：<span>M</span></h5>
				</div>
			</div>
		</div>
		<div class="choose">
			<div class="choosePost"><img class="active" src="<{'static/img/pc/choose.png'|url}>"><span>快递到家</span></div>
			<div class="chooseStore"><img src="<{'static/img/pc/choose.png'|url}>"><span>上门取货</span></div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				var chpost = $('.choosePost');
				var chstore = $('.chooseStore');
				var pa = $('.postAddress');
				var sa = $('.storeAddress');
				function change(arg1,arg2,arg3,arg4){
					arg1.on('click',function(){
					$(this).find('img').addClass('active');
					arg2.find('img').removeClass('active');
					arg3.css('display','block');
					arg4.css('display','none');
				});
				}
				change(chpost,chstore,pa,sa);
				change(chstore,chpost,sa,pa);
			});
		</script>
		<div class="postAddress">
			<div class="radio">
				<label>
					<input type="radio" checked="" value="option1" id="optionsRadios1" name="postAddress">
					地址：<span>湖北武汉市洪山区关山大道软件园二栋</span>收件人：<span>张珊珊</span>电话：<span>13987654321</span>
				</label>
				<br>
				<label>
					<input type="radio" value="option2" id="optionsRadios1" name="postAddress">
					地址：<span>湖北武汉市洪山区关山大道软件园二栋</span>收件人：<span>张珊珊</span>电话：<span>13987654321</span>
				</label>
			</div>
			<div class="postfee">运费：<span>¥&nbsp;12</span></div>
		</div>
		<div class="storeAddress">
			<div class="radio">
				<label>
					<input type="radio" checked="" value="option1" id="optionsRadios1" name="storeAddress">
					<span>凤彩服饰广场</span>地址：<span>湖北武汉市洪山区关山大道软件园二栋</span>收件人：<span>张珊珊</span>电话：<span>13987654321</span><span></span><span>距您600米</span>
				</label>
				<br>
				<label>
					<input type="radio" value="option2" id="optionsRadios1" name="storeAddress">
					<span>上好佳服饰广场</span>地址：<span>湖北武汉市洪山区关山大道软件园二栋</span>收件人：<span>张珊珊</span>电话：<span>13987654321</span><span></span><span>距您600米</span>
				</label>
			</div>
			<div class="postfee">运费：<span>免费</span></div>
		</div>
		<div class="addAddres"><a href=""><i class="glyphicon glyphicon-plus"></i>增加地址</a></div>
		<div class="discount">使用红包：<a href=""><img src="<{'static/img/pc/minus.png'|url}>"></a><input type="text" placeholder="30" class=""><a href=""><img src="<{'static/img/pc/plus.png'|url}>"></a><span>可用红包余额：30.00</span></div>
		<div class="confirm"><h5 class="text-right">合计：400.00</h5><a class="btn" href="payment_method.html">提交订单</a></div>
	</div>
  
  <{include file="pc/footer.inc.tpl"}>
<{/block}>

<{block "body-scripts-jquery"}>
(function($) {
	 $('.flexslider').flexslider({
      controlNav: true,
      directionNav: false,
      slideshow: true,
      slideshowSpeed: 3000,
    });
})(jQuery);
<{/block}>