<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="aboveMenu.jsp" /> <!-- 상단메뉴바 -->
<jsp:include page="floatingBanner.jsp" /> <!-- 플로팅배너 -->
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
$(function() {
	$('.li').click(function(){
		var id= this.id;
 		location.href = "mypage.do?rent="+id;
	})
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
										style="font-size: 14px; color: #0e7534">대여 내역 조회</font>
								</a> 
								<a class= "myList" id="mypageLike" style="margin-left: 20px" href="mypage.do?tab=LIKE"> <font
										style="font-size: 14px; color: #000000">관심 물품 조회</font>
								</a>  
								<a class= "myList" id="mypageQna" style="margin-left: 20px" href="mypage.do?tab=QNA"> <font
										style="font-size: 14px; color: #000000">1:1문의</font>
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
			
		<div
			style="width: 780px; text-align: left; margin-top: 60px; margin-bottom: 80px">
			<div
				style="width: 100%; height: 42px; text-align: center; margin-bottom: 20px">
				<font
					style="font-size: 22px; color: #6bb546; font-weight: bold; margin-bottom: 40px">*
					대여 내역 조회 *</font><br> <font style="font-size: 14px; color: #b4b4b4">반납
					예정일을 확인하셔서 연체되지 않도록 주의해주세요.</font>
			</div>
		
		
			<div align="center" style="margin-right: 45px">
				<ul id="thisisul" style="display: inline-block; list-style: none">
					<li class="li" id="rentalNow"
						style="width: 230px; vertical-align: middle; cursor: pointer; border: black 1px solid; padding: 10px 0px 10px 0px; float: left; background-color: #0e7534">
						<font id="" style="font-size: 14px; color: #FFFFFF">대여 현황</font>
					</li>
					<li class="li" id="rentalAll"
						style="width: 230px; vertical-align: middle; cursor: pointer; border: black 1px solid; padding: 10px 0px 10px 0px; float: left; margin-left: -1px">
						<font id="rentalAll_" style="font-size: 14px; color: #000000">대출/
							반납 기록</font>
					</li>
					<li class="li" id="delayFee"
						style="width: 230px; vertical-align: middle; cursor: pointer; border: black 1px solid; padding: 10px 0px 10px 0px; float: left; margin-left: -1px">
						<font id="delayFee_" style="font-size: 14px; color: #000000">연체
							내역</font>
					</li>
				</ul>
			</div>
		
		
			<font style="font-size:18px; color:#414141; font-weight:bold; color: #6bb546">* 대여 현황 ( * 총 <b> ${requestScope.totalNum }</b> 건)</font><br>
			<font style="font-size:12px; color:#acacac">현재 대여 중인 물품 목록입니다.</font>
			
			
<form name="mypageMain" id="mypageMain" method="post" action="return.do">

	<table class="content-table" width="740" border="1" frame="void"
		rules="rows" cellpadding="0" cellspacing="0"
		style="margin-bottom: 40px">
		<tr height="40" style="background-color: #f6f6f6">
			<td id="table-td" width="150">대여번호</td>
			<td id="table-td" class="table-line" width="170">물품명</td>
			<td id="table-td" class="table-line" width="150">대여 일자</td>
			<td id="table-td" class="table-line" width="150">반납 예정일</td>
			<td id="table-td" class="table-line" width="60">연체료</td>
			<td id="table-td" class="table-line" width="120">상태</td>
		</tr>
		
		<c:choose>
		
		<c:when test="${requestScope.totalNum == 0 || empty requestScope.totalNum}">
			<tr style="height: 100.67px">
				<td colspan="6">대여 기록이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach  var="rent" items="${rents}" varStatus="status" >
				<tr>
					<!-- -->
					<td align="center"
						style="padding-top: 10px; padding-bottom: 10px">
						${rent.rent_id }
					</td>
					<td align="center">
						${rent.item_name }
					</td>
					<td align="center">
					
						<fmt:formatDate value="${rent.rent_date }" pattern="yyyy-MM-dd" />
					</td>
					<td align="center">
						<c:if test="${delayDay[status.index] > 0}">
							<font color="red">
								<fmt:formatDate value="${returnExpect[status.index] }" pattern="yyyy-MM-dd" />
								(연체)
							</font>
						</c:if>
						<c:if test="${delayDay[status.index] <= 0}">
							<fmt:formatDate value="${returnExpect[status.index] }" pattern="yyyy-MM-dd" />
						</c:if>
					</td>
					<!-- 연체료 넣어주기!!!! --><!-- 이거이거이거ㅣ어기어ㅣ거이 ㅣㅣ 어기ㅓ이거ㅣㅇ기어ㅣ거이시어이ㅓ이ㅓ이 소영수정수정수정수정수정입니다 start-->
					<td align="center" style="padding-top: 10px; padding-bottom: 10px">
						<c:if test="${delayDay[status.index] >0 }">
							${delayDay[status.index] * rent.item_cost }
						</c:if>
						<c:if test="${delayDay[status.index] <= 0 }">
							-
						</c:if>
					</td>
					<!-- 이거이거이거ㅣ어기어ㅣ거이 ㅣㅣ 어기ㅓ이거ㅣㅇ기어ㅣ거이시어이ㅓ이ㅓ이 소영수정수정수정수정수정입니다 end -->
					<td align="center">
						<c:if test="${rent.state==0 }">
							<font color="blue">대여중</font>
						</c:if>
					</td>
					
				</tr>
				
			</c:forEach>
			
		
		</c:otherwise>
		</c:choose>
		
		<c:set var="thisPage" value="${requestScope.thisPage }"/>
		<c:set var="totalPageNum" value="${requestScope.totalPageNum }"/>
		
		<tr>
			<td colspan="6" height="40">
				<c:forEach var="idx" begin="1" end="${totalPageNum }">
					<c:choose>
						<c:when test="${idx==thisPage }">
							[${idx }]
						</c:when>
						<c:otherwise>
							<a href="mypage.do?thisPage=${idx }">[${idx }]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</td>
		</tr>


	</table>
</form>
		
		</div>		
		<!-- 카피라이트 -->
		<jsp:include page="copyRight.jsp"></jsp:include>
	</div>
</body>
</html>