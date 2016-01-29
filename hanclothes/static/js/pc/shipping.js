// JavaScript Document
(function($) {
    $("#dfk_btn").click(function(){
		$(this).siblings().children(".yuandian").css("color","#FFF");
		$(this).siblings().children(".leftlist").css("color","#000");
		$("#dfk_btn span").css("color","red");
		$("#dfk_content ,#dfk_content .content_title").css("display","block");
		$("#dfh_content,#dsh_content,#dpj_content,#all_title").css("display","none");
	});
	$("#dfh_btn").click(function(){
		$(this).siblings().children(".yuandian").css("color","#FFF");
		$(this).siblings().children(".leftlist").css("color","#000");
		$("#dfh_btn span").css("color","red");
		$("#dfh_content,#dfh_content .content_title").css("display","block");
		$("#dfk_content,#dsh_content,#dpj_content,#all_title").css("display","none");
	});
	$("#dsh_btn").click(function(){
		$(this).siblings().children(".yuandian").css("color","#FFF");
		$(this).siblings().children(".leftlist").css("color","#000");
		$("#dsh_btn span").css("color","red");
		$("#dsh_content,#dsh_content .content_title").css("display","block");
		$("#dfh_content,#dfk_content,#dpj_content,#all_title").css("display","none");
	});
	$("#dpj_btn").click(function(){
		$(this).siblings().children(".yuandian").css("color","#FFF");
		$(this).siblings().children(".leftlist").css("color","#000");
		$("#dpj_btn span").css("color","red");
		$("#dpj_content,#dpj_content .content_title").css("display","block");
		$("#dfh_content,#dsh_content,#dfk_content,#all_title").css("display","none");
	});
	$("#all_btn").click(function() {
		$("#all_btn span").css("color","red");
		$(this).siblings().children(".yuandian").css("color","#FFF");
		$(this).siblings().children(".leftlist").css("color","#000");
		$("#dfh_content,#dsh_content,#dfk_content,#dpj_content").css("display","block");
		$(".content_list,#all_title").css("display","block");
		$(".content_title").css("display","none");
	});	
})(jQuery);