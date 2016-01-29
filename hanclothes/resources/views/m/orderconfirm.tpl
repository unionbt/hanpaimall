<{extends file="extends/main.block.tpl"}>

<{block "head-styles-plus"}>
	<link rel="stylesheet" href="<{'static/css/font-awesome.min.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/confirmorder.css'|url}>">
	<link rel="stylesheet" href="<{'static/css/m/common.css'|url}>">
<{/block}>

<{block "body-container"}>
<form id="form" action="<{'m/order/confirm'|url}>" method="post">
<{csrf_field() nofilter}>
<div class="container-fluid"><!-- 抬头小图条 -->
	<div class="row">
		<img src="<{'static/img/m/order2_top.png'|url}>" class="img-responsive order2-top-img">
		
	</div>
</div>
<div class="clearfix"></div>
<div class="container-fluid"><!-- 地址信息 -->
	<div class="row addresinfo">
		<div class="col-xs-1 text-center  icon-marker">	
			<i class="glyphicon glyphicon-map-marker"></i>
		</div>
		<!-- 弹出模态框 -->
		<a id="address-container" class="btn btn-default btn-md col-xs-10 text-left" data-toggle="modal" data-target="#address-modal" data-backdrop="static">
			<h5 class="text-left"> 点击设置收货人信息 </h5>
			<input type="hidden" name="uaid" id="uaid" value="0">
			<input type="hidden" name="sid" id="sid" value="0">
		</a>
		<!-- 弹出模态框 -->
		<div class="col-xs-1 icon-right">
			<i class="glyphicon glyphicon-menu-right" aria-hidden="true"></i>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<div class="container-fluid orderinfotitle">订单信息</div>
<div class="container-fluid orderinfo"><!-- 订单信息 -->
	<{foreach $_order_list as $v}>
	<input type="hidden" name="cart[]" value="<{$v->getKey()}>">
	<input type="hidden" name="buy_cnt[<{$v->getKey()}>]" value="<{$_buy_cnt[$v.id]}>">
	<div class="row ordergoodsinfo">
		<div class="col-xs-3 goodspic">
			<a href="<{'m/detail'|url}>?pid=<{$v.pid}>">
				<img src="<{'attachment/resize'|url}>?id=<{$v.attr.aid}>&width=180&height=160" class="img-responsive">
			</a>
		</div>
		<div class="col-xs-6 goodsinfo">
			<div class="goodsinfo-1"><a href="<{'m/detail'|url}>?pid=<{$v.pid}>"><{$v.product.title}></a></div>
			<div class="goodsinfo-2"><small>颜色：<span><{$v.attr.name}></span>，尺寸：<span><{$v.size_types.name|upper}></span></small></div>
		</div>
		<div class="col-xs-3 goodsprice">
			<p class="text-right"><label><{$v->activity(true)->price}></label></p>
			<span class="text-right">×<label><{$_buy_cnt[$v.id]}></label></span>
			<div class="pull-right text-muted bonus_add"><{$v->activity_bonus($_user_id) nofilter}></div>
		</div>
	</div>
	<div class="clearfix"></div>
	<{/foreach}>
<div class="clearfix"></div>
</div>
<div class="clearfix"> </div>

<div class="container-fluid"><div class="commheight"></div></div>

<div class="container-fluid "><!-- 支付按钮 -->
	<div class="row order2footer">
		<div class="col-xs-7 order2pricecount">
			<p>合计：<span>¥&nbsp;<label id="total_money">0.00</label><small class="text-muted">(快递¥<label id="total_expresses">0.00</label>)</small>
			<small style="display:none;" id="order_bonus"></small>
			</span></p>
		</div>
		<button class="col-xs-5 order2gopay" type="submit">去支付</button>
	</div>
</div>
</form>

<!-- 模态框（Modal） -->

