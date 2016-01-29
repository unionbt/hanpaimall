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
		<input type="text" id="money" name="money" type="number" class="form-control" placeholder="请输入提现金额" value="<{$_data.money}>" max="<{$_user_money.usable_money}>" min="<{$_site.minimum_withdraw}>" data-fee="<{$_site.withdraw_counter_percent}>">
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="counter_fee">手续费</label>
	<div class="col-md-9">
		<input type="text" id="counter_fee" name="counter_fee" class="form-control" value="<{$_data.counter_fee}>" readOnly=true>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="card_id">开户行</label>
	<div class="col-md-9">
		<div class="col-md-9">
		<select name="card_id" id="card_id" class="form-control" data-placeholder="请选择银行卡">
			<{foreach $_bank_cards as $v}>
			<option value="<{$v['id']}>"<{if $v['id']==$_data.card_id}> selected="selected"<{/if}>><{$v->bank_name->title}>-<{$v->bank_branch}>&nbsp;&nbsp;<{$v->cardholder}>(<{$v->card_no}>)</option> 
			<{/foreach}>
		</select>
		<{if $_bank_cards->count()<1}><a href="<{'factory/bankcard/create'|url}>">请先添加一张银行卡</a><{/if}>
		</div>
	</div>
</div>

<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 提交</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>