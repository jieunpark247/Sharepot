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
		$('#deleteLike').click(function() {
			var i = 0;
			//var str = document.getElementsByName('checkbox');
			//alert(str);
			if($('.checkedAll').is(':checked')==true) { //체크가 됐으면
				i = 1;
			}
			if(i == 0) { //아무것도 선택안한 상태면
				alert('삭제할 상품을 선택하세요');
			} else if(i == 1) {
				$('#action').val('likeDelete');
				$('#mypageLikeForm').submit();
				$('#action').val('');
			}
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
										style="font-size: 14px; color: #000000">대여 내역 조회</font>
								</a> 
								<a class= "myList" id="mypageLike" style="margin-left: 20px" href="mypage.do?tab=LIKE"> <font
										style="font-size: 14px; color: #0e7534">관심 물품 조회</font>
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
		
		<div style="width:740px; text-align:left; margin-top:60px; margin-bottom:80px">
			<div style="width:100%; height:42px; text-align:center; margin-bottom:20px"><font style="font-size:22px; color:#6bb546; font-weight:bold; margin-bottom:40px">* 관심물품 *</font><br><font style="font-size:14px; color:#b4b4b4">관심 대여 물품을 선택하여 대여하시기 바랍니다.</font></div>
			
			<form name="mypageLikeForm" id="mypageLikeForm" method="post" action="mypageD.do">
				<font style="font-size:16px">* 관심물품</font>
				<table class="content-table" width="740" border="1" frame="void" rules="rows" cellpadding="0" cellspacing="0" style="margin-bottom:10px">
					<tr height="40" style="background-color:#f6f6f6">
						<td id="table-td" width="50"><input type="checkbox" style="width:22px; height:22px" id="check0" checked="checked"></td>
						<td id="table-td" class="table-line" width="170">물품 번호</td>
						<td id="table-td" class="table-line" width="380">물품명</td>
						<td id="table-td" class="table-line" width="140">상태</td>
					</tr>
					
						<c:choose>
							<c:when test="${empty likeItem }">
								<tr><td colspan="5" height="100px">관심상품이 없습니다</td></tr>
							</c:when>
						
							<c:otherwise>
							<c:forEach items="${likeItem }" var="item">
							<tr>
								<td height="40"><input type="checkbox" name="checkbox" id="checkbox" class="checkedAll" checked="checked" style="width:22px; height:22px" value="${item.item_no}"></td>
								<td width="350" align="center"><a href="#">${item.item_no }</a></td>
								<td width="350" align="center"><a href="#">${item.item_name }</a></td>
								<td width="350" align="center">
									<c:if test="${item.state==0 }">
										<font color="blue">대여 가능</font>
									</c:if>
									<c:if test="${item.state==1 }">
										<font color="red"><b>대여 불가능(대여중입니다)</b></font>
									</c:if>
									<c:if test="${item.state==2 }">
										<font color="red"><b>대여 불가능</b></font>
									</c:if>
							</tr>
							</c:forEach>
							
							<c:set var="total" value="${requestScope.total }"/>
							<tr>
								<td colspan="6" height="40">
									<c:forEach var="idx" begin="1" end="${total }">
										<c:choose>
											<c:when test="${idx==thisPage }">
												[${idx }]
											</c:when>
											<c:otherwise>
												<a href="mypage.do?tab=LIKE&thisPage=${idx }">[${idx }]</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</td>
							</tr>
						</c:otherwise>
						</c:choose>
				
						
				</table>
				<div align="right"><input type="hidden" id="action" name="action" value="">
					<input id="deleteLike" name="deleteLike" type="button" value="삭제하기" style="width:90px; height:30px; background-color:#ababab; border:0; border-radius:2px; font-size:12px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
				</div>
			</form>
		</div>
		


      <jsp:include page="copyRight.jsp"></jsp:include>
	</div>
</body>
</html>


		











