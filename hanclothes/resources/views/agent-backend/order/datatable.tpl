<{extends file="agent-backend/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>订单<{/block}>
<{block "namespace"}>agent<{/block}>
<{block "name"}>order<{/block}>

<{block "filter"}>
<{include file="agent-backend/order/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<!--th>标题</th-->
<th>商品总价</th>
<th>快递费</th>
<th>总费</th>
<th>预收</th>
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
	{'data': 'bills',render:function(data){
			var uid = <{$_agent.id}>;
			var money = 0.00;
			for(var key=0;key<data.length;key++){
				if(parseInt(data[key].uid) == parseInt(uid)) money= (parseFloat(money)+parseFloat(data[key].value)).toFixed(2);
			}
			return money;
		}
	},
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
				+'</div>';
			}
		}];
<{/block}>
