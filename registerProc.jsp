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
<title>회원가입 완료</title>
<link rel="stylesheet" href="css/details.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script src="js/menuAnimate.js"></script>
</head>
<body style="font-family:'나눔고딕'" onload="$('#user_id').focus()">
<!-- 회원가입 내용 -->
<div id="container" class="div container" align="center">
	<div class="divWid">
		<!-- 회원가입 이미지 -->
		<table class="table_basic" width="800" height="133" cellpadding="0" cellspacing="0" style="margin-top:0px; background-image:url('images/background_wood.png'); background-size:862px; background-repeat:no-repeat">
			<tr>
				<td align="right" valign="top" width="128"></td>
				<td align="center">
					<div class="div" style="margin-top:0px"><font style="font-size:25px; color:#323232; font-weight:bold">회원가입</font></div>
					<div class="div" style="width:100%;margin-top:5px; margin-bottom:5px"><font style="font-size:12px; color:#949494">회원가입 하시면 알뜰 쇼핑 정보와 다양한 혜택을<br>편리하게 이용하실수 있습니다.</font></div>
				</td>
				<td width="128"></td>
			</tr>
		</table>
		<div style="margin-top:40px" align="center">
			<font style="font-size:22px; color:#d55454; font-weight:bold">* 회원가입 완료 *</font><br><div style="margin-bottom:2px"></div>
			<font style="font-size:14px; color:#b4b4b4">도래도담의 회원이 되신 것을 진심으로 환영합니다</font>
			<table class="table_basic" width="600" cellpadding="0" cellspacing="0" style="margin-top:15px; border-color:#b4b4b4; border-collapse:collapse" border="1">
				<tr height="260">
					<td align="center" valign="middle" style="background-color:#f5f5f5">
						<table class="table_basic" width="580" cellpadding="0" cellspacing="0" style="border-color:#b4b4b4; border-collapse:collapse" border="1">
							<tr height="240">
								<td style="background-color:#ffffff" valign="top">
									<div style="margin-top:30px; margin-left:30px; margin-right:30px" align="center">
										<div align="left">
											<font style="font-size:15px; font-weight:bold; color:#616161">${mdto.getId()}</font><font style="font-size:15px; color:#616161">님의 회원가입 정보입니다</font>
										</div>
										<img src="images/registerCheck/dot.jpg" width="100%" height="1" style="margin-top:19px">
										<table width="100%" border="0" style="margin-top:10px">
											<tr height="33">
												<td width="100"><font style="font-size:15px; font-weight:bold; color:#616161">이름</font></td>
												<td><font style="font-size:15px; color:#616161">${mdto.getName()}</font></td>
											</tr>
											<tr height="33">
												<td width="100"><font style="font-size:15px; font-weight:bold; color:#616161">휴대전화</font></td>
												<td><font style="font-size:15px; color:#616161">${mdto.getPhone()}</font></td>
											</tr>
											<tr height="33">
												<td width="100"><font style="font-size:15px; font-weight:bold; color:#616161">이메일</font></td>
												<td><font style="font-size:15px; color:#616161">${mdto.getEmail()}</font></td>
											</tr>
											<tr height="33">
												<td width="100"><font style="font-size:15px; font-weight:bold; color:#616161">생일</font></td>
												<td><font style="font-size:15px; color:#616161">${mdto.getBirth()}</font></td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input id="registerNext" name="registerNext" type="button" value="로그인하기" style="margin-top:85px; margin-bottom:80px; width:240px; height:75px; background-color:#d55454; border:0; font-size:22px; color:#ffffff; cursor:pointer">
		</div>
	</div>
	<jsp:include page="copyRight.jsp" />
</div>
<c:if test="${sessionScope.idKey!=null}">
	<script>location.href="main.do"</script>
</c:if>
</body>
</html>