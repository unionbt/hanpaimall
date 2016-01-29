<{extends file="admin/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>厂家<{/block}>

<{block "name"}>factory<{/block}>

<{block "filter"}>
<{include file="admin/factory/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>名称</th>
<th>负责人</th>
<th>手机</th>
<th>身份证</th>
<th>代理数量</th>
<th>品牌数量</th>
<{/block}>

<!-- 基本视图的Block -->

<{block "table-td-plus"}>
<td><{$item->name}></td>
<td><{$item->user->realname}></td>
<td><{$item->user->phone}></td>
<td><{$item->user->idcard}></td>
<td><{$item->agents()->count()}></td>
<td><{$item->brands()->count()}></td>
<{/block}>

<{block "table-td-options-delete-confirm"}>您确定删除这个厂家：<{$item->name}>吗？<{/block}>

<{block "table-td-options-plus"}>
	<a href="<{'admin'|url}>/brand/?filters[fid][in][]=<{$item->getKey()}>" data-toggle="tooltip" title="品牌列表" class="btn btn-xs btn-default"><i class="fa fa-registered"></i> 品牌列表</a>
<{/block}>
