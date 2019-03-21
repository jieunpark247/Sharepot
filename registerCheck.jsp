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
<script src="js/menuAnimate.js"></script>
</head>
<body style="font-family:'나눔고딕'">
<!-- 회원가입 내용 -->
<form id="checkForm" method="post" action="register.do"><input type="hidden" name="step" value="step1">
	<div id="container" class="div container" align="center">
		<div class="divWid">
			<!-- 회원가입 이미지 -->
			<table class="table_basic" width="800" height="133" cellpadding="0" cellspacing="0" style="margin-top:0px; background-image:url('images/background_wood.png'); background-size:862px; background-repeat:no-repeat">
				<tr>
					<td align="right" valign="top" width="128"><div class="div" style="margin-top:15px" align="center"><font style="font-size:40px; font:'play'; font-weight:bold; color:#d3d3d3">step1</font></div></td>
					<td align="center">
						<div class="div" style="margin-top:0px"><font style="font-size:25px; color:#323232; font-weight:bold">회원가입</font></div>
						<div class="div" style="width:100%;margin-top:5px; margin-bottom:5px"><font style="font-size:12px; color:#949494">회원가입 하시면 알뜰 쇼핑 정보와 다양한 혜택을<br>편리하게 이용하실수 있습니다.</font></div>
					</td>
					<td width="128"></td>
				</tr>
			</table>
			<!-- 약관 모두 동의 -->
			<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:25px">
				<tr height="40">
					<td align="right"><font style="font-size:15px">모두 동의 </font></td>
					<td width="5"></td>
					<td width="171"><input type="checkbox" style="width:22px; height:22px" id="check0"></td>
				</tr>
			</table>
			<div style="width:600px; height:1px; margin-top:1px; background-color:#acacac"></div>
			<!-- 약관 동의1 -->
			<div style="width:800px; margin-top:30px" align="center">
				<a name="check1" id="check1"></a>
			</div>
			<font style="font-size:22px; color:#414141; font-weight:bold">* 회원약관 (필수) *</font>
			<div style="width:800px; margin-top:5px">
				<textarea style="width:500px; height:150px; resize:none; overflow-x:hidden" readonly>
<jsp:include page="regiCheckTxt/regiTxt1.jsp" />
				</textarea>
			</div>
			<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:10px">
				<tr height="22">
					<td align="right"><font style="font-size:15px">동의 </font></td>
					<td width="3"></td>
					<td width="171"><input type="checkbox" name="checkbox" id="checkbox" class="checkedAll" style="width:22px; height:22px"></td>
				</tr>
			</table>
			<div id="regiCheck1" class="error" style="margin-bottom:30px; display:none">
				<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:3px">
					<tr>
						<td width="" align="right"><a style="color:red; font-size:17px">회원약관에 동의해주세요</a></td>
						<td width="144"></td>
					</tr>
				</table>
			</div>
			
			<!-- 약관 동의2 -->
			
			<div style="width:800px; margin-top:15px" align="center">
				<a name="check2" id="check2"></a>
				<font style="font-size:22px; color:#414141; font-weight:bold">* 개인정보수집 (필수) *</font>
				<input type="hidden" name="checkForm2" id="checkForm2" value="true">	
				<div style="width:800px; margin-top:5px">
					<textarea style="width:500px; height:150px; resize:none; overflow-x:hidden" readonly>
<jsp:include page="regiCheckTxt/regiTxt2.jsp" />
					</textarea>
				</div>
				<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:10px">
					<tr height="22">
						<td align="right"><font style="font-size:15px">동의 </font></td>
						<td width="3"></td>
						<td width="171"><input type="checkbox" name="checkbox" id="checkbox" class="checkedAll" style="width:22px; height:22px"></td>
					</tr>
				</table>
				<div id="regiCheck2" style="margin-bottom:30px; display:none">
					<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:3px">
						<tr>
							<td width="" align="right"><a style="color:red; font-size:17px">개인정보수집에 동의해주세요</a></td>
							<td width="144"></td>
						</tr>
					</table>
				</div>
			</div>
			
			<!-- 약관 동의3 -->
			<div style="width:800px; margin-top:15px" align="center">
				<a name="check3" id="check3"></a>
				<font style="font-size:22px; color:#414141; font-weight:bold">* 개인정보 취급위탁 (필수) *</font>
				<div style="width:800px; margin-top:5px">
					<textarea style="width:500px; height:150px; resize:none; overflow-x:hidden" readonly>
<jsp:include page="regiCheckTxt/regiTxt3.jsp" />
					</textarea>
				</div>
				<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:10px">
					<tr height="40">
						<td align="right"><font style="font-size:15px">동의 </font></td>
						<td width="3"></td>
						<td width="171"><input type="checkbox" name="checkbox" id="checkbox" class="checkedAll" style="width:22px; height:22px"></td>
					</tr>
				</table>
				<div id="regiCheck3" style="margin-bottom:30px; display:none">
					<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:3px">
						<tr>
							<td width="" align="right"><a style="color:red; font-size:17px">개인정보 취급위탁에 동의해주세요</a></td>
							<td width="144"></td>
						</tr>
					</table>
				</div>
			</div>
			
			<!-- 약관 동의4 -->
			<div style="width:800px; margin-top:15px" align="center">
				<a name="check4" id="check4"></a><font style="font-size:22px; color:#414141; font-weight:bold">* 쉐어팟 쇼핑몰 이용약관 (필수) *</font>
				<div style="width:800px; margin-top:5px">
					<textarea style="width:500px; height:150px; resize:none; overflow-x:hidden" readonly>
<jsp:include page="regiCheckTxt/regiTxt4.jsp" />
					</textarea>
				</div>
				<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:10px">
					<tr height="40">
						<td align="right"><font style="font-size:15px">동의 </font></td>
						<td width="3"></td>
						<td width="171"><input type="checkbox" name="checkbox" id="checkbox" class="checkedAll" style="width:22px; height:22px"></td>
					</tr>
				</table>
					
			</div>
			<div id="regiCheck4" style="margin-bottom:30px; display:none">
				<table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:3px">
					<tr>
						<td width="681" align="right"><a style="color:red; font-size:17px">도래도담 쇼핑몰 이용약관에 동의해주세요</a></td>
						<td width="144"></td>
					</tr>
				</table>
			</div>
		</div>
				
		<!-- 버튼 -->
		<table class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:40px; margin-bottom:80px">
			<tr>
				<td align="right"><input id="registerBnt" name="registerBnt" type="button" value="다음 단계로" style="width:240px; height:75px; background-color:#d55454; border:0; font-size:24px; color:#ffffff; cursor:pointer"></td>
				<td width="20"></td>
				<td align="left"><input onclick="javascript:history.back()" type="button" value="취소" style="width:240px; height:75px; background-color:#ababab; border:0; font-size:24px; color:#ffffff; cursor:pointer"></td>
			</tr>
		</table>
	</div>
</form>

<c:if test="${sessionScope.idKey!=null}">
	<script>location.href="main.do"</script>
</c:if>
<jsp:include page="copyRight.jsp" />
</body>
</html>