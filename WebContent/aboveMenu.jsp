<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 네비바 시작 -->
<div id="naviBar" class="div container"  align="center" style="position:fixed; margin-top:-5px; padding-top:5px; z-index:5">
	<div class="divWid">
		<!-- 위에 로그인&검색창 -->
		<div class="div sub_toplogin loginBar">
			<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:-1px">
				<tr height="30">
					<!-- 로고 -->
					<td width="65" rowspan="2">
						<a href="main.do" title="홈"><img src="images/logo/logo3.png" width="100"></a>
					</td>
					<td width="700" colspan="2">
						<table width="700" class="table_basic topNavi" align="right" cellpadding="0" cellspacing="0">
							<tr>
								<td align="right">
									<c:if test="${sessionScope.idKey == null}">
										<a style="font-size:12px; letter-spacing:-0.4px" href="login.do" title="로그인">로그인</a>
									</c:if>
									<c:if test="${sessionScope.idKey != null || sessionScope.m_idKey != null}">
										<a style="font-size:12px; letter-spacing:-0.4px; margin-left:4px" href="logout.do" title="로그아웃">로그아웃</a>
									</c:if>
									<c:if test="${sessionScope.idKey == null}">
										<a href="register.do" title="회원가입" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">회원가입</a>
									</c:if>
									<c:if test="${sessionScope.idKey != null || sessionScope.m_idKey != null}">
										<a href="/Sharepot/mypage.do" title="마이페이지" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">마이페이지</a>
									</c:if>
									<a href="mypageOrderlist.do" title="주문내역조회" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">주문내역조회</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="490" valign="top">
						<form id="menuFrm" method="post" action="main.do"><input type="hidden" name="menuHidden" id="menuHidden">
							<div class="div" style="margin-top:2px" align="center">
								<a class="mainMenu" id="menu1" title="물품함" style="cursor:pointer"><font style="font-size:18px">물품함</font></a>
								<input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:38px" readonly>
								<a class="mainMenu" id="menu2" title="고객소리" style="cursor:pointer"><font style="font-size:18px">고객소리</font></a>
								<input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:38px" readonly>
								<a class="mainMenu" id="menu3" title="커뮤니티" style="cursor:pointer"><font style="font-size:18px">커뮤니티</font></a>
								<input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:38px" readonly>
								<a class="mainMenu" id="menu4" title="about 쉐어팟" style="cursor:pointer"><font style="font-size:18px">about 쉐어팟</font></a>
							</div>
						</form>
					</td>
					<!-- 로그인 메뉴 -->
					<td width="200" valign="top" style="background:url('images/searchbar2.png'); background-size:100%; height:38px; background-repeat:no-repeat">
						<form name="storeForm1" method="post" action="main.do">
							<table width="200" class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:0px" align="right">
								<tr height="38">
									<td width="170" align="right" style="vertical-align:top; padding-top:1px">
										<input type="text" name="searchStr1" value="${searchTxt}" style="font-family:'나눔고딕'; width:165px; height:26px; background-color:transparent; outline:0; border:0">
									</td>
									<td width="30" style="vertical-align:top"><a href="main.do" id="searchBtn1"><img src="images/main/searchbtn.png" width="16" style="cursor:pointer; margin-left:4px; margin-top:4px"></a></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div style="width:100%; height:1px; background-color:#ababab"></div>
</div>

<div class="div gnb" id="GNB" align="center" style="position:absolute; left:0px; top:84px; display:none" onmouseover="$('#GNB').css('display','block')" onmouseout="$('#GNB').css('display','none')">
	<div style="width:798px; height:395px; border:4px solid #86b999; background-color:#ffffff">
		<div class="div" style="background-color:#86b999" align="left">
			<img src="images/main/gnb_category_2.png" width="220" style="margin-left:-1px">
			<img src="images/main/btn_close.gif" width="30" style="position: absolute; margin-left: 538px; margin-top: 3px; cursor:pointer" onclick="$('#GNB').css('display','none')">
		</div>
		<table id="dropDownMenu" width="798" frame="void" rules="all" style="border-color: #efefef">
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
