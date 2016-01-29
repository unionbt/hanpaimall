<div class="form-group">
	<label class="col-md-3 control-label" for="name">代理商名称</label>
	<div class="col-md-9">
		<p class="form-control-static"><{$_data.name}></p>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="realname">负责人</label>
	<div class="col-md-9">
		<p class="form-control-static"><{$_data.user.realname}> (<{$_data.user.username}>)</p>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="phone">代理商电话</label>
	<div class="col-md-9">
		<p class="form-control-static"><{$_data.phone}></p>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="address">代理商地址</label>
	<div class="col-md-9">
		<p class="form-control-static"><{$_data.address}></p>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="brand_ids">所代理品牌</label>
	<div class="col-md-9">
		<select name="brand_ids[]" id="brand_ids" value="<{if !empty($_data)}><{$_data.brand_ids->toArray()|implode:','}><{/if}>" class="form-control select-model" data-model="factory/brand" data-text="{name}" data-placeholder="请选择品牌" multiple="multiple">
		</select>
	</div>
</div>
<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>