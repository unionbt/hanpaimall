<!-- User Info -->
<div class="sidebar-section sidebar-user clearfix">
	<div class="sidebar-user-avatar">
		<a href="<{'admin/member'|url}>/<{$_user->getKey()}>">
			<img src="<{'attachment'|url}>?aid=<{$_user.avatar_aid}>" alt="avatar">
		</a>
	</div>
	<div class="sidebar-user-name"><{$_user.realname}></div>
	<div class="sidebar-user-links">
		<a href="<{'admin/member'|url}>/<{$_user->getKey()}>/edit" data-toggle="tooltip" data-placement="bottom" title="Profile"><i class="gi gi-user"></i></a>
		<a data-toggle="tooltip" data-placement="bottom" title="Messages"><i class="gi gi-envelope"></i></a>
		<a href="<{'admin/member'|url}>/<{$_user->getKey()}>/edit" data-toggle="tooltip" data-placement="bottom" title="修改资料"><i class="gi gi-cogwheel"></i></a>
		<a href="<{'auth/logout'|url}>" data-toggle="tooltip" data-placement="bottom" title="登出"><i class="gi gi-exit"></i></a>
	</div>
</div>
<!-- END User Info -->