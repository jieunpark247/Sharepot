
$(document).ready(function () {
    $(window).scroll(function(){
        /*//var dm_h = $(document).height() // 페이지 총 높이 
        //var wd_h = $(window).height() // 브라우저 높이 
        //var sctop = $(window).scrollTop(); //스크롤 위치 */
    	var cntop = $('#container').offset().top;
		/*//var mvt = 500;
        //var scrollBottom = dm_h - wd_h - sctop; //0
        //var foot_h = $('#footer').height()+55 */        
    	// console.log(dm_h,wd_h,sctop,scrollBottom)

    	if($(this).scrollTop() > cntop){
            $(".laypop_quick").css('position','fixed')
            $(".laypop_quick").css('top',15+'px')
            //$("#naviBar").css('position','fixed')
            //$("#naviBar").css('top',0+'px')
            // if($(".laypop_quick").hasClass('ex_laypop') == true){
            //     $(".laypop_quick").removeClass('ex_laypop')
            // }
        }
        else{
            $(".laypop_quick").css('position','absolute')
            $(".laypop_quick").css('top',30+'px')
            //$("#naviBar").css('position','')
            //$("#naviBar").css('top',0+'px')
            // if($(".laypop_quick").hasClass('ex_laypop') == true){
            //     $(".laypop_quick").removeClass('ex_laypop')
            // }
        }
        /*if(scrollBottom == 0){
            $(".laypop_quick").css('position','fixed')
            $(".laypop_quick").css('top','auto')
            $(".laypop_quick").css('bottom',foot_h+'px')
            // $(".laypop_quick").addClass('ex_laypop')
        }*/
    })
});

$(function(){
	
	$('#arrowNext').on("mouseover",function(){
		$(this).css({"opacity":"0.5"});
	})
	$('#arrowNext').on("mouseout",function(){
		$(this).css({"opacity":"0.2"});
	})
	
	 $('#arrowNext').css("cursor","pointer");
	 $('#arrowNext').mouseover(function() {
	  $(this).stop().animate({"opacity":"0.5"},1000);
	 })
	 $('#arrowNext').mouseout(function() {
	  $(this).stop().animate({"opacity":"0.2"},1000);
	 })
	 
	 //메인에서 포도배너 닫기버튼 클릭
	 /*$('#closeBtn').click(function() {
		$('#noticeCircle').css('display','none');
		$('.floatingBanner').css('opacity','1')
		$('body').css('overflow','');
	})*/
	$('#bannerBg').click(function() {
		return false;
	})
	$('#noticeCircle').click(function() {
		$('#noticeCircle').css('display','none');
		$('.floatingBanner').css('opacity','1')
		$('body').css('overflow','');
	})
	
	$('#menu2').click(function() {
		alert('준비중입니다')
		return false;
	})
	$('#menu3').click(function() {
		alert('준비중입니다')
		return false;
	}) 
})

function load() {
	var targetElement = $('body')
	$('html,body').animate({scrollTop: targetElement.offset().top-8}, 'fast');
	$('#banner').css('top', (screen.height-650) / 2);
	if($('#noticeCircle').css('display')=='block') {
		//alert('열림')
		$('body').css('overflow','hidden')
		$('.floatingBanner').css('opacity','0.9')
	}
}

function showGNB() {
	obj = document.getElementById("GNB");
	
	$('#GNB').css('display','block')
	
}

/* 스크롤바 */

function btn_top(){
    // $('#header .btn_top').click(function(e){
        // e.preventDefault();
        /* $('html,body').scrollTop(0) */
	/* var targetElement = $('html')
	$('html,body').animate({scrollTop: targetElement.offset().top}); */
	$('html,body').animate({scrollTop: 0});
	
    // })
}

function registerSuccess() {
	$('#regiSuccess').animate({top: "50px"},1000)
}

