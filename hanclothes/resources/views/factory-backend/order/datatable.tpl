<{extends file="factory-backend/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>订单<{/block}>
<{block "namespace"}>factory<{/block}>
<{block "name"}>order<{/block}>

<{block "filter"}>
<{include file="factory-backend/order/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<!--th>标题</th-->
<th>商品总价</th>
<th>快递费</th>
<th>总费</th>
<th>状态</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	//{'data': 'title'},
	{'data': 'details_money'},
	{'data': 'expresses_money'},
	{'data': 'total_money'},
	{'data': 'status',render:function(data){
	    var status_tag = '';
	    switch(parseInt(data)){
	        case <{App\Order::INIT}> : status_tag='商品确认';break;
	        case <{App\Order::CANCELED}> :status_tag='订单已取消'; break;
	        case <{App\Order::PAID}> :status_tag='订单已支付'; break;
	        case <{App\Order::REFUSED}> :status_tag='订单退款'; break;
	        case <{App\Order::DELIVERED}> :status_tag='订单已发货'; break;
	        case <{App\Order::DEALT}> :status_tag='已确认收货/成交'; break;
	        case <{App\Order::REJECTED}> :status_tag='已拒绝收货';break;
	        case <{App\Order::CLOSED}> :status_tag='关闭'; break;
	        case <{App\Order::COMPARE_BILL_FAIL}> :status_tag='对账失败';  break;
	        default: status_tag='未知';
	   		}
	   		return status_tag;
		}
	},
];
<{/block}>

<{block "datatable-columns-options"}>
		var columns_options = [{'data': null, orderable: false, 'render': function (data, type, full){
			return '<div class="btn-group">\
				<a href="<{''|url}>/<{block "namespace"}>admin<{/block}>/<{block "name"}><{/block}>/'+full['id']+'/edit" data-toggle="tooltip" title="编辑" class="btn btn-xs btn-default"><i class="fa fa-pencil"></i></a>'
				+ (parseInt(full['status']) ==1 ?'<a href="<{''|url}>/<{block "namespace"}>admin<{/block}>/<{block "name"}><{/block}>/'+full['id']+'/cancel" data-toggle="tooltip" method="delete" confirm="您确定取消这个订单：'+full['id']+'吗？" title="取消" class="btn btn-xs btn-danger"><i class="fa fa-times"></i></a>':'')
				+ (parseInt(full['status']) ==2 ?'<a href="<{''|url}>/<{block "namespace"}>admin<{/block}>/<{block "name"}><{/block}>/'+full['id']+'/deliver" data-toggle="tooltip" title="发货" class="btn btn-xs btn-info"><i class="fa fa-inbox"></i></a>':'')
				+'</div>';
			}
		}];
<{/block}>
