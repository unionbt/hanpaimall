<div class="form-group">
	<label class="col-md-3 control-label" for="name">属性名</label>
	<div class="col-md-9">
		<input type="text" id="name" name="name" class="form-control" placeholder="请输入标题" value="<{$_data.name}>">
		<input type="hidden" id="pid" name="pid" value="<{$_product.id}>"/>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="name">属性封面</label>
	<div class="col-md-9">
		<select id="aid" name="aid" class="form-control hidden">
		<{if !empty($_data)}>
			<option value="<{$_data.aid}>" selected="selected"></option>
		<{/if}>
		</select>
		<div class="alert alert-info"><i class="fa fa-warning"></i> 可以上传1张图片作为产品的属性图</div>
	</div>
</div>
<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>