<{extends file="factory-backend/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>门店用户<{/block}>

<{block "name"}>store-user<{/block}>

<{block "head-scripts-after"}>
<script src="<{'static/js/emojione.js'|url}>"></script>
<script>
(function($){
$().ready(function(){
	$('.enable-emoji').each(function(){
		var html = $(this).html();
		$(this).html(html.emojione());
	});
});
})(jQuery);
</script>
<{/block}>

<{block "filter"}>
<{include file="factory-backend/store/user/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th class="text-center"><i class="gi gi-user"></i></th>
<th>账号</th>
<th>昵称</th>
<th>姓名</th>
<th>手机</th>
<th>门店</th>
<{/block}>

<!-- 基本视图的Block -->

<{block "table-td-plus"}>
<td class="text-center"><img src="<{'attachment/resize'|url}>?id=<{$item->avatar_aid}>&width=80&height=80" alt="avatar" class="img-circle"></td>
<td><{$item->username}></td>
<td><span class="enable-emoji"><{$item->nickname}></span></td>
<td><{$item->realname}></td>
<td><{$item->phone}></td>
<td><{foreach $item->stores as $store}><span class="label label-info"><{$store->name}></span><br /><{/foreach}></td>
<{/block}>

<{block "table-td-options"}>
<{/block}>