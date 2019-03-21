$(function(){
	
	//상품 클릭 시 페이지 로딩
	$('.allProductUl').on('click', '.itemList', function(){
		$.ajax ({
			url: "./itemDtl.jsp", 
			data: {no:$(this).find("input[type=hidden]").val()}, 
			success: function(src){
	  	  		$("#itemsDtl").html(src);
	  	  		$('#itemsDtlContainer').css('display','yes');
	  	    },
	  	    error: function() {
	  	    }
		})
	})
	/*$('.customerTable').on('click', '.writeBoard', function(){
		$.ajax ({
			url: "./customerQna.jsp", 
			data: {type:$(this).find('#hiddenType').val()},
			success: function(src){
	  	  		$("#boardWrite").html(src);
	  	  		$('#writeContainer').css('display','yes');
	  	    },
	  	    error: function() {
	  	    }
		})
	})*/
	//고객 글 상세보기 클릭
	$('.indexContents').on('click', '.boardDtlBtn', function(){
		$.ajax ({
			url: "./boardDtl.jsp", 
			data: {boardDtlType:$("#boardDtlType").val(), no:$(this).find("input[type=hidden]").val()},
			success: function(src){
	  	  		$("#boardDtl").html(src);
	  	  		$('#boardDtlContainer').css('display','yes');
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	//익명게시판 글 상세보기
	$('.indexContents').on('click', '.boardDtlBtn2', function(){
		$.ajax ({
			url: "./boardReDtl.jsp", 
			data: {boardDtlType:$("#boardDtlType2").val(), no:$(this).find("input[type=hidden]").val()},
			success: function(src){
	  	  		$("#boardDtl").html(src);
	  	  		$('#boardDtlContainer').css('display','yes');
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	//어바웃쉐어팟 글 상세보기
	$('.indexContents').on('click', '.boardDtlBtn3', function(){
		$.ajax ({
			url: "./boardDtl.jsp", 
			data: {boardDtlType:$("#boardDtlType3").val(), no:$(this).find("input[type=hidden]").val()},
			success: function(src){
	  	  		$("#boardDtl").html(src);
	  	  		$('#boardDtlContainer').css('display','yes');
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	//글쓰기 클릭
	$('.indexContents').on('click', '.writeBoard', function(){
		if($("#sessionHidden").val() == null || $("#sessionHidden").val() == '') {
			alert('로그인을 해주세요');
			return;
		}
		$.ajax({
			url: "./boardWrite.jsp",
			data: {type:$("#boardDtlType").val(), id:$("#sessionHidden").val()},
			success: function(src){
				$("#boardWrite").html(src);
				$('#writeContainer').css('display', 'yes');
				$('#qnaTitle').focus();
			},
			error: function(){
				alert('실패')
			}
		})
	})
	//글쓰기 클릭
	$('.indexContents').on('click', '.writeBoard2', function(){
		if($("#sessionHidden").val() == null || $("#sessionHidden").val() == '') {
			alert('로그인을 해주세요');
			return;
		}
		$.ajax({
			url: "./boardWrite.jsp",
			data: {type:$("#boardDtlType2").val(), id:$("#sessionHidden").val()},
			success: function(src){
				$("#boardWrite").html(src);
				$('#writeContainer').css('display', 'yes');
				$('#qnaTitle').focus();
			},
			error: function(){
				alert('실패')
			}
		})
	})
	$('#boardWrite').on('click', '#boardWriteBtn', function(){
		$.ajax({
			url:"./boardWriteProc.jsp",
			data: {type:$("#boardWriteForm").find("input[name=type]").val(),
					   id:$("input[name=id]").val(),
					   title:$("#qnaTitle").val(),
					   name:$("#qnaName").val(),
					   content:$("#qnaContent").val(),
					   passwd:$("#qnaPasswd").val(),
					   option:$("#reportOption").val()},
			success: function(flag){
				$('#writeContainer').css('display','none');
				alert('글쓰기에 성공했습니다')
				//글쓰기 완료시 다시 reload
				if($("#boardWriteForm").find("input[name=type]").val() == "qna") {
					$.ajax({
						url: "./customerQnaBoard.jsp", 
						success: function(src){
				  	  		$(".customerTable").html(src);
				  	    },
				  	    error : function(error) {
				  	    	alert(error)
				  	    }
					})
				} else if($("#boardWriteForm").find("input[name=type]").val() == "report") {
					$.ajax({
						url: "./customerReportBoard.jsp", 
						success: function(src){
				  	  		$(".customerTable").html(src);
				  	    },
				  	    error : function(error) {
				  	    	alert(error)
				  	    }
					})
				} else if($("#boardWriteForm").find("input[name=type]").val() == "recommend") {
					$.ajax({
						url: "./customerRecommendBoard.jsp", 
						success: function(src){
				  	  		$(".customerTable").html(src);
				  	    },
				  	    error : function(error) {
				  	    	alert(error)
				  	    }
					})
				} else if($("#boardWriteForm").find("input[name=type]").val() == "board") {
					$.ajax({
						url: "./anonymityBoard.jsp", 
						success: function(src){
				  	  		$(".boardTable").html(src);
				  	    },
				  	    error : function(error) {
				  	    	alert(error)
				  	    }
					})
				}
				//alert("글쓰기 완료")
			},
			error: function(){
				alert('실패됨')
			}
		})
	})
	
	//div 상세보기
	$('#itemsDtl').on('click', '#itemsDtlContent', function() {
		return false;
	})
	$('#itemsDtl').on('click', '#itemsDtlContainer', function() {
		$('#itemsDtlContainer').css('display','none');
	})
	$('#customerQna').on('click', '#customerDtlContent', function() {
		return false;
	})
	$('#customerQna').on('click', '#itemsDtlContainer', function() {
		$('#itemsDtlContainer').css('display','none');
	})
	$('#boardDtl').on('click', '#boardDtlContent', function() {
		return false;
	})
	$('#boardDtl').on('click', '#boardDtlContainer', function() {
		$('#boardDtlContainer').css('display','none');
	})
	$('#boardWrite').on('click', '#writeContent', function() {
		return false;
	})
	$('#boardWrite').on('click', '#writeContainer', function() {
		$('#writeContainer').css('display','none');
	})
	
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
	
	$("#itemDiv").load(function(){
		alert('load');
	})
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
	//board 대댓글달기
	$('#boardDtl').on('click', '#boardReWriteBtn', function() {
		$.ajax({
			url: "./boardReWriteProc.jsp",
			data: {name:$("#replyName").val(), content:$("#replyContent").val(), passwd:$("#replyPasswd").val(), no:$("#boardRe_no").val()},
			success: function(src){
				src = $.trim(src);
	  	  		if(src == 'true') {
					alert('글쓰기에 성공했습니다')
					$.ajax ({
						url: "./boardReDtl.jsp", 
						data: {boardDtlType:$("#boardDtlType2").val(), no:$("#boardRe_no").val()},
						success: function(src){
				  	  		$("#boardDtl").html(src);
				  	  		$('#boardDtlContainer').css('display','yes');
				  	    },
				  	    error: function() {
				  	    	alert('실패')
				  	    }
					})
	  	  		} else if(src == 'false') {
	  	  		alert('글쓰기에 실패했습니다')
	  	  		}
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	//aboutSharepot 공지사항 메뉴 이동
	$(".aboutSharepotTable").on("click", ".noticeMenu", function(){
		$.ajax({
			url: "./aboutSharepotNotice.jsp", 
			success: function(src){
	  	  		$(".aboutSharepotTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#aboutSharepotAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	//aboutSharepot 이용안내 메뉴 이동
	$(".aboutSharepotTable").on("click", ".guideMenu", function(){
		$.ajax({
			url: "./aboutSharepotGuide.jsp", 
			success: function(src){
	  	  		$(".aboutSharepotTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#aboutSharepotAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	//aboutSharepot 자주하는 질문 메뉴 이동
	$(".aboutSharepotTable").on("click", ".fnaMenu", function(){
		$.ajax({
			url: "./aboutSharepotFnA.jsp", 
			success: function(src){
	  	  		$(".aboutSharepotTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#aboutSharepotAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	
	//customer qna 검색
	$(".customerTable").on("keydown", "#qnaSearch", function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: "./customerQnaBoard.jsp", 
				data: {qnaSearch:$("#qnaSearch").val()}, 
				success: function(src){
		  	  		$(".customerTable").html(src);
		  	    },
		  	    error: function() {
		  	    	alert('실패')
		  	    }
			})
		}
	});
	$('.customerTable').on("click", "#qnaBtn", function() {
		$.ajax({
			url: "./customerQnaBoard.jsp", 
			data: {qnaSearch:$("#qnaSearch").val()}, 
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	//customer report 검색
	$(".customerTable").on("keydown", "#reportSearch", function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: "./customerReportBoard.jsp", 
				data: {reportSearch:$("#reportSearch").val()}, 
				success: function(src){
		  	  		$(".customerTable").html(src);
		  	    },
		  	    error: function() {
		  	    	alert('실패')
		  	    }
			})
		}
	});
	$('.customerTable').on("click", "#reportBtn", function() {
		$.ajax({
			url: "./customerReportBoard.jsp", 
			data: {reportSearch:$("#reportSearch").val()}, 
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	//customer recommend 검색
	$(".customerTable").on("keydown", "#recommendSearch", function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: "./customerRecommendBoard.jsp", 
				data: {recommendSearch:$("#recommendSearch").val()}, 
				success: function(src){
		  	  		$(".customerTable").html(src);
		  	    },
		  	    error: function() {
		  	    	alert('실패')
		  	    }
			})
		}
	});
	$('.customerTable').on("click", "#recommendBtn", function() {
		$.ajax({
			url: "./customerRecommendBoard.jsp", 
			data: {recommendSearch:$("#recommendSearch").val()}, 
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	//board 검색
	$(".boardTable").on("keydown", "#boardSearch", function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: "./anonymityBoard.jsp", 
				data: {boardSearch:$("#boardSearch").val()}, 
				success: function(src){
		  	  		$(".boardTable").html(src);
		  	    },
		  	    error: function() {
		  	    	alert('실패')
		  	    }
			})
		}
	});
	$('.boardTable').on("click", "#boardBtn", function() {
		$.ajax({
			url: "./anonymityBoard.jsp", 
			data: {boardSearch:$("#boardSearch").val()}, 
			success: function(src){
	  	  		$(".boardTable").html(src);
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	//notice 검색
	$(".aboutSharepotTable").on("keydown", "#noticeSearch", function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: "./aboutSharepotNotice.jsp", 
				data: {noticeSearch:$("#noticeSearch").val()}, 
				success: function(src){
		  	  		$(".aboutSharepotTable").html(src);
		  	    },
		  	    error: function() {
		  	    	alert('실패')
		  	    }
			})
		}
	});
	$('.aboutSharepotTable').on("click", "#noticeBtn", function() {
		$.ajax({
			url: "./aboutSharepotNotice.jsp", 
			data: {noticeSearch:$("#noticeSearch").val()}, 
			success: function(src){
	  	  		$(".aboutSharepotTable").html(src);
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	//fna 검색
	$(".aboutSharepotTable").on("keydown", "#fnaSearch", function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: "./aboutSharepotFnA.jsp", 
				data: {fnaSearch:$("#fnaSearch").val()}, 
				success: function(src){
		  	  		$(".aboutSharepotTable").html(src);
		  	    },
		  	    error: function() {
		  	    	alert('실패')
		  	    }
			})
		}
	});
	$('.aboutSharepotTable').on("click", "#fnaBtn", function() {
		$.ajax({
			url: "./aboutSharepotFnA.jsp", 
			data: {fnaSearch:$("#fnaSearch").val()}, 
			success: function(src){
	  	  		$(".aboutSharepotTable").html(src);
	  	    },
	  	    error: function() {
	  	    	alert('실패')
	  	    }
		})
	})
	
	//qna게시판 페이징버튼
	$('.customerTable').on('click', '.qnaPaging', function() {
		$.ajax({
			url: "./customerQnaBoard.jsp", 
			data: {pageNum:$(this).text(), qnaSearch:$("#qnaSearch").val()},
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
	$('.customerTable').on('click', '.reportPaging', function() {
		$.ajax({
			url: "./customerReportBoard.jsp", 
			data: {pageNum:$(this).text(), reportSearch:$("#reportSearch").val()},
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#customerAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	//recommend게시판 페이징버튼
	$('.customerTable').on('click', '.recommendPaging', function() {
		$.ajax({
			url: "./customerRecommendBoard.jsp", 
			data: {pageNum:$(this).text(), recommendSearch:$("#recommendSearch").val()},
			success: function(src){
	  	  		$(".customerTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#customerAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	//board게시판 페이징버튼
	$('.boardTable').on('click', '.boardPaging', function() {
		$.ajax({
			url: "./anonymityBoard.jsp", 
			data: {pageNum:$(this).text(), boardSearch:$("#boardSearch").val()},
			success: function(src){
	  	  		$(".boardTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#communityAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	//notice게시판 페이징버튼
	$('.aboutSharepotTable').on('click', '.noticePaging', function() {
		$.ajax({
			url: "./aboutSharepotNotice.jsp", 
			data: {pageNum:$(this).text(), noticeSearch:$("#noticeSearch").val()},
			success: function(src){
	  	  		$(".aboutSharepotTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#aboutSharepotAnchor").offset().top - 80},800);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
	//fna게시판 페이징버튼
	$('.aboutSharepotTable').on('click', '.fnaPaging', function() {
		$.ajax({
			url: "./aboutSharepotFnA.jsp", 
			data: {pageNum:$(this).text(), fnaSearch:$("#fnaSearch").val()},
			success: function(src){
	  	  		$(".aboutSharepotTable").html(src);
	  	  		$('html,body').animate({scrollTop: $("#aboutSharepotAnchor").offset().top - 80},800);
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