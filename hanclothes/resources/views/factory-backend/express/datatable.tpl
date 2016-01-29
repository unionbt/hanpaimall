<{extends file="factory-backend/extends/datatable.block.tpl"}>
<!-- 
公共Block 
由于extends中无法使用if/include，所以需要将公共Block均写入list.tpl、datatable.tpl
-->

<{block "title"}>物流<{/block}>
<{block "namespace"}>factory<{/block}>
<{block "name"}>express<{/block}>

<{block "filter"}>
<{include file="factory-backend/express/filters.inc.tpl"}>
<{/block}>

<{block "table-th-plus"}>
<th>物流方式</th>
<th>配送地址</th>
<th>配送店铺</th>
<th>快递公司</th>
<th>快递单号</th>
<th>状态</th>
<{/block}>

<!-- DataTable的Block -->

<{block "datatable-config-pageLength"}><{$_pagesize}><{/block}>

<{block "datatable-columns-plus"}>
var columns_plus = [
	{'data': 'order_express.express_type_names',render:function(data){
			return data!=null?data.title:'';
	}},
	{'data': 'order_express.user_address',render:function(data){
			return data!=null?data.full_address:'无';
		}
	},
	{'data': 'order_express.stores',render:function(data){
			if(data != null){
				return  data.name+'-店主:'+data.user.realname+'-电话:'+data.phone+'-地址:'+((data.address)?data.address:'无');
			}else{
				return '无';
			}
		}
	},
	{'data': 'order_express.express_types',render:function(data){
			return data!=null?data.title:'';
	}},
	{'data': 'order_express.no'},
	{'data': 'status',render:function(data){
	    var status_tag = '';
	    switch(parseInt(data)){
	        case <{App\Order::INIT}> : status_tag='未付款';break;
	        case <{App\Order::CANCELED}> :status_tag='已取消'; break;
	        case <{App\Order::PAID}> :status_tag='未发货'; break;
	        case <{App\Order::REFUSED}> :status_tag='已退款'; break;
	        case <{App\Order::DELIVERED}> :status_tag='已发货'; break;
	        case <{App\Order::DEALT}> :status_tag='已成交'; break;
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
				<a href="<{''|url}>/<{block "namespace"}>factory<{/block}>/<{block "name"}><{/block}>/'+full['id']+'/edit" data-toggle="tooltip" title="编辑" class="btn btn-xs btn-default"><i class="fa fa-pencil"></i></a>'
				+'</div>';
			}
		}];
<{/block}>
