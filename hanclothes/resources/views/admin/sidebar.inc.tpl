<!-- Main Sidebar -->
<div id="sidebar">
	<!-- Wrapper for scrolling functionality -->
	<div class="sidebar-scroll">
		<!-- Sidebar Content -->
		<div class="sidebar-content">
			<{block "sidebar-brand"}><{include file="admin/sidebar.brand.inc.tpl"}><{/block}>
			<{block "sidebar-user"}><{include file="admin/sidebar.user.inc.tpl"}><{/block}>
			<{block "sidebar-theme"}><{include file="admin/sidebar.theme.inc.tpl"}><{/block}>
			<{block "sidebar-navigation"}>
			<!-- Sidebar Navigation -->
			<ul class="sidebar-nav">
				<li>
					<a href="<{''|url}>" class=""><i class="gi gi-stopwatch sidebar-nav-icon"></i>首页</a>
				</li>
				<li class="sidebar-header">
					<span class="sidebar-header-title">基本</span>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="gi gi-user sidebar-nav-icon"></i>会员管理</a>
					<ul>
						<li><a href="<{'admin/member'|url}>" name="member/list">会员列表</a></li>
						<li><a href="<{'admin/member/create'|url}>" name="member/create"><i class="gi gi-plus"></i> 添加会员</a></li>
					</ul>
				</li>
				<{pluginclude file="admin/sidebar.inc.tpl"}>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-sitemap sidebar-nav-icon"></i>厂家管理</a>
					<ul>
						<li><a href="<{'admin/factory'|url}>" name="factory/list">厂家列表</a></li>
						<li><a href="<{'admin/factory/create'|url}>" name="factory/create"><i class="gi gi-plus"></i> 添加厂家</a></li>
						<li><a href="<{'admin/brand'|url}>" name="brand/list">品牌列表</a></li>
						<li><a href="<{'admin/brand/create'|url}>" name="brand/create"><i class="gi gi-plus"></i> 添加品牌</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-balance-scale sidebar-nav-icon"></i>代理商管理</a>
					<ul>
						<li><a href="<{'admin/agent'|url}>" name="agent/list">代理商列表</a></li>
						<li><a href="<{'admin/agent-audit'|url}>" name="agent-audit/list">代理商申请列表</a></li>
						<li><a href="<{'admin/agent/create'|url}>" name="agent/create"><i class="gi gi-plus"></i> 添加代理商</a></li>
						<li><a href="<{'admin/store'|url}>" name="store/list">门店列表</a></li>
						<li><a href="<{'admin/store-audit'|url}>" name="store-audit/list">门店申请列表</a></li>
						<li><a href="<{'admin/store-user'|url}>" name="store-user/list">门店用户列表</a></li>
						<li><a href="<{'admin/store/create'|url}>" name="store/create"><i class="gi gi-plus"></i> 添加门店</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-shopping-cart sidebar-nav-icon"></i>产品管理</a>
					<ul>
						<li><a href="<{'admin/product'|url}>" name="product/list">产品列表</a></li>
						<li><a href="<{'admin/product/create'|url}>" name="product/create"><i class="gi gi-plus"></i> 添加产品</a></li>
						<li><a href="<{'admin/order'|url}>" name="order/list">订单列表</a></li>
						
						
						<!--li><a href="<{'admin/refund'|url}>" name="refund/list">退换货列表</a></li-->
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-line-chart sidebar-nav-icon"></i>财务管理</a>
					<ul>
						<li><a href="<{'admin/statistics'|url}>" name="statistics/list">财务报表</a></li>
						<li><a href="<{'admin/wechat/statement'|url}>" name="wechat/statement/list">微信入账列表</a></li>
						<li><a href="<{'admin/withdraw'|url}>" name="withdraw/list">提现列表</a></li>
					</ul>
				</li>
				<li><a href="<{'admin/home/show'|url}>"><i class="fa fa-user sidebar-nav-icon"></i> 修改资料</a></li>
				<li><a href="<{'auth/logout'|url}>"><i class="gi gi-exit sidebar-nav-icon"></i>退出系统</a></li>
			</ul>
			<!-- END Sidebar Navigation -->
			<{/block}>
		</div>
		<!-- END Sidebar Content -->
	</div>
	<!-- END Wrapper for scrolling functionality -->
</div>
<!-- END Main Sidebar -->

