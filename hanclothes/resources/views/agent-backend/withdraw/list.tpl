<{extends file="agent-backend/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>提现<{/block}>

<{block "name"}><{/block}>

<{block "filter"}>
<{include file="agent-backend/withdraw/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>用户名</th>
<th>提现金额</th>
<th>手续费</th>
<th>提现银行卡信息</th>
<th>备注</th>
<th>状态</th>
<{/block}>

<!-- 基本视图的Block -->
<{block "table-td-options-plus"}>
<{if $item->audit==\App\Withdraw::INIT}>
<a href="<{'?='|url}><{$item->getKey()}>" data-toggle="tooltip" title="审核" class="btn btn-xs btn-danger"><i class="fa fa-pencil"></i></a>
<a href="<{'?='|url}><{$item->getKey()}>" data-toggle="tooltip" title="取消" class="btn btn-xs btn-danger"><i class="fa fa-pencil"></i></a>
<{/if}>
<{/block}>

<{block "table-td-plus"}>

<td><{$item->users->realname}></td>
<td><{$item->money}></td>
<td><{$item->counter_fee}></td>
<td><{$item->bankcards->bank_name->title}>-<{$item->bank_branch}>&nbsp;&nbsp;<{$item->bankcards->cardholder}>(<{$item->bankcards->card_no}>)</td>
<td><{$item->note}></td>
<td><{$item->audit_tag}></td>
<{/block}>

<{block "table-td-options-delete-confirm"}>您确定取消这个产品：<{$item->title}>吗？<{/block}>