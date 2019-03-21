<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="aboveMenu.jsp" /> <!-- 상단메뉴바 -->
<jsp:include page="floatingBanner.jsp" /> <!-- 플로팅배너 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쉐어팟</title>
<link rel="stylesheet" href="css/details.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/store.js"></script>
<script>
$(function(){
	$("#menu1").click(function(){
		$('html,body').animate({scrollTop: $("#itemAnchor").offset().top - 80},800);
	})
	$("#menu2").click(function(){
		$('html,body').animate({scrollTop: $("#customerAnchor").offset().top - 80},800);
	})
	$("#menu3").click(function(){
		$('html,body').animate({scrollTop: $("#communityAnchor").offset().top - 80},800);
	})
	$("#menu4").click(function(){
		$('html,body').animate({scrollTop: $("#aboutSharepotAnchor").offset().top - 80},800);
	})
})
</script>
</head>
<body style="font-family:'나눔고딕'" onload="$('#sortStr').val('${sortStr}')">
<input type="hidden" id="anchor" value="${anchor}">
<!-- 메인 이미지&메뉴&상품 시작 -->
<div class="div" id="container" align="center">
		<!-- 메인 이미지&메뉴 시작 -->
		<div style="width:800px" align="center">
			<div style="width:800px; height:320px; background-image:url('images/main_image3.jpg')"></div>
		</div>
	<div class="content"></div>

	<!-- 물품함 -->
	<div id="itemAnchor" class="mainAnchor" style="background-image:url('images/tape1.png')">
		<div>
			<font style="font-size:23px; color:white; font-weight:bold">물품함</font>
		</div>
	</div>
	
	<!-- 바디 -->
	<div class="indexContents" id="product-wrap" style="width:816px; margin-top:-25px">
		<!-- BEST상품 -->
		<div align="left">
			<table class="table_basic" border="0" cellspacing="0" cellpadding="0" style="margin-top:30px">
				<tr>
					<td><font id="indexListing" style="font-weight:bold">* BEST 물품</font></td>
					<td><font id="indexListingInfo">&nbsp;: 가장 많이 대여된 물품</font></td>
				</tr>
			</table>
			
		</div>
		<!-- 선 -->
		<hr width="800" color="#cbcbcb" size="1">
		<!-- 상품이미지 -->
		<div class="div" class="allProductUl">
			<!-- @@@@진짜 상품 시작 -->
			<div class="allProductUl">
				<jsp:include page="items.jsp" />
			</div>
		</div>
		
		<!-- 고객소리 -->
		<div id="customerAnchor" class="mainAnchor" style="background-image:url('images/tape4.png')">
			<div>
				<font style="font-size:23px; color:white; font-weight:bold">고객소리</font>
			</div>
		</div>
		<div class="customerTable">
			<jsp:include page="customerQnaBoard.jsp" />
		</div>
		<!-- 커뮤니티 -->
		<div id="communityAnchor" class="mainAnchor" style="background-image:url('images/tape3.png'); margin-top:104px">
			<div>
				<font style="font-size:23px; color:white; font-weight:bold">커뮤니티</font>
			</div>
		</div>
		<div class="boardTable">
			<jsp:include page="anonymityBoard.jsp" />
		</div>
		<!-- about쉐어팟 -->
		<div id="aboutSharepotAnchor" class="mainAnchor" style="background-image:url('images/tape2.png'); margin-top:104px">
			<div>
				<font style="font-size:23px; color:white; font-weight:bold">about 쉐어팟</font>
			</div>
		</div>
		<div class="aboutSharepotTable">
			<jsp:include page="aboutSharepotGuide.jsp" />
		</div>
	</div>
</div>
<div class="Dtl">
	<div id="boardWrite">
		<jsp:include page="boardWrite.jsp" />
	</div>
	<div id="itemsDtl">
		<jsp:include page="itemDtl.jsp" />
	</div>
	<div id="boardDtl">
		<jsp:include page="boardDtl.jsp" />
	</div>
</div>
<jsp:include page="copyRight.jsp" />
</body>
</html>