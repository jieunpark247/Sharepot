<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="aboveMenu.jsp"></jsp:include> <!-- 상단메뉴바 -->
<jsp:include page="floatingBanner.jsp"></jsp:include> <!-- 플로팅배너 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="css/details.css" />
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/mypage.js"></script>
<script>
	$(function(){
		$('#qnaDetail').click(function(){
			$('#qnaDtl').submit();
		});
	})

</script>
</head>

<body style="font-family: '나눔고딕'" onload="$('#log_user_id').focus()">

	<div id="container" class="div container" align="center">
		<div class="divWid">
			<jsp:include page="mypageHead.jsp"></jsp:include>
			
			<table width="800"
				style="background-color: #f6f6f6; height: 70px; vertical-align: middle; margin-top: -8px">
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
										style="font-size: 14px; color: #0e7534">1:1문의</font>
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
		</div>
		
		<div style="width:740px; text-align:left; margin-top:60px; margin-bottom:80px">
			<div style="width:100%; height:42px; text-align:center; margin-bottom:20px"><font style="font-size:22px; color:#6bb546; font-weight:bold; margin-bottom:40px">* 1:1문의내역 *</font><br><font style="font-size:14px; color:#b4b4b4">문의글은 고객센터를 이용해주시기 바랍니다.</font></div>
			
			<form id="qnaDtl" name="qnaDtl" method="post" action="mypageQnaDtl.do">
		
			<table class="content-table myQna" width="740" border="1" frame="void" rules="rows" cellpadding="0" cellspacing="0" style="margin-top:30px">
				<tr height="40" style="background-color:#f6f6f6">
					<td id="table-td" width="100">진행상태</td>
					<td id="table-td" width="530">제목</td>
					<td id="table-td" width="110">등록일</td>
				</tr>
				
				<c:choose>
					<c:when test="${empty qna }">
						<tr height="100">
						<td colspan="5">문의 내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${qna}" var="qna">
						<tr height="50">
							<td id="table-td" align="center">
							<input type="hidden" id="qna_no" name="qna_no" value="${qna.qna_no }">
								<c:choose>
									<c:when test="${qna.isAns==0 }">
										<span class="statusN">답변대기</span>
									</c:when>
									<c:otherwise>
										<span class="statusY">답변완료</span>
									</c:otherwise>
								</c:choose>
							</td>
							
							<td id="table-td" align="left"><a id="qnaDetail" style="cursor:pointer">${qna.title }</a></td>
							<td><fmt:formatDate value="${qna.date }" pattern="yyyy-MM-dd"/></td>
							
						</tr>
				
						</c:forEach>
				</c:otherwise>
			</c:choose>
			</table>
			</form>
		</div>
		

      <jsp:include page="copyRight.jsp"></jsp:include>
	</div>
</body>
</html>


		