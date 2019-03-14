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
<title>회원가입</title>
<link rel="stylesheet" href="css/details.css" />
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script src="js/regi_Check.js"></script>
<script src="js/regi_IdOverlap.js"></script>
<script type="text/javascript">
	function zipErr() {
		//alert('우편번호DB가 일부 존재하기 때문에 서울 지역에 한하여 검색해주세요. ex)논현, 압구정, 대치')
	}
</script>
</head>
<body style="font-family:'나눔고딕'" onload="$('#user_id').focus()">

<div class="floatingBanner" style="width:100%; height:0px; position:absolute" align="center">
	<div style="width:800px; height:0px">
		<div style="width:105px; height:500px; margin:0 auto; margin-left:-120px; float:left">
			<div class="laypop_quick" style="width:105px; height:0px; position:absolute; z-index:100; margin:0 auto; top:106px" align="center">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="105" height="15"><img id="ANIMATE" src="images/01index_banner/01index_banner_01.png" width="105" height="15"></td>
					</tr>
					<tr>
						<td width="105" height="105"><a href="javascript:banner1();"><img src="images/01index_banner/01index_banner_02.png" width="105" height="105" border="0"></a></td>
					</tr>
					<tr>
						<td width="105" height="13"><img src="images/01index_banner/01index_banner_03.png" width="105" height="13"></td>
					</tr>
				    <tr>
				    	<td width="105" height="105"><a href="javascript:banner2();"><img src="images/01index_banner/01index_banner_04.png" width="105" height="105" border="0"></a></td>
					</tr>
					<tr>
				    	<td width="105" height="13"><img src="images/01index_banner/01index_banner_05.png" width="105" height="13"></td>
					</tr>
				    <tr>
				    	<td width="105" height="105"><a href="javascript:banner3();"><img src="images/01index_banner/01index_banner_06.png" width="105" height="105" border="0"></a></td>
					</tr>
				</table>
			</div>
		</div>
		<div style="width:105px; height:500px; margin:0 auto; margin-right:-120px">
			<div class="laypop_quick" style="width:94px; position:absolute; z-index:100; margin:0 auto; top:106px"> 
				<div class="div" style="width:94px; height:26px; border-radius:0px; background-color:#ffffff; padding-top:7px; padding-bottom:7px; border:1px solid #dcdcdc">
					<font style="font-size:12px; color:#000000">나의 쇼핑</font><br><img src="images/arrowDown2.png" width="10" style="margin-top:4px">
				</div>
				<div class="div" style="width:94px; border-radius:0px; background-color:#ffffff; padding-top:0px; margin-top:8px; border:1px solid #dcdcdc">
					<div style="width:70px; height:3px; margin-top:-1px; background-color:#3b3b3b; margin-bottom:7px"></div>
					<font style="font-size:12px; color:#000000">오늘 본 상품</font>
					<div style="margin-top:2px; margin-bottom:2px; width:92px; background-color:#ffffff">
						<c:forEach var="history" items="${histories}">
							<a href="goods.do?p_no=${history.p_no}"><img src="${history.p_img}" width="80" style="margin-top:3px; margin-bottom:3px"></a>
						</c:forEach>
					</div>
					<a onclick="btn_top()" style="cursor:pointer"><div style="margin-top:4px; margin-left:-1px; width:96px; padding-top:6px; padding-bottom:7px; background-color:#3b3b3b">
						<font style="font-size:12px; color:#ffffff; font-family:'Arial'; letter-spacing:0.5px">TOP</font><img src="images/arrowUp.png" width="10" style="margin-bottom:1px; margin-left:4px">
					</div></a>
				</div>
			</div>
		</div>
	</div>
</div>

