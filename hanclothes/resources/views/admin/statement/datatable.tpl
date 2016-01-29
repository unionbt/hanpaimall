<{extends file="admin/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>财务报表<{/block}>
<{block "namespace"}>admin<{/block}>
<{block "name"}>statement<{/block}>

<{block "filter"}>
<{include file="admin/statement/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>用户</th>
<th>标题</th>
<th>金额</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'users',orderable:false,render:function(data){
		return data.realname;
	}},
	{'data': 'event_tag'},
	{'data': 'value'}
];
<{/block}>

<{block "datatable-columns-options"}>
		var columns_options = [{'data': null, orderable: false, 'render': function (data, type, full){
			return '<div class="btn-group">无</div>';
			}
		}];
<{/block}>
