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
			<div>
			</div>
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
		</div>
		<!-- 커뮤니티 -->
		<div id="communityAnchor" class="mainAnchor" style="background-image:url('images/tape3.png'); margin-top:104px">
			<div>
				<font style="font-size:23px; color:white; font-weight:bold">커뮤니티</font>
			</div>
		</div>
		<div>
			<table width="188" class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:30px; background:url('images/main/searchbar3.png'); background-size:100%; height:38px; background-repeat:no-repeat" align="right">
				<tr height="38">
					<td width="158" align="right" style="vertical-align:top">
						<input type="text" id="searchStr" name="searchStr" placeholder="제목 검색" style="font-family:'나눔고딕'; font-size:13px; padding-top:2px; padding-left:14px; width:144px; height:27px; background-color:transparent; outline:0; border:0; color:#808080" value="${search}">
					</td>
					<td width="30" style="vertical-align:top"><a id="cstmBtn"><img src="images/main/searchbtn.png" width="16" style="margin-left:4px; margin-top:5px; cursor:pointer"></a></td>
				</tr>
			</table>
			
			<table class="content-table" width="800" border="1" frame="void" rules="rows" cellpadding="0" cellspacing="0" style="margin-top:30px">
				<tr height="40" style="background-color:#f6f6f6">
					<td id="table-td" width="50">번호</td>
					<td id="table-td" class="table-line" width="470">제목</td>
					<td id="table-td" class="table-line" width="100">작성자</td>
					<td id="table-td" class="table-line" width="70">조회수</td>
					<td id="table-td" class="table-line" width="110">작성일</td>
				</tr>
				
				<tr height="40">
					<td id="table-td">1</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">2</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">3</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">4</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">5</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">6</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">7</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">8</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">9</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">10</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">11</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">12</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">13</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<!-- 글이 없을 때 -->
				<!-- <tr style="height:100.67px">
					<td colspan="6">등록된 글이 없습니다</td>
				</tr> -->
			</table>
			<c:if test="${act.equals('qna')}">
				<div align="right" style="margin-top:10px; margin-bottom:-40px">
					<input id="gotoWriting" name="gotoWriting" type="button" value="글쓰기" style="width:80px; height:30px; background-color:#6bb546; border:0; border-radius:2px; font-size:12px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
				</div>
			</c:if>
			<div class="paging-list" style="margin-top:50px; margin-bottom:50px">
				<ol>
					<c:if test="${pgList.startPage>pgList.pageSize}">
						<li><a href="customer.do?act=${act}&pageNum=${pgList.startPage-1}&searchStr=${search}"><img id="paging-btn1" src="images/paging_arrow1_ori.png" width="31"></a></li>
					</c:if>
					<c:forEach var="page" begin="${pgList.startPage}" end="${pgList.endPage}" step="1">
						<c:if test="${pgList.currentPage==page}">
							<li><a href="customer.do?act=${act}&pageNum=${page}&searchStr=${search}" style="background-color:#f2f2f2">${page}</a></li>
						</c:if>
						<c:if test="${pgList.currentPage!=page}">
							<li><a href="customer.do?act=${act}&pageNum=${page}&searchStr=${search}">${page}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pgList.endPage<pgList.pageCount}">
						<li><a href="customer.do?act=${act}&pageNum=${pgList.endPage+1}&searchStr=${search}"><img id="paging-btn2" src="images/paging_arrow2_ori.png" width="31"></a></li>
					</c:if>
				</ol>
			</div>
		</div>
		
		<!-- about쉐어팟 -->
		<div id="aboutSharepotAnchor" class="mainAnchor" style="background-image:url('images/tape2.png'); margin-top:104px">
			<div>
				<font style="font-size:23px; color:white; font-weight:bold">about 쉐어팟</font>
			</div>
		</div>
		<div>
			<table width="188" class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:30px; background:url('images/main/searchbar3.png'); background-size:100%; height:38px; background-repeat:no-repeat" align="right">
				<tr height="38">
					<td width="158" align="right" style="vertical-align:top">
						<input type="text" id="searchStr" name="searchStr" placeholder="제목 검색" style="font-family:'나눔고딕'; font-size:13px; padding-top:2px; padding-left:14px; width:144px; height:27px; background-color:transparent; outline:0; border:0; color:#808080" value="${search}">
					</td>
					<td width="30" style="vertical-align:top"><a id="cstmBtn"><img src="images/main/searchbtn.png" width="16" style="margin-left:4px; margin-top:5px; cursor:pointer"></a></td>
				</tr>
			</table>
			
			<table class="content-table" width="800" border="1" frame="void" rules="rows" cellpadding="0" cellspacing="0" style="margin-top:30px">
				<tr height="40" style="background-color:#f6f6f6">
					<td id="table-td" width="50">번호</td>
					<td id="table-td" class="table-line" width="470">제목</td>
					<td id="table-td" class="table-line" width="100">작성자</td>
					<td id="table-td" class="table-line" width="70">조회수</td>
					<td id="table-td" class="table-line" width="110">작성일</td>
				</tr>
				
				<tr height="40">
					<td id="table-td">1</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">2</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">3</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">4</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">5</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">6</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">7</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">8</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">9</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">10</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">11</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">12</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<tr height="40">
					<td id="table-td">13</td>
					<td id="table-td" class="table-line" align="left" style="padding-left:20px">
						<table style="padding:0px">
							<tr>
								<td style="padding-right:0px">
									<a href="#">안뇽하세요</a>
								</td>
							</tr>
						</table>
					</td>
					<td id="table-td" class="table-line">배운정</td>
					<td id="table-td" class="table-line">34</td>
					<td id="table-td" class="table-line">2019-03-01</td>
				</tr>
				<!-- 글이 없을 때 -->
				<!-- <tr style="height:100.67px">
					<td colspan="6">등록된 글이 없습니다</td>
				</tr> -->
			</table>
			<c:if test="${act.equals('qna')}">
				<div align="right" style="margin-top:10px; margin-bottom:-40px">
					<input id="gotoWriting" name="gotoWriting" type="button" value="글쓰기" style="width:80px; height:30px; background-color:#6bb546; border:0; border-radius:2px; font-size:12px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
				</div>
			</c:if>
			<div class="paging-list" style="margin-top:50px; margin-bottom:50px">
				<ol>
					<c:if test="${pgList.startPage>pgList.pageSize}">
						<li><a href="customer.do?act=${act}&pageNum=${pgList.startPage-1}&searchStr=${search}"><img id="paging-btn1" src="images/paging_arrow1_ori.png" width="31"></a></li>
					</c:if>
					<c:forEach var="page" begin="${pgList.startPage}" end="${pgList.endPage}" step="1">
						<c:if test="${pgList.currentPage==page}">
							<li><a href="customer.do?act=${act}&pageNum=${page}&searchStr=${search}" style="background-color:#f2f2f2">${page}</a></li>
						</c:if>
						<c:if test="${pgList.currentPage!=page}">
							<li><a href="customer.do?act=${act}&pageNum=${page}&searchStr=${search}">${page}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pgList.endPage<pgList.pageCount}">
						<li><a href="customer.do?act=${act}&pageNum=${pgList.endPage+1}&searchStr=${search}"><img id="paging-btn2" src="images/paging_arrow2_ori.png" width="31"></a></li>
					</c:if>
				</ol>
			</div>
		</div>
	</div>
</div>

<jsp:include page="copyRight.jsp" />
</body>
</html>