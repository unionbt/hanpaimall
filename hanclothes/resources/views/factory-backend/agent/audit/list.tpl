<{extends file="factory-backend/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>代理商申请<{/block}>

<{block "name"}>agent-audit<{/block}>

<{block "filter"}>
<{include file="factory-backend/agent/audit/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>负责人账号</th>
<th>负责人姓名</th>
<th>负责人身份证</th>
<th>代理商名称</th>
<th>地址</th>
<th>电话</th>
<th>状态</th>
<{/block}>

<!-- 基本视图的Block -->

<{block "table-td-plus"}>
<td><{$item->username}></td>
<td><{$item->realname}></td>
<td><{$item->idcard}></td>
<td><{$item->name}></td>
<td><{$item->address}></td>
<td><{$item->phone}></td>
<td><{if $item->audited}> <span class="label label-success">通过</span> <{else}>  <span class="label label-danger">正在审核</span> <{/if}></td>
<{/block}>

<{block "table-th-options"}><{/block}>

<{block "table-td-options"}><{/block}>