<form id="regiForm" method="post" action="register.do">
<input type="hidden" value="step2" name="step" />
<!-- 네비바 시작 -->
<div class="div container" align="center">
	<div class="divWid">
		<c:if test="${sessionScope.idKey==null}">
			<!-- 위에 로그인&검색창 -->
			<div class="div sub_toplogin loginBar">
				<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:-1px">
					<tr height="30">
						<!-- 로고 -->
						<td width="65" rowspan="2">
							<a href="main.do" title="홈"><img src="images/sub_toplogin/02_sub_toplogin_03.gif" width="65"></a>
						</td>
						<td width="735" colspan="2">
							<table width="735" class="table_basic topNavi" align="right" cellpadding="0" cellspacing="0">
								<tr>
									<td align="right">
										<a style="font-size:12px; letter-spacing:-0.4px" href="login.do" title="로그인">로그인</a>
										<a href="register.do" title="회원가입" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">회원가입</a>
										<a href="mypageOrderlist.do" title="마이페이지" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">주문내역조회</a>
										<a href="cart.do" title="장바구니" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">장바구니</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="490" valign="top">
							<div class="div" style="margin-top:2px; margin-left:35px; width:414px" align="center">
								<a class="mainMenu" id="menu1" title="스토어" onclick="$('#GNB').css('display','block')" onmouseover="$('#GNB').css('display','block')" style="cursor:pointer"><font style="font-size:18px">스토어</font></a>
								<input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:54px" readonly>
								<a class="mainMenu" id="menu2" href="magazine.do" title="매거진"><font style="font-size:18px">매거진</font></a>
								<input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:54px" readonly>
								<a class="mainMenu" id="menu3" href="story.do" title="스토리"><font style="font-size:18px">스토리</font></a>
								<input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:54px" readonly>
								<a class="mainMenu" id="menu4" href="customer.do" title="고객센터"><font style="font-size:18px">고객센터</font></a>
							</div>
						</td>
						<!-- 로그인 메뉴 -->
						<td width="245" valign="top" style="background:url('images/main/searchbar2.png'); background-size:100%; height:38px; background-repeat:no-repeat">
							<form name="storeForm1" method="post" action="store.do">
								<table width="245" class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:0px" align="right">
									<tr height="38">
										<td width="210" align="right" style="vertical-align:top">
											<input type="text" name="searchStr1" value="${search1}" style="font-family:'나눔고딕'; width:198px; height:25px; background-color:transparent; outline:0; border:0">
										</td>
										<td width="30" style="vertical-align:top"><a onclick="submit1()"><img src="images/main/searchbtn.png" width="16" style="cursor:pointer; margin-left:4px; margin-top:4px"></a></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</div>
			
			<%-- 1000포인트 증정 --%>
			<div class="div" id="regiSuccess" align="center" style="position:absolute; height:0px; margin-top:34px; left:253px">
				<div style="width:800px; height:0px">
					<img src="images/bubble2.png" width="55">
					<span style="position:absolute; margin-top:9px; margin-left:-45px; font-size:10px; color:#ffffff; font-family:Lato">+1000P</span>
				</div>
			</div>
			<!-- 위에 로그인&검색창 끝!!!! -->
		</c:if>
		<c:if test="${sessionScope.idKey!=null}">
			<!-- 로그인한 상태일 때 위에 로그인&검색창 -->
			<div class="div sub_toplogin loginBar">
				<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:-1px">
					<tr height="30">
						<!-- 로고 -->
						<td width="65" rowspan="2">
							<a href="main.do" title="홈"><img src="images/sub_toplogin/02_sub_toplogin_03.gif" width="65"></a>
						</td>
						<td width="735" colspan="2">
							<table width="735" class="table_basic topNavi" align="right" cellpadding="0" cellspacing="0">
								<tr>
									<td align="right">
										<a style="font-size:12px; letter-spacing:-0.4px; margin-left:4px" href="logout.do" title="로그아웃">로그아웃</a>
										<a href="mypagePoint.do" title="마이페이지" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">마이페이지</a>
										<a href="mypageOrderlist.do" title="주문내역조회" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">주문내역조회</a>
										<a href="cart.do" title="장바구니" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">장바구니</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="490" valign="top">
							<div class="div" style="margin-top:2px; margin-left:35px; width:414px" align="center">
								<a class="mainMenu" id="menu1" title="스토어" onclick="$('#GNB').css('display','block')" onmouseover="$('#GNB').css('display','block')" style="cursor:pointer"><font style="font-size:18px">스토어</font></a>
								<input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:54px" readonly>
								<a class="mainMenu" id="menu2" href="magazine.do" title="매거진"><font style="font-size:18px">매거진</font></a>
								<input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:54px" readonly>
								<a class="mainMenu" id="menu3" href="story.do" title="스토리"><font style="font-size:18px">스토리</font></a>
								<input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:54px" readonly>
								<a class="mainMenu" id="menu4" href="customer.do" title="고객센터"><font style="font-size:18px">고객센터</font></a>
							</div>
						</td>
						<!-- 로그인 메뉴 -->
						<td width="245" valign="top" style="background:url('images/main/searchbar2.png'); background-size:100%; height:38px; background-repeat:no-repeat">
							<form name="storeForm1" method="post" action="store.do">
								<table width="245" class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:0px" align="right">
									<tr height="38">
										<td width="210" align="right" style="vertical-align:top">
											<input type="text" value="${search1}" name="searchStr1" style="font-family:'나눔고딕'; width:198px; height:25px; background-color:transparent; outline:0; border:0">
										</td>
										<td width="30" style="vertical-align:top"><a onclick="submit1()"><img src="images/main/searchbtn.png" width="16" style="cursor:pointer; margin-left:4px; margin-top:4px"></a></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</div>
			<!-- 위에 로그인&검색창 끝!!!! -->
		</c:if>
	</div>
</div>
<div class="div" style="background-color:#0c7733; width:100%; height:3px; margin-top:5px; border:1px #000000 solid"></div>
<%-- 네비바 끝 --%>

