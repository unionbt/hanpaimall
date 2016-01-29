<div class="form-group">
	<label class="col-md-3 control-label" for="name">门店名称</label>
	<div class="col-md-9">
		<input type="text" id="name" name="name" class="form-control" placeholder="请输入名称" value="<{$_data.name}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="username">负责人手机</label>
	<div class="col-md-9">
		<input type="text" id="username" name="username" class="form-control" placeholder="请输入手机" value="<{$_data.username}>">
		<span class="help-block">(*) 即门店后台的登录账号</span>
	</div>
</div>
<div class="form-group" id="exists_tips" style="display: none;">
	<div class="col-md-offset-3 col-md-9 text-center">
		<div class="alert alert-warning text-left">
			本手机已入驻系统，姓名、身份证将被自动设置！
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="realname">负责人姓名</label>
	<div class="col-md-9">
		<input type="text" id="realname" name="realname" class="form-control" placeholder="请输入姓名" value="<{$_data.realname}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="idcard">负责人身份证</label>
	<div class="col-md-9">
		<input type="text" id="idcard" name="idcard" class="form-control" placeholder="请输入身份证" value="<{$_data.idcard}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="phone">门店电话</label>
	<div class="col-md-9">
		<input type="text" id="phone" name="phone" class="form-control" placeholder="请输入电话" value="<{$_data.phone}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="address">门店地址</label>
	<div class="col-md-9">
		<input type="text" id="address" name="address" class="form-control" placeholder="请输入地址" value="<{$_data.address}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="brand_ids">所代理品牌</label>
	<div class="col-md-9">
		<select name="brand_ids[]" id="brand_ids" value="<{if !empty($_data)}><{$_data.brand_ids->toArray()|implode:','}><{/if}>" class="form-control select-model" data-model="agent/brand" data-text="{name}" data-placeholder="请选择品牌" multiple="multiple">
		</select>
	</div>
</div>
<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>