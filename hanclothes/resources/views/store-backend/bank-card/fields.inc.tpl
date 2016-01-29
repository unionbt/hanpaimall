<div class="form-group">
	<label class="col-md-3 control-label" for="bank_type">开户行:</label>
	<div class="col-md-9">
		<select name="bank_type" id="bank_type" class="form-control" data-placeholder="请选择银行卡类别">
			<{foreach $_fields.bank_name as $v}>
			<option value="<{$v['id']}>"<{if $v['id']==$_data.bank_type}> selected="selected"<{/if}>><{$v['title']}></option> 
			<{/foreach}>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="bank_branch">开户行分支</label>
	<div class="col-md-9">
		<input type="text" id="bank_branch" name="bank_branch" class="form-control" placeholder="请输入开户行分支" value="<{$_data.bank_branch}>"><font color="red">(请正确填写开户行分支信息，否则无法到帐.)</font>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="cardholder">持卡人</label>
	<div class="col-md-9">
		<input type="text" id="cardholder" name="cardholder" class="form-control" placeholder="请输入持卡人名字" value="<{$_data.cardholder}>">
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="card_no">卡号</label>
	<div class="col-md-9">
		<input type="text" id="card_no" name="card_no" class="form-control" placeholder="请输入持卡号" value="<{$_data.card_no}>">
	</div>
</div>

<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>