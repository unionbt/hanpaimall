<{extends file="factory-backend/extends/list.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>银行卡<{/block}>

<{block "name"}>bankcard<{/block}>

<{block "table-th-plus"}>
<th>用户名</th>
<th>银行类型</th>
<th>持卡人</th>
<th>银行支行</th>
<th>卡号</th>
<{/block}>

<{block "table-td-plus"}>

<td><{$item->users->realname}></td>
<td><{$item->bank_name->title}></td>
<td><{$item->bank_branch}></td>
<td><{$item->cardholder}></td>
<td><{$item->card_no}></td>
<{/block}>

<{block "table-td-options-delete-confirm"}>您确定删除这个银行卡：<{$item->card_no}>吗？<{/block}>