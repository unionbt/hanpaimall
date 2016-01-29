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
					<a href="<{'store'|url}>" class=""><i class="gi gi-stopwatch sidebar-nav-icon"></i>门店首页</a>
				</li>
				<li class="sidebar-header">
					<span class="sidebar-header-title">基本</span>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-balance-scale sidebar-nav-icon"></i>门店管理</a>
					<ul>
						<li><a href="<{'store/member'|url}>" name="member/list">会员列表</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-gg-circle sidebar-nav-icon"></i>二维码管理</a>
					<ul>
						<li><a href="<{'store/qrcode'|url}>" name="statement/list">二维码</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-line-chart sidebar-nav-icon"></i>核销管理</a>
					<ul>
						<li><a href="<{'store/order'|url}>" name="order/list">核销管理</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="fa fa-line-chart sidebar-nav-icon"></i>财务管理</a>
					<ul>
						<li><a href="<{'store/withdraw'|url}>" name="withdraw/list">提现列表</a></li>
						<li><a href="<{'store/withdraw/create'|url}>" name="withdraw/create"><i class="gi gi-plus"></i> 立即提现</a></li>
						<li><a href="<{'store/bankcard'|url}>" name="bankcard/list"> 银行卡管理</a></li>
						<li><a href="<{'store/bankcard/create'|url}>" name="bankcard/create"><i class="gi gi-plus"></i>添加银行卡</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="sidebar-nav-menu"><i class="fa fa-angle-left sidebar-nav-indicator"></i><i class="gi gi-settings sidebar-nav-icon"></i>系统设置</a>
					<ul>
						<li><a href="<{'store/user/password'|url}>">修改密码</a></li>
						<li><a href="<{'store/user'|url}>">修改资料</a></li>
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

