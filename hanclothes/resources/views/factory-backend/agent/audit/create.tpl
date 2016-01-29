<{extends file="factory-backend/extends/create.block.tpl"}>

<{block "head-plus"}>

<{/block}>

<{block "inline-script-plus"}>
$('#username').on('change', function(){
	var username = $(this).val();
	$('#idcard,#realname').prop('readonly', false);$('#exists_tips').hide();
	$.POST('<{'factory/member/data/json'|url}>', {filters:{'username': username}}, function(json){
		if (json.result == 'success')
			if (json.data.data.length > 0)
			{
				var item = json.data.data[0];
				$('#idcard,#realname').attr('readonly', true);
				$('#idcard').val(item.idcard);
				$('#realname').val(item.realname);
				$('#exists_tips').show();
			}
	}, false);
});
<{/block}>

<{block "title"}>申请代理商<{/block}>

<{block "name"}>agent-audit<{/block}>

<{block "fields"}>
<{include file="factory-backend/agent/audit/fields.inc.tpl"}>
<{/block}>
