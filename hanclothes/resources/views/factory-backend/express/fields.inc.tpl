<div class="form-group">
	<label class="col-md-3 control-label" for="title">标题</label>
	<div class="col-md-9">
		<label><{$_data.title}></label>
	</div>
</div>
<!-- 订单详情 begin-->
<{foreach $_data.details as $detail}>
<div class="form-group">
	<label class="col-md-3 control-label" for="fid">商品</label>
	<div class="col-md-9">
		<label><{$detail.product.title}> <{$detail.size.attr.name}>  <{$detail.size.size_types.name}> </label>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="pic">图片</label>
	<div class="col-md-9">
		<img src="<{'attachment/resize'|url}>?id=<{$detail.size.attr.aid}>&width=80&height=80"/>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="buy">数量</label>
	<div class="col-md-9">
		<label><{$detail.count}></label>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="shop_rate">单价</label>
	<div class="col-md-9">
		<label><{$detail.size.price}></label>
	</div>
</div>
<{/foreach}>
<!-- 订单详情 end-->

<div class="form-group">
	<label class="col-md-3 control-label" for="expresses_money">运费</label>
	<div class="col-md-9">
		<label><{$_data.expresses_money}></label>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="total_money">总价</label>
	<div class="col-md-9">
		￥<label id="total_money" details_money="<{$_data.details_money}>"><{$_data.total_money}></label>
	</div>
</div>

	<{if $_data.order_express.express_type==39}>
	<div class="form-group">
		<label class="col-md-3 control-label" for="express_name">快递:</label>
		<div class="col-md-9">
			<select name="express_name" id="express_name" class="form-control">
				<{foreach $_fields.express_name as $v}>
				 	<option value="<{$v.id}>" <{if $_data.order_express.express_name==$v.id}> selected="selected"<{/if}>><{$v.title}></option>
				<{/foreach}>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-3 control-label" for="no">单号:</label>
		<div class="col-md-9">
			<input type="text" id="no" name="no" class="form-control" placeholder="请输入快递单号" value="<{$_data.order_express.no}>">
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-3 control-label" for="uaid">配送地址:</label>
		<div class="col-md-9"><{$_user_address}></div>
	</div>
	<{else}>
	<div class="form-group">
		<label class="col-md-3 control-label" for="uaid">配送门店:</label>
		<div class="col-md-9">
			<select name="sid" id="sid" class="form-control">
				<{foreach $_user_stores as $store}>
					<option value="<{$store.id}>" data-realname="<{$store.user.realname}>" data-phone="<{$store.phone}>" data-address="<{$store.address}>" <{if $_data.order_express.sid==$store.id}> selected="selected"<{/if}>><{$store.name}>-店主:<{$store.user.realname}>-电话:<{$store.phone}>-地址:<{if $store.address}><{$store.address}><{else}>无<{/if}></option>
				<{/foreach}>
			</select>
		</div>
	</div>
	<{/if}>

<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
	<{if $_data.status!=\App\Order::PAID}> 
		<button onclick="history.go(-1);" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 返回</button>
	<{else}>
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		
	<{/if}>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>
<script>
(function($){
	$().ready(function(){
		
	});
})(jQuery);
</script>