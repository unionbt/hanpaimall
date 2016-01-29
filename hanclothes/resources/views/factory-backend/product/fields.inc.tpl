<div class="form-group">
	<label class="col-md-3 control-label" for="title">标题</label>
	<div class="col-md-9">
		<input type="text" id="title" name="title" class="form-control" placeholder="请输入标题" value="<{$_data.title}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="keywords">SEO关键字</label>
	<div class="col-md-9">
		<input type="text" id="keywords" name="keywords" class="form-control" placeholder="请输入SEO关键字" value="<{$_data.keywords}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="description">SEO描述</label>
	<div class="col-md-9">
		<input type="text" id="description" name="description" class="form-control" placeholder="请输入SEO描述" value="<{$_data.description}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="bid">品牌</label>
	<div class="col-md-9">
		<select name="bid" id="bid" class="form-control select-model" value="<{$_data->bid}>" data-model="factory/brand" data-text="{name}" data-placeholder="请选择品牌名字"></select>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="shop_rate">店铺返利(%)</label>
	<div class="col-md-9">
		<input type="text" id="shop_rate" name="shop_rate" class="form-control" placeholder="请输入厂家返利百分点" value="<{$_data.shop_rate}>">
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="agent_rate">代理商返利(%)</label>
	<div class="col-md-9">
		<input type="text" id="agent_rate" name="agent_rate" class="form-control" placeholder="请输入代理商返利百分点" value="<{$_data.agent_rate}>">
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="agent_rate">快递费/件</label>
	<div class="col-md-9">
		<input type="text" id="express_price" name="express_price" class="form-control" placeholder="请输入快递费" value="<{$_data.express_price}>">
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="title">封面</label>
	<div class="col-md-9">
		<select id="cover_aids" name="cover_aids[]" class="form-control hidden" multiple="multiple">
		<{if !empty($_data)}><{foreach $_data->cover_aids()->toArray() as $item}>
			<option value="<{$item}>" selected="selected"></option>
		<{/foreach}><{/if}>
		</select>
		<div class="alert alert-info"><i class="fa fa-warning"></i> 可以上传20张图片作为产品的封面</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="address">内容</label>
	<div class="col-md-9">
		<textarea id="content1" name="content" class="" placeholder="请输入..."><{$_data->content}></textarea>
	</div>
	<div class="clearfix"></div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="activity_type">活动</label>
	<div class="col-md-9">
		<select name="activity_type" id="activity_type" class="form-control select-model" value="<{$_data->activity_type}>" data-model="factory/activity" data-text="{name}" data-has_tip=true data-default_value="0" data-default_text="暂无活动"  data-placeholder="请选择活动"></select>
	</div>
</div>

<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>