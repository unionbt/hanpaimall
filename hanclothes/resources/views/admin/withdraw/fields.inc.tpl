<div class="form-group">
	<label class="col-md-3 control-label" for="title">帐户余额</label>
	<div class="col-md-9">
		<label class="form-control"><{$_user_money.amount}>元</label>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="title">冻结余额</label>
	<div class="col-md-9">
		<label class="form-control"><{$_user_money.freeze_money}>元</label>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="title">可提现金额</label>
	<div class="col-md-9">
		<label class="form-control"><{$_user_money.usable_money}>元</label>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="money">提现金额</label>
	<div class="col-md-9">
		<label class="form-control"><{$_data.money}>元</label>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="title">银行卡信息</label>
	<div class="col-md-9">
		<label class="form-control"><{$_data->bankcards->bank_name->title}>-<{$_data->bank_branch}>&nbsp;&nbsp;<{$_data->bankcards->cardholder}>(<{$_data->bankcards->card_no}>)</label>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="counter_fee">手续费</label>
	<div class="col-md-9">
		<label class="form-control"><{$_data.counter_fee}>元</label>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="audit">审核</label>
	<div class="col-md-9">
		<input name="audit" type="radio" value="1"/>通过   <input name="audit" type="radio" value="0"/>不通过
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="note">审核备注</label>
	<div class="col-md-9">
		<textarea id="note" name="note" class="form-control"><{$_data.note}></textarea>
	</div>
</div>
		
<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>