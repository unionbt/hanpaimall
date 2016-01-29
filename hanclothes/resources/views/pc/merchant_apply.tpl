<{extends file="extends/main.block.tpl"}>

<{block "head-meta-responsive"}>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<{/block}>

<{block "head-styles-plus"}>
  	<link href="<{'static/css/pc/base.css'|url}>" rel="stylesheet">
  	<link href="<{'static/css/pc/venderin_bak.css'|url}>" rel="stylesheet">
<{/block}>

<{block "body-container"}>
  <{include file="pc/header.topnav.inc.tpl"}>
   <div class="content">
		<p>迎您申请入驻“汉派商城”，汉派商城是专门致力于打造汉正街产业升级，帮助汉派服企顺势拥抱互联网！由汉正街管理委员会推动，北河服装产业园出资，武汉联合创美信息科技有限公司技术支持打造的综合性网商平台，请提交您的基本资料，并保持通讯畅通，您的资料提交后，我们会在48小时内与您核实并验证！谢谢您的支持！</p>	
		<div><span>基本账户：</span><img src="<{'static/img/pc/weixin_code_145.png'|url}>"><h5>＊请使用您的微信扫一扫功能，并通过授权关注汉派商城公众平台，您的微信号将成为本平台的基本帐户</h5></div>
		<form>
			<label><span>公司名称</span><input type="text"></label>
			<label><span>负责人</span><input type="text"></label>
			<label><span>经营地址</span><input type="text"></label>
			<label><span>经营品牌</span><input type="text"></label>
			<label><span>品牌类别</span><input type="text"></label>
			<label><span>手机号码</span><input type="text" id="phoneNum"><a class="btn getCode" href="">获取验证码</a></label>
			<label><span>验证码</span><input type="text" id="phoneCode"></label>
			<div><input type="checkbox" checked="checked">我已详细阅读并同意遵守《汉派商城》平台的协议约定</div>
			<div class="button"><button class="btn btn-warning" type="submit">确认申请</button><button class="btn btn-default" type="reset">重填</button></div>
		</form>
	</div>
    </section>
  <{include file="pc/footer.inc.tpl"}>
<{/block}>