$(function(){
	
    /*$("#datepicker").datepicker({
    	changeYear: true,
		 changeMonth: true,
		 yearRange: 'c-89:c',
    });*/
	
	//메뉴 애니메이팅효과
	if($("#anchor").val() == "itemAnchor") {
		$('html,body').animate({scrollTop: $("#itemAnchor").offset().top - 80},800);
	} else if($("#anchor").val() == "customerAnchor") {
		$('html,body').animate({scrollTop: $("#customerAnchor").offset().top - 80},800);
	} else if($("#anchor").val() == "communityAnchor") {
		$('html,body').animate({scrollTop: $("#communityAnchor").offset().top - 80},800);
	} else if($("#anchor").val() == "aboutSharepotAnchor") {
		$('html,body').animate({scrollTop: $("#aboutSharepotAnchor").offset().top - 80},800);
	}
	
	//상품 검색
	$(".allProductUl").on("keydown", "#searchStr2", function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: "./items.jsp", 
				data: {search1:$("#searchStr1").val(), search2:$("#searchStr2").val()}, 
				success: function(src){
		  	  		$(".allProductUl").html(src);
		  	    },
		  	    error: function() {
		  	    }
			})
		}
	});
	$('.allProductUl').on("click", "searchBtn2", function() {
		$.ajax({
			url: "./items.jsp", 
			data: {search1:$("#searchStr1").val(), search2:$("#searchStr2").val()}, 
			success: function(src){
	  	  		$(".allProductUl").html(src);
	  	    },
	  	    error: function() {
	  	    }
		})
	})
	
	//customer qna메뉴 이동
	$(".customerTable").on("click", ".qnaMenu", function(){
		$.ajax({
			url: "./customerQnaBoard.jsp", 
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#customerAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	//customer report메뉴 이동
	$(".customerTable").on("click", ".reportMenu", function(){
		$.ajax({
			url: "./customerReportBoard.jsp", 
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#customerAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	//customer recommend메뉴 이동
	$(".customerTable").on("click", ".recommendMenu", function(){
		$.ajax({
			url: "./customerRecommendBoard.jsp", 
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#customerAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	
	//customer qna 검색
	$(".customerTable").on("keydown", "#customerSearch", function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: "./customerQnaBoard.jsp", 
				data: {customerAction:$("#customerAction").val(), search:$("#customerSearch").val()}, 
				success: function(src){
		  	  		$(".customerTable").html(src);
		  	    },
		  	    error: function() {
		  	    	alert('실패')
		  	    }
			})
		}
	});
	$('.customerTable').on("click", "#cstmBtn", function() {
		$.ajax({
			url: "./customerQnaBoard.jsp", 
			data: {customerAction:$("#customerAction").val(), search:$("#customerSearch").val()}, 
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	//customer report 검색
	$(".customerTable").on("keydown", "#customerSearch2", function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: "./customerReportBoard.jsp", 
				data: {customerAction:$("#customerAction").val(), search:$("#customerSearch2").val()}, 
				success: function(src){
		  	  		$(".customerTable").html(src);
		  	    },
		  	    error: function() {
		  	    	alert('실패')
		  	    }
			})
		}
	});
	$('.customerTable').on("click", "#cstmBtn2", function() {
		$.ajax({
			url: "./customerReportBoard.jsp", 
			data: {customerAction:$("#customerAction").val(), search:$("#customerSearch2").val()}, 
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	//customer recommend 검색
	$(".customerTable").on("keydown", "#customerSearch3", function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: "./customerRecommendBoard.jsp", 
				data: {customerAction:$("#customerAction").val(), search:$("#customerSearch3").val()}, 
				success: function(src){
		  	  		$(".customerTable").html(src);
		  	    },
		  	    error: function() {
		  	    	alert('실패')
		  	    }
			})
		}
	});
	$('.customerTable').on("click", "#cstmBtn3", function() {
		$.ajax({
			url: "./customerRecommendBoard.jsp", 
			data: {customerAction:$("#customerAction").val(), search:$("#customerSearch3").val()}, 
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	
	//qna게시판 페이징버튼
	$('.customerTable').on('click', '.cstrBoardPaging', function() {
		$.ajax({
			url: "./customerQnaBoard.jsp", 
			data: {customerSearch:$("#customerAction").val(), pageNum:$(this).text()},
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#customerAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	//report게시판 페이징버튼
	$('.customerTable').on('click', '.cstrBoardPaging2', function() {
		$.ajax({
			url: "./customerReportBoard.jsp", 
			data: {customerSearch:$("#customerAction").val(), pageNum:$(this).text()},
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#customerAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	
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
	 
	$('#bannerBg').click(function() {
		return false;
	})
	$('#noticeCircle').click(function() {
		$('#noticeCircle').css('display','none');
		$('.floatingBanner').css('opacity','1')
		$('body').css('overflow','');
	})
})

function load() {
	var targetElement = $('body')
	$('html,body').animate({scrollTop: targetElement.offset().top-8}, 'fast');
	$('#banner').css('top', (screen.height-650) / 2);
	if($('#noticeCircle').css('display')=='block') {
		$('body').css('overflow','hidden')
		$('.floatingBanner').css('opacity','0.9')
	}
}

function showGNB() {
	obj = document.getElementById("GNB");
	$('#GNB').css('display','block')
}

function btn_top(){
	$('html,body').animate({scrollTop: 0});
}

function registerSuccess() {
	$('#regiSuccess').animate({top: "50px"},1000)
}