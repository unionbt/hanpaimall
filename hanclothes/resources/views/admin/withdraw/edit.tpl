<{extends file="admin/extends/edit.block.tpl"}>

<{block "title"}>提现<{/block}>
<{block "subtitle"}><{$_data.id}><{/block}>

<{block "name"}>withdraw<{/block}>

<{block "fields"}>
<{include file="admin/withdraw/fields.inc.tpl"}>
<{/block}>


<{block "inline-script-plus"}>
	$('#money').on('keyup',function(){
		var withdraw = parseFloat($(this).val());
		if(isNaN(withdraw)) withdraw=0;
		$('#counter_fee').val((withdraw*$(this).data('fee')).toFixed(2));
		
	});
<{/block}>