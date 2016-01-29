<{extends file="factory-backend/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>门店<{/block}>

<{block "name"}>store<{/block}>

<{block "filter"}>
<{include file="factory-backend/store/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>门店名称</th>
<th>负责人</th>
<th>手机</th>
<th>身份证</th>
<th>品牌数量</th>
<th>代理数量</th>
<th>用户数量</th>
<th>二维码</th>
<{/block}>

<!-- 基本视图的Block -->

<{block "table-td-plus"}>
<td><{$item->name}></td>
<td><{$item->user->realname}></td>
<td><{$item->user->phone}></td>
<td><{$item->user->idcard}></td>
<td><{$item->brands()->count()}></td>
<td><{$item->agents()->count()}></td>
<td><{$item->users()->count()}></td>
<td><div class="text-center"><a href="#modal-qrcode" data-toggle="modal" data-sid="<{$item->getKey()}>" class="enable-tooltip" title="" data-original-title="查看二维码"><i class="fa fa-qrcode"></i></a></div></td>
<{/block}>

<{block "table-td-options-delete-confirm"}>您确定删除这个门店：<{$item->name}>吗？<{/block}>

<{block "table-td-options-plus"}>
	<a href="<{'factory'|url}>/store-user/?filters[sid][in][]=<{$item->getKey()}>" data-toggle="tooltip" title="用户列表" class="btn btn-xs btn-default"><i class="fa fa-registered"></i> 用户列表</a>
<{/block}>

<{block "body-plus"}>
<{include file="factory-backend/store/qrcode-modal.inc.tpl"}>
<{/block}>