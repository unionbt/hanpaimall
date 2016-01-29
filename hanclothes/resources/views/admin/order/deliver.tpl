<{extends file="admin/extends/edit.block.tpl"}>

<{block "head-plus"}>
<{include file="common/uploader.inc.tpl"}>
<{include file="common/editor.inc.tpl"}>
<{/block}>

<{if isset($_validates)}>
<{block "inline-script-plus"}>
<{call validate selector='#form'}>
<{/block}>
<{/if}>

<{block "title"}>订单发货<{/block}>
<{block "subtitle"}>编号:<{$_data.id}><{/block}>

<{block "name"}>order<{/block}>
<{block "subaction"}>/save_deliver<{/block}>

<{block "fields"}>
<{if isset($_user_address)}>
<div class="form-group">
	<label class="col-md-3 control-label" for="express_name">快递名称</label>
	<div class="col-md-9">
		<select name="express_name" id="express_name" class="form-control">
			<{foreach $_fields.express_name as $v}>
			 	<option value="<{$v.id}>" <{if $_data.express_name==$v.id}> selected="selected"<{/if}>><{$v.title}></option>
			<{/foreach}>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label" for="no">快递单号</label>
	<div class="col-md-9">
		<input type="text" id="no" name="no" class="form-control" placeholder="请输入快递单号" value="<{$_data.no}>">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="address">收货地址:<{$_user_address}></label>
</div>
<{/if}>

<{if isset($_user_store)}>
	<label class="col-md-3 control-label" for="address">发货店铺:<{$_user_store.name}>-<{$_user_store.address}></label>
<{/if}>

<div class="form-group form-actions">
	<div class="col-md-9 col-md-offset-3">
		<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> 发货</button>
		<button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 重设</button>
	</div>
</div>
<{/block}>
