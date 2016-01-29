<{extends file="extends/main.block.tpl"}>

<{block "head-styles-plus"}>
    <link rel="stylesheet" href="<{'static/css/m/monkey.css'|url}>">
    <link rel="stylesheet" href="<{'static/css/m/common.css'|url}>">
<{/block}>
<{block "head-scripts-plus"}>
	<script>var $ = jQuery.noConflict();</script> 
    <script src="<{'static/js/monkey/jquery.touchSwipe.min.js'|url}>"></script>
    <script src="<{'static/js/monkey/jquery.easing.min.js'|url}>"></script>
    <script src="<{'static/js/monkey/jquery.rotate.min.js'|url}>"></script>
    <script src="<{'static/js/monkey/youxi_V3.js'|url}>"></script>
<{/block}>
<{block "body-container"}>

	<div class="start"></div>
    <div class="end"></div>
	<div class="main">
    	<div class="button_stop"></div>
        <div class="chumo"></div>
    	<form name="input" action="www.123.com" method="get">
            <div class="fenshu">当前分数：<input type="text" name="Score" value="0" size="5" readonly></div>  
            <div class="yonghu_Id"> <input type="text" name="user_Id" value="1" size="5" readonly></div> 
            <div class="youxi_Num"> <input type="text" name="game_Num" value="1" size="5" readonly></div>     
            <h2 class="time">时间：<span></span></h2>
        </form> 
        <h1 class="jiafen"></h1>
        <a class="lao">捞</a>
        <div class="zhuanpan">
            <div class="monkey">
                <div class="rope"></div>
                <div class="monkey_wu">
                    <span class="monkey_mid"></span>
                    <span class="wu_pic"><img src="<{'static/img/m/monkey/monkey_wu.png'|url}>"/></span>
                </div>
                <div class="monkey_you monkey_hongbao">
                    <span class="houHb_pic"><img src="<{'static/img/m/monkey/hou_hongbao.png'|url}>"/></span>
                </div>
                <div class="monkey_you monkey_star">
                    <span class="houXx_pic"><img src="<{'static/img/m/monkey/hou_star.png'|url}>"/></span>
                </div>
                <div class="monkey_you monkey_fubao">
                    <span class="houFb_pic"><img src="<{'static/img/m/monkey/hou_fubao.png'|url}>"/></span>
                </div>
                <div class="monkey_you monkey_halfmoon1">
                    <span class="houHm1_pic"><img src="<{'static/img/m/monkey/hou_halfmoon1.png'|url}>"/></span>
                </div>
                <div class="monkey_you monkey_halfmoon2"></div>
                <div class="monkey_you monkey_halfmoon3"></div>
                <div class="monkey_you monkey_fullmoon">
                    <span class="houFm_pic"></span>
                </div>
            </div>
		</div>
        <span class="baby baby1" name="hongbao"><b>1</b></span>
        <span class="baby baby2" name="hongbao"><b>2</b></span>
        <span class="baby baby3" name="star"><b>3</b></span>
        <span class="baby baby4" name="star"><b>4</b></span>
        <span class="baby baby5" name="fubao"><b>5</b></span>
        <span class="baby baby6" name="hongbao"><b>6</b></span>
        <span class="baby baby7" name="hongbao"><b>7</b></span>
        <span class="baby baby8" name="hongbao"><b>8</b></span>
        <span class="baby baby9" name="star"><b>9</b></span>
        <span class="baby baby10" name="fubao"><b>10</b></span>
        <span class="full_moon" name="fullM"></span>
        <span class="half half_moon1" name="halfM1"></span>
        <span class="half half_moon2" name="halfM2"></span>
        <span class="half half_moon3" name="halfM3"></span>
    </div>
    <!-- 游戏结束，弹出页面 -->
    <div class="end-box">
        <div class="container-fluid">
            <div class="row text-center">
               <h5 class="">恭喜您！</h5>
               <h6 class="">您本次获得<span></span>红包</h6>
               <div class=""><a class="btn btn-success" href="game/start" role="button">再玩一次</a></div>
               <small class="text-muted">您现在还有<span class="text-danger">0</span>次红包游戏机会<br/>点击下面"分享红包"获取更多红包</small>
               <div class=""><a class="btn btn-danger" href="#" role="button">分享红包</a></div>

               <p class="text-muted">您现在共有<span class="text-danger">13</span>个现金红包</p>
               <div class=""><a class="btn btn-warning" href="#" role="button">使用红包</a></div>

            </div>
         </div>
        </div>
    </div>
<{/block}>