<!-- 아이디찾기 내용 -->
<div id="container" class="div container" align="center">
	<div class="divWid">
		<!-- 회원가입 이미지 -->
		<table class="table_basic" width="800" height="133" cellpadding="0" cellspacing="0" style="margin-top:0px; background-image:url('images/registerCheck/00join_acceptinfo_03.gif'); background-size:862px; background-repeat:no-repeat">
			<tr>
				<td align="right" valign="top" width="128"><div class="div" style="margin-top:15px" align="center"><font style="font-size:40px; font:'play'; font-weight:bold; color:#d3d3d3">step2</font></div></td>
				<td align="center">
					<div class="div" style="margin-top:0px"><font style="font-size:25px; color:#323232; font-weight:bold">회원탈퇴</font></div>
				</td>
				<td width="128"></td>
			</tr>
		</table>
		
		<div style="margin-top:41px"></div>
		<a id="check"></a>
		<br><br><br>
		<font style="font-size:22px; color:#414141">한 번 회원탈퇴를 하시면 회원정보, 대여 내역 등이<br><font style="font-size:23px; color:#323232; font-weight:bold">초기화</font>되며 복구할 수 없습니다.<br>아래의 사항에 동의를 하신다면 회원탈퇴 요청을 진행해 주세요.</font><br><div style="margin-bottom:2px"></div>
		<br><br><br>
		<!-- 버튼 -->
		<table class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:60px; margin-bottom:80px">
			<tr>
				<td align="right"><input id="registerNext" name="registerNext" type="button" value="탈퇴하기" style="width:180px; height:75px; background-color:#6bb546; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"></td>
				<td width="20"></td>
				<td align="left"><input onclick="javascript:history.back()" type="button" value="이전으로" style="width:180px; height:75px; background-color:#ababab; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"></td>
			</tr>
		</table>
	</div>
	   <br><br><br><br><br><br><br><br><br><br>
	<div class="div gnb" id="GNB" align="center" style="position:absolute; left:0px; top:88px; display:none" onmouseover="$('#GNB').css('display','block')" onmouseout="$('#GNB').css('display','none')">
		<div style="width:798px; height:395px; border:4px solid #86b999; background-color:#ffffff">
			<div class="div" style="background-color:#86b999" align="left">
				<img src="images/main/gnb_category_2.png" width="220" style="margin-left:-1px">
				<img src="images/main/btn_close.gif" width="30" style="position: absolute; margin-left: 538px; margin-top: 3px; cursor:pointer" onclick="$('#GNB').css('display','none')">
			</div>
			<table width="798" frame="void" rules="all" style="border-color: #efefef">
				<tr height="177" style="vertical-align:top">
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">채소</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=vegi&cate2=3">버섯/나물</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">잎/열매채소</a></li>
							<li><a href="store.do?cate1=vegi&cate2=2">뿌리/전처리채소</a></li>
						</ul>
					</td>
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">과일</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=fruit&cate2=1">생과일</a></li>
							<li><a href="store.do?cate1=fruit&cate2=2">건과일</a></li>
						</ul>
					</td>
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">쌀·견과류</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=grain&cate2=1">견과류</a></li>
							<li><a href="store.do?cate1=grain&cate2=2">쌀/잡곡</a></li>
						</ul>
					</td>
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">수산물</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=vegi&cate2=1">수산물</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">건어물</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">수산가공품</a></li>
						</ul>
					</td>
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">축산물</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=vegi&cate2=1">한우</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">닭/계란</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">육가공품</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">돼지고기</a></li>
						</ul>
					</td>
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">간식</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=vegi&cate2=1">잼류</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">떡/죽</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">과자/빵</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">냉동식품</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">엿/캔디류</a></li>
						</ul>
					</td>
				</tr>
				<tr height="177" style="vertical-align:top">
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">양념</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=vegi&cate2=1">소스</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">장류</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">기름류</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">분말류</a></li>
						</ul>
					</td>
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">반찬</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=vegi&cate2=1">김</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">어묵</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">국/탕/찌개</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">두부/콩나물</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">젓갈/조림/절임</a></li>
						</ul>
					</td>
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">차/음료</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=vegi&cate2=1">차류</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">생수</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">음료/두유</a></li>
						</ul>
					</td>
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">생활용품</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=vegi&cate2=1">화장품</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">주방용품</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">욕실용품</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">영/유아용품</a></li>
						</ul>
					</td>
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">건강식품</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=vegi&cate2=1">꿀</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">생/선식</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">기능식품</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">홍삼/산양산삼</a></li>
						</ul>
					</td>
					<td width="133" align="center">
						<h2 style="font-size:17px; color:#666; text-align:center; width:106px; height:35px; border-bottom:2px solid #86b999; margin-bottom:0px">선물세트</h2>
						<ul style="padding-left:0px; text-align:left; width:106px; margin-top:8px">
							<li><a href="store.do?cate1=vegi&cate2=1">상품권</a></li>
							<li><a href="store.do?cate1=vegi&cate2=1">선물모음</a></li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- 카피라이트 -->
	<div class="div" style="background-color:#423a37; height:31px"></div>
	<div class="div" style="background-color:#ececec; height:161px" align="center">
		<table cellspacing="0" cellpadding="0" width="916px" height="161">
			<tr>
				<td style="background-image:url('images/main/01main_109.gif'); background-size:916px; background-repeat:no-repeat"></td>
			</tr>
		</table>
	</div>
</div>
<c:if test="${sessionScope.idKey!=null}">
	<script>location.href="main.do"</script>
</c:if>
</form>
</body>
</html>