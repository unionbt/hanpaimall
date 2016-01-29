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
	<label class="col-md-3 control-label" for="fid">厂商</label>
	<div class="col-md-9">
		<select name="fid" id="fid" class="select-model form-control" value="<{$_data->fid}>" data-model="admin/factory" data-text="{name}" data-placeholder="请选择厂家名字"></select>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="bid">品牌</label>
	<div class="col-md-9">
		<select name="bid" id="bid" class="form-control">
		<{if  $_data->bid}><option value="<{$_data->bid}>" selected="selected"></option><{/if}>
		</select>
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
<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>
<script>
(function($){
$().ready(function(){
	var $bid = $('#bid');
	$('#fid').on('change', function(){
		$this = $(this);
		var value = $this.val();
		var default_value = $bid.val();

		$bid.empty();

		if (!value) {
			$bid.select2({language: 'zh-CN'});
			return true;
		}
		$.POST('<{'admin/brand/data/json'|url}>', {'filters[fid]': value}, function(json){
			if (json.result == 'success')
			{
				var items = json.data.data;
				for(var i = 0; i < items.length; ++i)
					$('<option value="'+items[i].id+'">'+items[i].name+'</option>').appendTo($bid);
				
				$bid.val(default_value).select2({language: 'zh-CN'});
			}
		}, false);
	});
});
})(jQuery);
</script>