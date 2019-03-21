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
			<table class="table_basic" width="800" height="133" cellpadding="0" cellspacing="0" style="margin-top:-1px; background-image:url('images/background_wood.png'); background-size:862px; background-repeat:no-repeat">
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
				<font style="font-size:14px; color:#acacac">쉐어팟은 고객님의 정보를 소중하게 생각합니다</font>
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
							<input id="loginBtn" name="loginBtn" type="button" value="로그인" style="width:500px; height:75px; background-color:#d55454; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
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
						<td width="61"><a class="logOption" href="register.do">회원가입</a></td>
						<td width="103"></td>
					</tr>
				</table>
			</div>
		</c:if>
	</div>
</div>

<c:if test="${sessionScope.idKey!=null}">
	<script>location.href="main.do"</script>
</c:if>
<jsp:include page="copyRight.jsp" />
</body>
</html>