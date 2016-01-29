<{extends file="store-backend/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>订单<{/block}>
<{block "namespace"}>store<{/block}>
<{block "name"}>order<{/block}>

<{block "filter"}>
<{include file="store-backend/order/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<!--th>标题</th-->
<th>商品总价</th>
<th>快递费</th>
<th>总费</th>
<th>预收</th>
<th>状态</th>
<{/block}>

<!-- 基本视图的Block -->
<{block "table-td-options"}>
	<td class="text-center">
		<div class="btn-group">
			<a href="<{''|url}>/<{block "namespace"}>admin<{/block}>/<{block "name"}><{/block}>/<{$item->getKey()}>/edit" data-toggle="tooltip" title="查看" class="btn btn-xs btn-default"><i class="fa fa-pencil"></i></a>
		<{if $item.status==\App\Order::INIT}>
			<a href="<{''|url}>/<{block "namespace"}>admin<{/block}>/<{block "name"}><{/block}>/<{$item->getKey()}>/cancel" data-toggle="tooltip" method="delete" confirm="您确定取消这个订单：<{$item->id}>吗？" title="取消" class="btn btn-xs btn-info"><i class="fa fa-pencil"></i></a>
		<{elseif $item.status==\App\Order::PAID}>
			<a href="<{''|url}>/<{block "namespace"}>admin<{/block}>/<{block "name"}><{/block}>/<{$item->getKey()}>/deliver" data-toggle="tooltip" title="发货" class="btn btn-xs btn-danger"><i class="fa fa-pencil"></i></a>
		<{elseif $item.status==\App\Order::CANCELED}>
			<a href="<{''|url}>/<{block "namespace"}>admin<{/block}>/<{block "name"}><{/block}>/<{$item->getKey()}>" method="delete" confirm="<{block "table-td-options-delete-confirm"}>您确定删除这个订单：<{$item->id}>吗？<{/id}>" data-toggle="tooltip" title="删除" class="btn btn-xs btn-danger"><i class="fa fa-times"></i></a>
		<{/if}>
		</div>
	</td>
<{/block}>

<{block "table-td-plus"}>
<!--td><{$item->title}></td-->
<td><{$item->details_money}>%</td>
<td><{$item->expresses_money}>%</td>
<td><{$item->total_money}></td>
<td><{$item->expect_money($_store->id)}></td>
<td><{$item->status}></td>
<{/block}>
