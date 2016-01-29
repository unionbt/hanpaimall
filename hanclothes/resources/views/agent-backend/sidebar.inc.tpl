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
					<a href="<{'agent'|url}>" class=""><i class="gi gi-stopwatch sidebar-nav-icon"></i>代理商首页</a>
				</li>
				<li class="sidebar-header">
					<span class="sidebar-header-title">基本</span>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="gi gi-shopping_cart sidebar-nav-icon"></i>产品管理</a>
					<ul>
						<li><a href="<{'agent/brand'|url}>" name="brand/list">品牌列表</a></li>
						<li><a href="<{'agent/order'|url}>" name="order/list">订单列表</a></li>
						<li><a href="<{'agent/express'|url}>" name="express/list">物流列表</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-balance-scale sidebar-nav-icon"></i>代理商管理</a>
					<ul>
						<li><a href="<{'agent/store'|url}>" name="store/list">门店列表</a></li>
						<li><a href="<{'agent/store-audit'|url}>" name="store-audit/list">门店待审核列表</a></li>
						<li><a href="<{'agent/store-audit/create'|url}>" name="store-audit/create"><i class="gi gi-plus"></i> 申请门店</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-line-chart sidebar-nav-icon"></i>财务管理</a>
					<ul>
						<li><a href="<{'agent/statement'|url}>" name="statement/list">财务报表</a></li>
						<li><a href="<{'agent/withdraw'|url}>" name="withdraw/list">提现列表</a></li>
						<li><a href="<{'agent/withdraw/create'|url}>" name="withdraw/create"><i class="gi gi-plus"></i> 立即提现</a></li>
						<li><a href="<{'agent/bankcard'|url}>" name="bankcard/list"> 银行卡管理</a></li>
						<li><a href="<{'agent/bankcard/create'|url}>" name="bankcard/create"><i class="gi gi-plus"></i>添加银行卡</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="gi gi-settings sidebar-nav-icon"></i>系统设置</a>
					<ul>
						<li><a href="<{'agent/user/password'|url}>">修改密码</a></li>
						<li><a href="<{'agent/user'|url}>">修改资料</a></li>
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

