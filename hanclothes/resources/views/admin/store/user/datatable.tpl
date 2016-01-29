<{extends file="admin/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>门店用户<{/block}>

<{block "name"}>store-user<{/block}>

<{block "head-scripts-after"}>
<script src="<{'static/js/emojione.js'|url}>"></script>
<{/block}>

<{block "filter"}>
<{include file="admin/store/user/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th class="text-center"><i class="gi gi-user"></i></th>
<th>账号</th>
<th>昵称</th>
<th>姓名</th>
<th>手机</th>
<th>门店</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': "avatar_aid", orderable: false, 'render': function(data, type, full){
		return '<img src="<{'attachment/resize'|url}>?id='+data+'&width=80&height=80" alt="avatar" class="img-circle">';
	}},
	{'data': 'username'},
	{'data': 'nickname', 'render': function(data, type, full){
		return data ? '<span class="enable-emoji">'+ data.emojione() +'</span>' : '';
	}},
	{'data': 'realname', orderable: false},
	{'data': 'phone', orderable: false},
	{'data': 'stores', orderable: false, render: function(data){
		var html = '';
		if (data) data.forEach(function(i){
			html += '<span class="label label-info">'+i.name+'</span><br />';
		});
		return html;
	}}
];
<{/block}>

<{block "datatable-columns-options"}>
var columns_options = [{'data': null, orderable: false}];
<{/block}>