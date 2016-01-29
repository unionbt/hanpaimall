<div class="form-group">
	<label class="col-md-3 control-label" for="uid">绑定用户</label>
	<div class="col-md-9">
		<select name="id" id="uid" value="<{$_data.id}>" class="form-control suggest-model" data-model="factory/member" data-text="{realname}({phone})" data-term="realname" data-filters='{"role_id": "5"}' data-placeholder="请输入真实姓名查找"></select>
		<span class="help-block">(*) 选定后，不可修改</span>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="name">门店名称</label>
	<div class="col-md-9">
		<input type="text" id="name" name="name" class="form-control" placeholder="请输入名称" value="<{$_data.name}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="agent_ids">所代理代理商</label>
	<div class="col-md-9">
		<select name="agent_ids[]" id="agent_ids" class="select-model form-control" value="<{if !empty($_data)}><{$_data->agent_ids()->toArray()|implode:','}><{/if}>" data-model="factory/agent" data-text="{name}" data-placeholder="请选择代理商名字" multiple="multiple"></select>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="brand_ids">所代理品牌</label>
	<div class="col-md-9">
		<select name="brand_ids[]" id="brand_ids" class="form-control select-select2" multiple="multiple">
		<{foreach $_data->brands as $item}>
			<option value="<{$item->getKey()}>" selected="selected"><{$item->name}></option>
		<{/foreach}>
		</select>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="phone">门店手机</label>
	<div class="col-md-9">
		<input type="text" id="phone" name="phone" class="form-control" placeholder="请输入..." value="<{$_data.phone}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="address">门店地址</label>
	<div class="col-md-9">
		<input type="address" id="address" name="address" class="form-control" placeholder="请输入..." value="<{$_data.address}>">
	</div>
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
	var $brand_ids = $('#brand_ids');
	$('#agent_ids').on('change', function(){
		$this = $(this);
		var value = $this.val();
		var default_value = $brand_ids.val();

		$brand_ids.empty();

		if (!value) {
			$brand_ids.select2({language: 'zh-CN'});
			return true;
		}
		$.POST('<{'factory/agent/data/json'|url}>', {'filters[id][in]': value}, function(json){
			if (json.result == 'success')
			{
				var items = json.data.data;
				for(var i = 0; i < items.length; ++i)
				{
					var $o = $('<optgroup label="'+items[i].name+'"></optgroup>').appendTo($brand_ids);
					for (var j = 0; j < items[i].brands.length; j++)
						$('<option value="'+items[i].brands[j].id+'">'+items[i].brands[j].name+'</option>').appendTo($o);
				}
				$brand_ids.val(default_value).select2({language: 'zh-CN'});
			}
		}, false);
	});
});
})(jQuery);
</script>