<div class="modal addressmodal" id="address-modal" tabindex="-1">
<form id="address-form" action="<{'m/order/used-address'|url}>" method="POST">
<{csrf_field() nofilter}>
	<div class="">
		<div class="modal-content">
			<div class="container-fluid">
				<div class="row page-header">
					<div class="col-xs-6 mdinfo"><h5 class="text-danger" style="display：none">快递</h5></div>
					<div class="col-xs-6 text-right">
						<h5 id="add-address"><i class="glyphicon glyphicon-plus"></i>增加地址</h5>
					</div>
				</div>	
				<div class="clearfix" id="user-address-head"></div>
				<{foreach $_user->addresses as $item}>
				<div class="radio row page-header user-address <{if $item@first}>active<{/if}>"<{if $item@index > 1}>style="display:none"<{/if}>>
					<label class="col-xs-10">
						<h5><b><{$item.realname}></b>&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-phone"><i><{$item.phone}></i></i></h5>
						<small class="text-muted"><{$item->full_address()}></small>
					</label>
					<div class="col-xs-2">
						<input type="radio" class="hidden" name="uaid" value="<{$item.id}>" data-address="<{$item->full_address()}>" data-realname="<{$item.realname}>" data-phone="<{$item.phone}>" <{if $item@first}> checked="checked"<{/if}>>
					</div>
				</div>
				<{foreachelse}>
				<div class="radio row page-header">
					<label class="col-xs-10">
						<h5>暂无地址信息</h5>
						<small class="text-muted"></small>
					</label>
					<div class="col-xs-2"></div>
				</div>
				<{/foreach}>
				<div class="clearfix"></div>
			</div>
			<{if $_user->addresses->count() > 2}>
			<div class="container-fluid addressmore">
				<button type="button" class="btn btn-default btn-block" id="user-more"><i class="fa fa-ellipsis-h text-info"></i></button>
			</div>  
			<div class="clearfix"></div>
			<{/if}>
			<!-- 门店自取 --> 
			<div class="contaoner-fluid">
				<div class="row page-header">
				<h5 class="col-xs-12 text-danger">门店自取</h5>
				</div>
			</div>
			<{foreach $_user->stores as $store}>
				<div class="container-fluid store-address <{if empty($_user->addresses->count()) && $store@first}>active<{/if}>" <{if $store@index > 1}>style="display:none"<{/if}> >
					<div class="radio row page-header">
						<label class="col-xs-10">
							<div class="col-xs-9 mdinfo">
								<h5><b><{$store.name}></b></h5>
								<h5><b><{$store.user.realname}>&nbsp;&nbsp;</b><i class="glyphicon glyphicon-phone"><i><{$store.phone}></i></i><h5>
								<small class="text-muted"><{$store.address}></small>
							</div>		
							<!--div class="col-xs-3 mdrange">
								<i class="glyphicon glyphicon-map-marker">3.2km</i>
							</div-->
						</label>
						<div class="col-xs-2">
							<input class="hidden" type="radio" name="sid" data-name="<{$store.name}>" value="<{$store.id}>" <{if empty($_user->addresses->count()) && $store@first}>checked="checked"<{/if}>>
						</div>
					</div>				
				</div>
				<div class="clearfix"></div>
			<{/foreach}>
			<{if $_user->stores->count() > 2}>
			<!--显示更多 -->
			<div class="container-fluid addressmore">
				<button type="button" class="btn btn-default btn-block" id="store-more"><i class="fa fa-ellipsis-h text-info"></i></button>
			</div>  
			<div class="clearfix"></div>
			<{/if}>

			<div class="container-fluid"><div class="commheight"></div></div>
	
			<div class="container-fluid button-fixed">
				<div class="modal-footer row">
					<a type="button" class="col-xs-6 backbutton text-center" data-dismiss="modal">返回</a>
					<button type="submit" class="col-xs-6 confirmbutton text-center">确认</button>
				</div>
			</div>
		</div><!-- /.modal-content -->
	</div>
</form>
</div><!-- /.modal -->
<{/block}>
<{block "body-scripts"}>
<script>

