<{extends file="store-backend/extends/datatable.block.tpl"}>

<{block "menu-option-delete"}> <{/block}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>用户<{/block}>

<{block "name"}>member<{/block}>

<{block "head-scripts-after"}>
<script src="<{'static/js/emojione.js'|url}>"></script>
<{/block}>

<{block "filter"}>
<{include file="store-backend/member/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th class="text-center"><i class="gi gi-user"></i></th>
<th>用户名</th>
<th>昵称</th>
<th>姓名</th>
<th>性别</th>
<th>手机</th>
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
	{'data': 'realname'},
	{'data': '_gender', orderable: false, 'render': function(data, type, full){
		return '<span class="label label-primary">'+(data ? data.title : '未知')+'</span>';
	}},
	{'data': 'phone'}
];
<{/block}>

<{block "datatable-columns-options"}>
		var columns_options = [{'data': null, orderable: false, 'render': function (data, type, full){
			return '<div class="btn-group">\
				<a href="<{''|url}>/<{block "namespace"}>store<{/block}>/<{block "name"}><{/block}>/'+full['id']+'/edit" data-toggle="tooltip" title="查看" class="btn btn-xs btn-default"><i class="fa fa-pencil"></i></a>'
				+'</div>';
			}
		}];
<{/block}>
