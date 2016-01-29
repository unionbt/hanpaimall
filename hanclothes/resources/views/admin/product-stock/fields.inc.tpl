<div class="form-group">
	<label class="col-md-3 control-label" for="attr_id">属性</label>
	<div class="col-md-9">
		<select name="attr_id" id="attr_id" class="form-control select-model" value="<{$_data->attr_id}>" data-model="admin/product-attr" data-text="{name}" data-placeholder="请选择属性"></select>
	</div>
</div>


<div class="form-group">
	<label class="col-md-3 control-label" for="size_type">大小</label>
	<div class="col-md-9">
		<select name="size_type" id="size_type" class="form-control" data-placeholder="请选择大小">
			<{foreach $_fields.clothes_size_type as $v}>
			<option value="<{$v['id']}>"<{if $v['id']==$_data.size_type}> selected="selected"<{/if}>><{$v['name']}></option> 
			<{/foreach}>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="price">价格</label>
	<div class="col-md-9">
		<input type="text" id="price" name="price" class="form-control" placeholder="请输入这个属性价格" value="<{$_data.price}>">
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="count">数量</label>
	<div class="col-md-9">
		<input type="text" id="count" name="count" class="form-control" placeholder="请输入这个属性库存" value="<{$_data.count}>">
	</div>
</div>

<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>