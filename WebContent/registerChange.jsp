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
<title>회원정보수정</title>
<link rel="stylesheet" href="css/details.css" />
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script src="js/regi_Check.js"></script>
<script src="js/regi_IdOverlap.js"></script>
<script type="text/javascript">
	function zipErr() {
		//alert('우편번호DB가 일부 존재하기 때문에 서울 지역에 한하여 검색해주세요. ex)논현, 압구정, 대치')
	}
	$(function(){
		$('#editName').click(function(){
			$.ajax({
				type:"POST",
				url:"editName.jsp",
				success:function(data){
					$('#howtoName').html(data);
				}
			});
			
		});
		$('#editEmail').click(function(){
			$.ajax({
				type:"POST",
				url:"editEmail.jsp",
				success:function(data){
					$('#howtoEmail').html(data);
				}
				
			});
			
		});
		
		$('#editPhone').click(function(){
			$.ajax({
				type:"POST",
				url:"edtPhone.jsp",
				success:function(data){
					$('#howtoPhone').html(data);
				}
				
			});
			
		});
		
	})
	function checkPwd(){
		var pw1 = $('#newPw').val();
		var pw2 = $('#newPw2').val();
		if(pw1 != pw2){
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요";
		}else{
			document.getElementById('checkPwd').style.color = "blue";
			document.getElementById('checkPwd').innerHTML = "암호가 확인되었습니다.";
		}
	}
	
	$(function(){
		$('#chPw').click(function(){
			var nowPw = $('#nowPw').val();
			if(nowPw == "" || nowPw==null){
				document.getElementById('checkPwd').style.color="red";
				document.getElementById('checkPwd').innerHTML="패스워드를 입력하세요";
				
			}else if($('#newPw').val() != $('#newPw2').val()){
				
			}else{
				var nowPw = $('#nowPw').val();
				var newPw = $('#newPw').val();
				$.ajax({
					type:"POST",
					dataType:"json",
					data: {"pw" : nowPw, "newPw":newPw},
					url: "editPw.do",
					success : function(data){
						if(data.check =="no"){
							document.getElementById('checkPwd').style.color="red";
							document.getElementById('checkPwd').innerHTML="패스워드가 일치하지 않습니다";
						}else{
							/* document.getElementById('changeMessage').innerHTML="<b>비밀번호가 변경되었습니다</b>";
							document.getElementById('changeMessage').style.color="blue"; */
							$('#editForm').submit();
							
							/* $('#nowPw').val('');
							$('#newPw').val('');
							$('#newPw2').val(''); */
							
							/* $('body').scrollTop(0); */
						}
					},
					error: function(){
						alert("error!")
					}
				})
			}
		})
	})
</script>
</head>
<body style="font-family:'나눔고딕'" onload="$('#user_id').focus()">

<form id="editForm" method="post" action="editComplete.do">


