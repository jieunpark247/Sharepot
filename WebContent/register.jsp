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
<title>회원가입</title>
<link rel="stylesheet" href="css/details.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script src="js/regi_Check.js"></script>
<script src="js/regi_IdOverlap.js"></script>
<script src="js/menuAnimate.js"></script>
</head>
<body style="font-family:'나눔고딕'" onload="$('#user_id').focus()">
<!-- 아이디찾기 내용 -->
<form id="regiForm" method="post" action="register.do"><input type="hidden" name="step" value="step2">
	<div id="container" class="div container" align="center" style="padding-top:67px">
		<div class="divWid">
			<!-- 회원가입 이미지 -->
			<table class="table_basic" width="800" height="133" cellpadding="0" cellspacing="0" style="margin-top:-1px; background-image:url('images/registerCheck/00join_acceptinfo_03.gif'); background-size:862px; background-repeat:no-repeat">
				<tr>
					<td align="right" valign="top" width="128"><div class="div" style="margin-top:15px" align="center"><font style="font-size:40px; font:'play'; font-weight:bold; color:#d3d3d3">step2</font></div></td>
					<td align="center">
						<div class="div" style="margin-top:0px"><font style="font-size:25px; color:#323232; font-weight:bold">회원가입</font></div>
						<div class="div" style="width:100%;margin-top:5px; margin-bottom:5px"><font style="font-size:12px; color:#949494">회원가입 하시면 알뜰 쇼핑 정보와 다양한 혜택을<br>편리하게 이용하실수 있습니다.</font></div>
					</td>
					<td width="128"></td>
				</tr>
			</table>
			<!-- 회원가입 내용 -->
			<!-- 필수입력 -->
			<div style="margin-top:41px"></div>
			<a id="check"></a>
			<font style="font-size:22px; color:#414141; font-weight:bold">* 필수 입력 *</font><br><div style="margin-bottom:2px"></div>
			<font style="font-size:14px; color:#acacac">회원가입을 위해 반드시 입력해야합니다</font>
			<table class="table_basic" width="500" cellpadding="0" cellspacing="0" style="margin-top:15px; border:1px #acacac solid">
				<!-- 사번 -->
				<tr height="60">
					<td align="center">
						<input type="text" class="regiPrimeInput" name="user_id" placeholder="사번" id="user_id" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-size:18px; border:0px; text-align:center">
						<div id="idMsg" class="error idMsg" style="display:none; margin-bottom:7px">
							<a name="check_id" id="check_id" style="font-size:13px; color:red">사번을 입력하세요</a>
						</div>
					</td>
				</tr>
				<tr height="1">
					<td align="center"><img src="images/registerCheck/dot.jpg" width="440" height="1"></td>
				<tr>
				<!-- 비밀번호 -->
				<tr height="60">
					<td align="center">
						<input type="password" class="regiPrimeInput" placeholder="비밀번호" name="user_pass" id="user_pass" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-size:18px; border:0px; text-align:center">
						<div id="passMsg" class="error passMsg" style="display:none; margin-bottom:7px">
							<a name="check_pass" style="font-size:13px; color:red">비밀번호를 입력하세요</a>
						</div>
					</td>
				</tr>
				<tr height="1">
					<td align="center"><img src="images/registerCheck/dot.jpg" width="440" height="1"></td>
				<tr>
				<!-- 비밀번호 재확인 -->
				<tr height="60">
					<td align="center">
						<input type="password" class="regiPrimeInput" placeholder="비밀번호 확인" name="user_repass" id="user_repass" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-size:18px; border:0px; text-align:center">
						<div id="repassMsg" class="error" style="display:none; margin-bottom:7px">
							<a name="check_repass" style="font-size:13px; color:red">비밀번호를 한번 더 입력하세요</a>
						</div>
					</td>
				</tr>
			</table>
			<table class="table_basic" width="500" cellpadding="0" cellspacing="0" style="margin-top:22px; border:1px #acacac solid">
				<!-- 이름 -->
				<tr height="60">
					<td align="center">
						<input type="text" placeholder="이름" name="user_name" id="user_name" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-size:18px; border:0px; text-align:center">
						<div id="nameMsg" class="error" style="display:none; margin-bottom:7px">
							<a name="check_name" style="font-size:13px; color:red">이름을 입력하세요</a>
						</div>
					</td>
				</tr>
				<tr height="1">
					<td align="center"><img src="images/registerCheck/dot.jpg" width="440" height="1"></td>
				<tr>
				<!-- 휴대전화번호 -->
				<tr height="60">
					<td align="center">
						<input type="text" style="outline:0; margin-top:5px; margin-bottom:3px; width:80px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center; background-color:#ffffff" value="010" readonly disabled>-
						<input type="text" placeholder="휴대전화" name="user_phone1" id="user_phone1" style="outline:0; margin-top:5px; margin-bottom:3px; width:100px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center" size="4"> -
						<input type="text" name="user_phone2" id="user_phone2" style="outline:0; margin-top:5px; margin-bottom:3px; width:80px; height:26px; font-size:18px; border:0px; text-align:center">
						<div id="phoneMsg" class="error" style="display:none; margin-bottom:7px">
							<a name="check_phone" style="font-size:13px; color:red">휴대전화를 입력하세요</a>
						</div>
					</td>
				</tr>
			</table>
			<jsp:include page="datepicker.jsp" />
			
			<!-- 버튼 -->
			<table class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:60px; margin-bottom:80px">
				<tr>
					<td align="right"><input id="registerNext" name="registerNext" type="button" value="회원가입" style="width:240px; height:75px; background-color:#6bb546; border:0; border-radius:7px; font-size:24px; color:#ffffff; cursor:pointer"></td>
					<td width="20"></td>
					<td align="left"><input onclick="javascript:history.back()" type="button" value="이전으로" style="width:240px; height:75px; background-color:#ababab; border:0; border-radius:7px; font-size:24px; color:#ffffff; cursor:pointer"></td>
				</tr>
			</table>
		</div>
		<jsp:include page="copyRight.jsp" />
	</div>
</form>
<c:if test="${sessionScope.idKey!=null}">
	<script>location.href="main.do"</script>
</c:if>
</body>
</html>