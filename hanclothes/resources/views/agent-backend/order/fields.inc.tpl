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
		￥<label id="expresses_money"><{$_data.expresses_money}></label>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="total_money">总价</label>
	<div class="col-md-9">
		￥<label id="total_money" details_money="<{$_data.details_money}>"><{$_data.total_money}></label>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="total_money">配送方式</label>
	<div class="col-md-9">
		<label><{$_data.order_express.express_type_names.title}></label>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="total_money">配送信息</label>
	<div class="col-md-9">
		<label><{$_express_address}></label>
	</div>
</div>

<{if $_data.order_express.express_types.id>0}>
<div class="form-group">
	<label class="col-md-3 control-label" for="express_name">快递:</label>
	<div class="col-md-9">
		<label><{$_data.order_express.express_types.title}></label>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="no">单号:</label>
	<div class="col-md-9">
		<label><{$_data.order_express.no}></label>
	</div>
</div>
<{else}>
<div class="form-group"><label class="col-md-3 control-label" for="no"></label><div class="col-md-9">暂无快递信息</div></div>
<{/if}>
<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button onclick="history.go(-1);" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 返回</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>