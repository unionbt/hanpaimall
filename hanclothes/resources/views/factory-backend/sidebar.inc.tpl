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
					<a href="<{'factory'|url}>" class=""><i class="gi gi-stopwatch sidebar-nav-icon"></i>厂家首页</a>
				</li>
				<li class="sidebar-header">
					<span class="sidebar-header-title">基本</span>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="gi gi-shopping_cart sidebar-nav-icon"></i>订单管理</a>
					<ul>
						<li><a href="<{'factory/order'|url}>" name="order/list">订单列表</a></li>
						<li><a href="<{'factory/express'|url}>" name="express/list">物流列表</a></li>
						<!--li><a href="<{'factory/feedback'|url}>" name="feedback/list">退换货列表</a></li-->
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-cubes sidebar-nav-icon"></i>产品管理</a>
					<ul>
						<li><a href="<{'factory/brand'|url}>" name="brand/list">品牌列表</a></li>
						<li><a href="<{'factory/brand/create'|url}>" name="brand/create"><i class="gi gi-plus"></i> 添加品牌</a></li>
						<li><a href="<{'factory/product'|url}>" name="product/list">产品列表</a></li>
						<li><a href="<{'factory/product/create'|url}>" name="product/create"><i class="gi gi-plus"></i> 添加产品</a></li>
					</ul>
				</li>
				<{pluginclude file="factory-backend/sidebar.inc.tpl"}>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-balance-scale sidebar-nav-icon"></i>代理商管理</a>
					<ul>
						<li><a href="<{'factory/agent'|url}>" name="agent/list">代理商列表</a></li>
						<li><a href="<{'factory/agent-audit'|url}>" name="agent-audit/list">代理商待审核列表</a></li>
						<li><a href="<{'factory/agent-audit/create'|url}>" name="agent-audit/create"><i class="gi gi-plus"></i> 申请代理商</a></li>
						<!--li><a href="<{'factory/store'|url}>" name="store/list">门店列表</a></li-->
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-line-chart sidebar-nav-icon"></i>财务管理</a>
					<ul>
						<li><a href="<{'factory/withdraw'|url}>" name="withdraw/list">提现列表</a></li>
						<li><a href="<{'factory/withdraw/create'|url}>" name="withdraw/create"><i class="gi gi-plus"></i> 立即提现</a></li>
						<li><a href="<{'factory/bankcard'|url}>" name="bankcard/list"> 银行卡管理</a></li>
						<li><a href="<{'factory/bankcard/create'|url}>" name="bankcard/create"><i class="gi gi-plus"></i>添加银行卡</a></li>
						<li><a href="<{'factory/statement'|url}>" name="statement/list">财务报表</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="gi gi-settings sidebar-nav-icon"></i>系统设置</a>
					<ul>
						<li><a href="<{'factory/user/password'|url}>">修改密码</a></li>
						<li><a href="<{'factory/user'|url}>">修改资料</a></li>
						<li><a href="<{'auth/logout'|url}>">退出系统</a></li>
					</ul>
				</li>
			</ul>
			<!-- END Sidebar Navigation -->
			<{/block}>
		</div>
		<!-- END Sidebar Content -->
	</div>
	<!-- END Wrapper for scrolling functionality -->
</div>
<!-- END Main Sidebar -->

