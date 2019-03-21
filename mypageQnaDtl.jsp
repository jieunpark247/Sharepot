<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="aboveMenu.jsp"></jsp:include>
<jsp:include page="floatingBanner.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="css/details.css" />
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/mypage.js"></script>
<script type="text/javascript" src="js/menuAnimate.js"></script>
</head>
<body style="font-family:'나눔고딕'" onload="$('#log_user_id').focus()">

<!-- 마이페이지 시작 -->
<div id="container" class="div container" align="center">
	<div class="divWid">
		<!-- 주문내역 조회 시작 -->
		<jsp:include page="mypageHead.jsp"></jsp:include>
		<table width="800" style="background-color: #f6f6f6; height: 70px; vertical-align: middle; margin-top: -8px">
			<tr>
				<td align="center">
					<table class="topNavi" width="579"
						style="background-image: url('images/03mypage/box4.png'); background-repeat: no-repeat;"
						cellpadding="0" cellspacing="0">
						<tr height="26">
							<td align="center" style="padding-bottom: 2px">
							<a class= "myList" id="mypageRentalMain" href="mypage.do?tab=RENTAL"> <font
									style="font-size: 14px; color: #000000">대여 내역 조회</font>
							</a> 
							<a class= "myList" id="mypageLike" style="margin-left: 20px" href="mypage.do?tab=LIKE"> <font
									style="font-size: 14px; color: #000000">관심 물품 조회</font>
							</a>  
							<a class= "myList" id="mypageQna" style="margin-left: 20px" href="mypage.do?tab=QNA"> <font
									style="font-size: 14px; color: #d55454">1:1문의</font>
							</a> 
							<a class= "myList" id="mypgeEdit" style="margin-left: 20px" href="mypage.do?tab=EDIT"> <font
									style="font-size: 14px; color: #000000">회원정보 수정</font>
							</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div class="content"></div>
		
		<div style="width:740px; text-align:left; margin-top:60px; margin-bottom:80px">
			<div style="width:100%; height:42px; text-align:center; margin-bottom:20px"><font style="font-size:22px; color:#d55454; font-weight:bold; margin-bottom:40px">* 1:1문의내역 *</font>
			<br>
			<div style="padding-top:10px; padding-bottom:10px">
			<font style="font-size:14px; color:#b4b4b4">문의글은 고객센터를 이용해주시기 바랍니다.</font></div></div>
			
			<table class="content-table myQna" width="740" border="1" frame="void" rules="cols" cellpadding="0" cellspacing="0" style="margin-top:30px">
				<tr height="50" style="border-top: 1px solid #cbcbcb; border-bottom: 1px solid #cbcbcb">
					<td id="table-td" width="100" style="background-color:#f6f6f6">제목</td>
					<td id="table-td" width="404" align="left" style="padding-left:15px">${qna.title }</td>
					<td id="table-td" width="109" style="background-color:#f6f6f6">등록일</td>
					<td id="table-td" width="109"><fmt:formatDate value="${qna.date }" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr style="border-bottom: 1px solid #cbcbcb">
					<td colspan="4" align="left" style="padding-top:24px; padding-left:20px; padding-bottom:24px; padding-right:20px">
						<div>
							<c:choose>
								<c:when test="${qna.isAns==0 }">
									<span class="statusN" style="padding-left: 11px; width: 55px">답변대기</span>
								</c:when>
								<c:otherwise>
									<span class="statusY" style="padding-left: 11px; width: 55px">답변완료</span>
								</c:otherwise>
							</c:choose>
							
						</div>
						<div style="margin-top:10px; line-height:23px">${qna.content }</div>
					</td>
				</tr>
					<tr class="myQna" style="border-bottom: 1px solid #cbcbcb">
						<c:choose>
						<c:when test="${empty ans.content }"></c:when>
						<c:otherwise>
						<td colspan="4" align="left" style="padding-top:24px; padding-left:20px; padding-bottom:24px; padding-right:20px">
						
						<div>
								<span class="reply" style="padding-left: 22px; width: 44px">답변</span>
						</div>
						<div style="margin-top:10px; line-height:23px">${ans.content }</div>
						</td>
						</c:otherwise>
						</c:choose>
							
						
					</tr>
				
			</table>
				
		</div>
		
	</div>
	
	<!-- 카피라이트 -->
	 <jsp:include page="copyRight.jsp"></jsp:include>
</div>
</body>
</html>