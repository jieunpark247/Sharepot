<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="aboveMenu.jsp" />
<jsp:include page="floatingBanner.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/details.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script src="js/login_Check.js"></script>
<script src="js/menuAnimate.js"></script>
</head>
<body style="font-family:'나눔고딕'" onload="$('#log_id').focus()">
<!-- 로그인 내용 -->
<div id="container" class="div container" align="center" style="padding-top:67px">
	<div class="divWid">
		<c:if test="${sessionScope.idKey==null}">
			<!-- 로그인 이미지 -->
			<table class="table_basic" width="800" height="133" cellpadding="0" cellspacing="0" style="margin-top:-1px; background-image:url('images/registerCheck/00join_acceptinfo_03.gif'); background-size:862px; background-repeat:no-repeat">
				<tr>
					<td align="right" valign="top" width="128"></td>
					<td align="center">
						<div class="div" style="margin-top:0px"><font style="font-size:25px; color:#323232; font-weight:bold">로그인</font></div>
						<div class="div" style="width:100%;margin-top:5px; margin-bottom:5px"><font style="font-size:12px; color:#949494">로그인하시면 더 많은 혜택을 확인하실 수 있습니다.</font></div>
					</td>
					<td width="128"></td>
				</tr>
			</table>
			<!-- 로그인 내용 -->
			<div style="margin-top:40px">
				<font style="font-size:22px; color:#414141; font-weight:bold">쉐어팟 방문을 환영합니다</font><br><div style="margin-bottom:2px"></div>
				<font style="font-size:14px; color:#acacac">쉐어팟 고객님의 정보를 소중하게 생각합니다</font>
				<form name="loginForm" id="loginForm" method="post" action="login.do">
					<table class="table_basic" width="500" cellpadding="0" cellspacing="0" style="margin-top:15px; margin-bottom:30px; border:1px #acacac solid">
						<!-- 아이디 -->
						<tr height="60">
							<td align="center">
								<input type="text" placeholder="사번" name="log_id" value="${failedId}" id="log_id" onkeydown="javascript:if(event.keyCode==13) $('#loginForm').submit();" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center">
								<div id="log_idMsg" class="error" style="display:none; margin-bottom:7px">
									<a name="log_check_id" style="font-size:13px; color:red">아이디를 입력하세요</a>
								</div>
							</td>
						</tr>
						<tr height="1">
							<td align="center"><img src="images/registerCheck/dot.jpg" width="440" style="height:1px"></td>
						<tr>
						<!-- 비밀번호 -->
						<tr height="60">
							<td align="center">
								<input type="password" placeholder="비밀번호" name="log_passwd" id="log_passwd" onkeydown="javascript:if(event.keyCode==13) $('#loginForm').submit();" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center">
								<div id="log_passMsg" class="error" style="display:none; margin-bottom:7px">
									<a name="log_check_pass" style="font-size:13px; color:red">비밀번호를 입력하세요</a>
								</div>
							</td>
						</tr>
					</table>
					<c:if test="${failedId != null}">
						<script>$('#log_passwd').val(''); $('#log_passwd').focus(); </script>
						<div class="div" id="idErrorMsg" style="margin-top:10px; width:503px" align="center">
							<a style="font-size:14px; color:red">* 아이디 또는 비밀번호를 다시 확인하세요 *<br>도래도담에 등록되지 않은 아이디이거나, 비밀번호를 잘못 입력하셨습니다</a>
						</div>
					</c:if>
				</form>
				<!-- 버튼 -->
				<table class="table_basic" cellpadding="0" cellspacing="0" style="width:500px; margin-top:15px; margin-bottom:80px">
					<tr>
						<td width="500" colspan="7">
							<c:if test="${order.equals('withoutLogin') && requestScope.olWthtLgn == null}">
								<input id="loginBtn" name="loginBtn" type="button" value="로그인" style="width:500px; height:75px; background-color:#6bb546; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
								<form id="orderForm" name="orderForm" method="post" action="login.do"><input type="hidden" name="orderCheck" id="orderCheck" value="">
									<input id="orderWthtLgn" name="orderWthtLgn" type="button" value="비회원 주문" style="width:500px; height:75px; margin-top:20px; background-color:#ababab; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
								</form>
							</c:if>
							<c:if test="${!order.equals('withoutLogin') && requestScope.olWthtLgn == null}"><input type="hidden" id="orderLgn" name="orderLgn" value="">
								<input id="loginBtn" name="loginBtn" type="button" value="로그인" style="width:500px; height:75px; background-color:#6bb546; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
							</c:if>
							<c:if test="${requestScope.olWthtLgn != null}">
								<input id="loginBtn" name="loginBtn" type="button" value="로그인" style="width:500px; height:75px; background-color:#6bb546; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
								<form id="orderListForm" name="orderListForm" method="post" action="mypageOrderlistNM.do"><input type="hidden" name="orderLgn" id="orderLgn" value="">
									<input id="orderListBtn" name="orderListBtn" type="button" value="비회원 주문내역조회" style="width:500px; height:75px; margin-top:20px; background-color:#ababab; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
								</form>
							</c:if>
						</td>
					</tr>
					<tr height="50">
						<td align="center" colspan="7"></td>
					<tr>
					<tr style="height:0.5px">
						<td align="center" colspan="7" style="background-color:#d7d7d7"></td>
					<tr>
					<tr height="20">
						<td align="center" colspan="7"></td>
					<tr>
					<tr>
						<td width="101"><input type="hidden" name="searchType" id="searchType" value=""></td>
						<td width="81"><a class="logOption" href="findIdPw.do" id="findId">아이디 찾기</a></td>
						<td width="32" align="center"><font style="font-size:11px; color:#c9c9c9">│&nbsp;</font></td>
						<td width="96"><a class="logOption" href="findIdPw.do" id="findPw">비밀번호 찾기</a></td>
						<td width="30" align="center"><font style="font-size:11px; color:#c9c9c9">│&nbsp;</font></td>
						<td width="61"><a class="logOption" href="registerCheck.do">회원가입</a></td>
						<td width="103"></td>
					</tr>
				</table>
			</div>
		</c:if>
	</div>
</div>

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

<c:if test="${sessionScope.idKey!=null}">
	<script>location.href="main.do"</script>
</c:if>
<jsp:include page="copyRight.jsp" />
</body>
</html>