<div class="form-group">
	<label class="col-md-3 control-label" for="uid">绑定用户</label>
	<div class="col-md-9">
		<select name="id" id="uid" value="<{$_data.id}>" class="form-control suggest-model" data-model="admin/member" data-text="{realname}({phone})" data-term="realname" data-filters='{"role_id": "3"}' data-placeholder="请输入真实姓名查找"></select>
		<span class="help-block">(*) 选定后，不可修改</span>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="name">厂家名称</label>
	<div class="col-md-9">
		<input type="text" id="name" name="name" class="form-control" placeholder="请输入名称" value="<{$_data.name}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="address">厂家地址</label>
	<div class="col-md-9">
		<input type="address" id="address" name="address" class="form-control" placeholder="请输入..." value="<{$_data.address}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="phone">厂家电话</label>
	<div class="col-md-9">
		<input type="phone" id="phone" name="phone" class="form-control" placeholder="请输入..." value="<{$_data.phone}>">
	</div>
</div>

<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>