(function($) {
	var method = {};
	//获取共享地址
	function editAddress()
	{
		WeixinJSBridge.invoke(
			'editAddress',
			<{$_address_parameters|json_encode nofilter}>,
			function(res){
				if (res && res.err_msg == 'edit_address:ok')
				{
					$.POST('<{'m/member/address-store'|url}>', {
						realname: res.userName,
						province: res.proviceFirstStageName,
						city: res.addressCitySecondStageName,
						counties: res.addressCountiesThirdStageName,
						address: res.addressDetailInfo,
						national_code: res.nationalCode,
						postal_code: res.addressPostalCode,
						phone: res.telNumber
					}, function(json){
						if (json.result == 'success')
						{
							var html = '<div class="radio row page-header user-address">\
	<label class="col-xs-10">\
		<h5><b>'+json.data.realname.toHTML()+'</b>&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-phone"><i>'+json.data.phone.toHTML()+'</i></i></h5>\
		<small class="text-muted">'+json.data.full_address.toHTML()+'</small>\
	</label>\
	<div class="col-xs-2">\
		<input type="radio" class="hidden" name="uaid" value="'+json.data.id.toHTML()+'" data-address="'+json.data.full_address.toHTML()+'" data-realname="'+json.data.realname.toHTML()+'" data-phone="'+json.data.phone.toHTML()+'">\
	</div>\
</div>';
							$(html).insertAfter('#user-address-head').trigger('click');
						}
						
					});
				} else {

					$.alert('获取微信地址失败：' + res.err_msg);
				}
			}
		);
	}

	method.call_address = function(){
		if (typeof WeixinJSBridge == "undefined"){
			if( document.addEventListener ){
				document.addEventListener('WeixinJSBridgeReady', editAddress, false);
			}else if (document.attachEvent){
				document.attachEvent('WeixinJSBridgeReady', editAddress); 
				document.attachEvent('onWeixinJSBridgeReady', editAddress);
			}
		}else{
			editAddress();
		}
	};
	$('#add-address').on('click', function(){
		method.call_address();
	});

	//计算库存
	method.calc = function() {
		$.GET('<{'m/order/calc'|url}>', $('#form').serialize(), function(json){
			if (json.result == 'success')
			{
				$('#total_money').text(json.data.details_money + json.data.expresses_money - json.data.bonus_money);
				$('#total_expresses').text(json.data.expresses_money);
			} else
				$.showtips(json);
		}, false);
	}

	//绑定form提交
	$('#form').on('submit',function(e){
		if (!parseInt($('#sid').val()) && !parseInt($('#uaid').val()))
		{
			$.alert('请先选择收件人地址！');
			e.stopImmediatePropagation();
			return false;
		}
	}).query();
	//展开更多
	var $address_form = $('#address-form');
	$('#user-more').on('click', function(){
		$('.user-address', $address_form).show();
		$(this).remove();
	});
	$('#store-more').on('click', function(){
		$('.store-address', $address_form).show();
		$(this).remove();
	});
	//选择地址
	$address_form.on('click', '.user-address,.store-address', function(){
		var $radios = $('.user-address,.store-address', $address_form);
		$radios.removeClass('active');
		$(this).addClass('active');
		$(':radio', $radios).prop('checked', false);
		$(':radio', this).prop('checked', true);
	});
	method.setAddress = function(){
		var $radio = $(':radio:checked', $address_form);
		if ($radio.length == 1)
		{
			var html = $radio.is('[name="uaid"]') ? '<h5 class="text-left"><b>收 货 人：'+$radio.data('realname')+' <i>'+$radio.data('phone')+'</i></b></h5><h5 class="text-muted text-left">收货地址：<small>'+$radio.data('address')+'</small></h5><input type="hidden" name="uaid" id="uaid" value="'+$radio.val()+'"><input type="hidden" name="sid" id="sid" value="0">' : '<h5 class="text-left"><b>门店自提</b></h5><h5 class="text-muted text-left">名称：<small>'+$radio.data('name')+'</small></h5><input type="hidden" name="uaid" id="uaid" value="0"><input type="hidden" name="sid" id="sid" value="'+$radio.val()+'">';
			$('#address-container').html(html);
			return true;
		}
		return false;
	}
	//提交地址时，更新到地址选择栏
	$address_form.on('submit', function(e){
		if (!method.setAddress())
		{
			$.alert('请选择快递，或者自提！');
			e.stopImmediatePropagation();
			return false;
		}
		$('#address-modal').modal('hide');
		method.calc();
		return true;
	}).query(function(){

	}, false);
$().ready(function(){
	//初始化地址/计算价格
	if ($('[name="uaid"]', $address_form).length <= 0)
		$.confirm('您还没有配送地址，新建一个？', function(){
			$('#address-modal').modal({backdrop: 'static'});
			method.call_address();
		});
	else
		method.setAddress();
	
	method.is_bonus = false;
	$('.bonus_add').each(function(key,obj){
		if($(this).html() != '' && method.is_bonus == false){
			$('#order_bonus').html($(this).html()).show() && $(this).remove();
			$('#order_bonus select').on('change',method.calc);
			method.is_bonus = true;
		}
	});
	method.calc();
});

})(jQuery);
</script>
<{/block}>