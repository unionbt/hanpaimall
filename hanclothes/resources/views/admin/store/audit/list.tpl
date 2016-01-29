<{extends file="admin/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>门店申请<{/block}>

<{block "name"}>store-audit<{/block}>

<{block "filter"}>
<{include file="admin/store/audit/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>负责人账号</th>
<th>负责人姓名</th>
<th>负责人身份证</th>
<th>门店名称</th>
<th>所属代理商</th>
<th>地址</th>
<th>电话</th>
<th>状态</th>
<{/block}>

<!-- 基本视图的Block -->

<{block "table-td-plus"}>
<td><{$item->username}></td>
<td><{$item->realname}></td>
<td><{$item->idcard}></td>
<td><{$item->agent->name}></td>
<td><{$item->name}></td>
<td><{$item->address}></td>
<td><{$item->phone}></td>
<td><{if $item->audited}> <span class="label label-success">通过</span> <{else}>  <span class="label label-danger">待审核</span> <{/if}></td>
<{/block}>

<{block "table-td-options"}>
<td class="text-center">
	<div class="btn-group">
		<{if !$item->audited}><a href="<{'admin'|url}>/store-audit/<{$item->getKey()}>" method="put" confirm="您确定审核通过这个申请：<{$item->username}>吗？" data-toggle="tooltip" title="审核" class="btn btn-xs btn-default"><i class="fa fa-check"></i> 审核通过</a><{/if}>
		<a href="<{'admin'|url}>/store-audit/<{$item->getKey()}>" method="delete" confirm="您确定删除这个申请：<{$item->username}>吗？" data-toggle="tooltip" title="删除" class="btn btn-xs btn-danger"><i class="fa fa-times"></i></a>
	</div>
</td>
<{/block}>