<!-- 아이디찾기 내용 -->
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
										style="font-size: 14px; color: #000000">관심 물품 조회</font>
								</a>  
								<a class= "myList" id="mypageQna" style="margin-left: 20px" href="mypage.do?tab=QNA"> <font
										style="font-size: 14px; color: #000000">1:1문의</font>
								</a> 
								<a class= "myList" id="mypgeEdit" style="margin-left: 20px" href="mypage.do?tab=EDIT"> <font
										style="font-size: 14px; color: #0e7534">회원정보 수정</font>
								</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
		</table>
		
		<!-- 회원정보 -->
		<div style="margin-top:41px"></div>
		<a id="check"></a>
		<font style="font-size:22px; color:#414141; font-weight:bold">*회원 정보*</font><br><div style="margin-bottom:2px"></div>
		<font style="font-size:14px; color:#acacac">변경할 회원 정보를 수정해주세요</font>
		<div id="changeMessage">
			<c:if test="${!(empty requestScope.pwChange) }">
				<br>
				<font color="blue"><b>비밀번호가 변경되었습니다</b></font>
			</c:if>
		</div>
		<table class="table_basic" width="550" cellpadding="0" cellspacing="0" style="margin-top:15px; border:1px #acacac solid">
			<tr height="60">
				<th align="center"  width="200px" style="background-color:#6bb546; color:#ffffff">
				회원 아이디(사번)
				</th>
				<td align="center" colspan="2">
				${mem.member_id }
 				</td>
			</tr>
			<tr height="1">
				<td align="center" colspan=3><img src="images/registerCheck/dot.jpg" width="700" height="1"></td>
			</tr>
			<!-- 이름 -->
			<tr height="60">
				<th align="center" style="background-color:#6bb546; font-weight:bold ; color:#ffffff">
				이름
				
				</th>
				<td align="center">
					<input type="text" readonly style="outline:0; margin-top:5px; margin-bottom:3px; width:250px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center" value="${mem.name }">
				</td>
				<td>
				<input type="button" value="이름 수정"  id="editName" style="width:70px; height:25px; background-color:#ababab; border:0; border-radius:2px; font-size:12px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"/>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
				<div id="howtoName">
					
				</div>
				</td>
			</tr>
			<tr height="1">
				<td align="center" colspan=3><img src="images/registerCheck/dot.jpg" width="700" height="1"></td>
			</tr>
			
			
			<!-- 비밀번호  -->
			<tr height="100">
				<th align="center" style="background-color:#6bb546; color:#ffffff">
				비밀번호 변경
				</th>
				<td colspan="3" align="center" >
				 	
				 <br><br>	
				 	<font style="font-size:14px; color:#acacac">
				! 비밀번호는 영문, 숫자, 특수 문자 3가지 모두를 조합하실 경우 <br>
				    더욱 강력한 패스워드 구현이 가능합니다.
				</font>
				    
				    
				    <table width="450" height="200">
				    <tr height="40">
				    	<td width="80">현재 비밀번호</td>
						<td width="300">
						<input type="password" name="nowPw" id="nowPw">
						</td>
					</tr>
					<tr height="40">
						<td>신규 비밀번호</td>
						<td>
								<input type="password" name="newPw" id="newPw">
						</td>
					</tr>
					<tr height="40">
						<td>비밀번호 다시 입력</td>
						<td>
						<input type="password" name="newPw2" id="newPw2" onkeyup="checkPwd()">
						<div id="checkPwd">동일한 암호를 입력하세요</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="button" id="chPw" value="비밀번호 변경" style="width:90px; height:25px; background-color:#ababab; border:0; border-radius:2px; font-size:12px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
							<br>
						</td>
					</tr>
				    </table>
				</td>
			</tr>
			
			
		</table>
		<br><br>
		
		<table class="table_basic" width="700" cellpadding="0" cellspacing="0" style="margin-top:22px; border:1px #acacac solid">
			<!-- 이메일 -->
			<tr height="60" >
				<th align="center" width="200px" style="background-color:#6bb546; color:#ffffff">
				email
				</th>
				<td align="center" width="400">
					<input type="text" name="user_email" id="user_email" style="outline:0; margin-top:5px; margin-bottom:3px; width:150px; height:26px; font-family:'나눔고딕'; background-color:#ffffff; font-size:18px; border:0px; text-align:center" readonly value="${mem.email }">
				</td>
				<td width=100>
					<input type="button" value="이메일 수정"  id="editEmail" style="width:80px; height:25px; background-color:#ababab; border:0; border-radius:2px; font-size:12px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"/>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
				<div id="howtoEmail">
					
				</div>
				</td>
			</tr>
			<tr height="1">
				<td align="center" colspan="3"><img src="images/registerCheck/dot.jpg" width="700" height="1"></td>
			</tr>
			
			
			<!-- 생년월일 -->
			<tr height="60" >
				<th align="center" style="background-color:#6bb546; color:#ffffff">
				생년월일
				</th>
				<td align="center">
					<input type="text" name="user_birth" id="user_birth" style="outline:0; margin-top:5px; margin-bottom:3px; background-color:#ffffff; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center" readonly value="${mem.birth_date }">
				</td>
			</tr>
			<tr height="1">
				<td align="center" colspan="3"><img src="images/registerCheck/dot.jpg" width="700" height="1"></td>
			<tr>
			
			
			<!-- 휴대전화번호 -->
			<tr height="60">
				<th align="center" style="background-color:#6bb546; color:#ffffff">
				휴대전화
				</th>
				<td align="center">
					<input type="text" style="outline:0; margin-top:5px; margin-bottom:3px; width:80px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center; background-color:#ffffff" value="010" readonly disabled>-
					<input type="text" name="user_phone1" id="user_phone1" style="outline:0; margin-top:5px; margin-bottom:3px; width:100px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center" size="4"  readonly value="${phone1 }"> -
					<input type="text" name="user_phone2" id="user_phone2" style="outline:0; margin-top:5px; margin-bottom:3px; width:80px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center" readonly value="${phone2 }">
				</td>
				<td width=100>
					<input type="button" value="전화번호 수정"  id="editPhone" style="width:90px; height:25px; background-color:#ababab; border:0; border-radius:2px; font-size:12px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"/>
				</td>
			</tr>			
			<tr>
				<td colspan="3" align="center">
				<div id="howtoPhone">
					
				</div>
				</td>
			</tr>
			
			<!-- <tr height="60">
				<th align="center">
				상세주소
				</th>
				<td align="center">
					<input type="text" name="user_addr2" id="user_addr2" style="outline:0; margin-top:5px; margin-bottom:3px; width:300px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center">
				</td>
			</tr> -->
		</table>
		
		<!-- 버튼 -->
		<table class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:60px; margin-bottom:80px">
			<tr>
				<!-- <td align="right"><input id="registerNext" name="registerNext" type="button" value="수정" style="width:100px; height:60px; background-color:#6bb546; border:0; boder-radius:0; font-size:20px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"></td>
				<td width="20"></td> -->
				<td align="center"><input id="user_drop" name="user_drop" type="button" value="탈퇴하기" style="width:100px; height:60px; background-color:#ad1a01; border:0; boder-radius:0; font-size:20px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"></td>
				<td width="20"></td>
				<td align="left"><input onclick="javascript:history.back()" type="button" value="이전으로" style="width:100px; height:60px; background-color:#ababab; border:0; boder-radius:0; font-size:20px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"></td>
			</tr>
		</table>
	 </div>
	
      <jsp:include page="copyRight.jsp"></jsp:include>
</div>
<c:if test="${sessionScope.idKey!=null}">
	<script>location.href="main.do"</script>
</c:if>
</form>
</body>
</html>