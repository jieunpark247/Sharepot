<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="css/details.css" />
<!-- 네비바 시작 -->
<div style="width:100%" align="center">
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
										<c:if test="${sessionScope.idKey != null}">
											<a style="font-size:12px; letter-spacing:-0.4px; margin-left:4px" href="logout.do" title="로그아웃">로그아웃</a>
										</c:if>
										<c:if test="${sessionScope.idKey == null}">
											<a href="register.do" title="회원가입" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">회원가입</a>
										</c:if>
										<c:if test="${sessionScope.idKey != null}">
											<a href="mypage.do" title="마이페이지" style="font-size:12px; letter-spacing:-0.4px; margin-left:4px">마이페이지</a>
										</c:if>
										<%-- <c:if test=""> --%>
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
</div>