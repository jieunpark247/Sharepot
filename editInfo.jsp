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
<script src="js/menuAnimate.js"></script>
<script type="text/javascript">
	$(function(){
		$('#edit_pw').click(function(){
			var col = document.getElementById('edit_pw').style.color;
			if(col=="red"){
				document.getElementById('edit_pw').style.color="black";
				$('#howtoPw').html("");
			}else{
				$.ajax({
					type:"POST",
					url:"editPw.jsp",
					success:function(data){
						$('#howtoPw').html(data);
						document.getElementById('edit_pw').style.color="red";
					},
					error:function(){
						alert("error")
					}
				});
			}
		});
		$('#user_drop').click(function(){
			var user_id = $('#mem_id').val();
			$.ajax({
				type:"POST",
				data:{"user_id" : user_id},
				url:"dropMember.jsp",
				success:function(data){
					$('#miniContainer').html(data);
				},
				error:function(){
					alert("error!");
				}
			});
		});
		
		$('#user_edit').click(function(){
			var user_id = $('#mem_id').val();
			var user_pass = $('#user_pass').val();
			var user_name = $('#user_name').val();
			var user_repass = $('#user_repass').val();
			var user_repass2 = $('#user_repass2').val();
			var user_phone1 = $('#user_phone1').val();
			var user_phone2 = $('#user_phone2').val();
			var email = $('#user_email').val();
			
			var col = document.getElementById('edit_pw').style.color; //비밀번호 수정 활성화 여부
			
			if(user_pass==""){
				$('body').scrollTop(0);
				document.getElementById('checkMessage').style.color="red";
				document.getElementById('checkMessage').innerHTML="현재 비밀번호를 입력해주세요";
			}else if(user_repass==""){
				$('body').scrollTop(0)
				document.getElementById('checkMessage').style.color="red";
				document.getElementById('checkMessage').innerHTML="새로운 비밀번호를 입력해주세요";
			}else if(user_repass2==""){
				$('body').scrollTop(0)
				document.getElementById('checkMessage').style.color="red";
				document.getElementById('checkMessage').innerHTML="새로운 비밀번호를 한번 더입력해주세요";
			}else if(user_name == ""){
				$('body').scrollTop(0)
				document.getElementById('checkMessage').style.color="red";
				document.getElementById('checkMessage').innerHTML="수정할 이름을 입력해주세요";
			}else if(user_phone1=="" || user_phone2==""){
				$('body').scrollTop(0)
				document.getElementById('checkMessage').style.color="red";
				document.getElementById('checkMessage').innerHTML="변경할 휴대번호를 입력해주세요";
			}else if(email==""){
				$('body').scrollTop(0)
				document.getElementById('checkMessage').style.color="red";
				document.getElementById('checkMessage').innerHTML="변경할 이메일 주소를 입력해주세요";
			}else if(user_repass != user_repass2){
				$('body').scrollTop(0)
				document.getElementById('checkMessage').style.color="red";
				document.getElementById('checkMessage').innerHTML="새로운 비밀번호가 일치하지 않습니다.";
			}else{
				var formData = $('form[name=editForm]').serialize();
				$.ajax({
					type:"POST",
					dataType:"json",
					data: formData,
					url:"edit.do",
					success: function(data){
						if(data.check == "no"){
							$('body').scrollTop(0)
							document.getElementById('checkMessage').style.color="red";
							document.getElementById('checkMessage').innerHTML="패스워드가 일치하지 않습니다";
							
						}else{
							$('#editForm').submit();
						}
					},
					error:function(){
						alert("error!");
					}
					
				});
			}
			
			
		});
		
	});
</script>
</head>
<body style="font-family:'나눔고딕'">


<form id="editForm" name="editForm" method="post" action="editComplete.do">
<input type="hidden" value="step2" name="step" />

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
										style="font-size: 14px; color: #d55454">회원정보 수정</font>
								</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
		</table>
		
		<!-- 회원가입 내용 -->
		<!-- 필수입력 -->
		<div id="miniContainer">
		<a id="check"></a>
		<br><br>
		<font style="font-size:22px; color:#d55454; font-weight:bold">* 정보 수정 *</font><br><div style="margin-bottom:2px"></div>
		<font style="font-size:14px; color:#acacac">변경할 정보를 클릭해주세요</font>
		<div id="checkMessage">

		</div>
		<table class="table_basic" width="500" cellpadding="0" cellspacing="0" style="margin-top:15px; border:1px #acacac solid">
			<!-- 아이디 -->
			<tr height="60">
				<td align="center">
					<input type="text" class="regiPrimeInput" name="mem_id" id="mem_id" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center" value="${mem.member_id }" readonly>
					<div id="idMsg" class="error" style="display:none; margin-bottom:7px">
						<a name="check_id" id="check_id" style="font-size:13px; color:red"></a>
					</div>
				</td>
			</tr>
			<tr height="1">
				<td align="center"><img src="images/registerCheck/dot.jpg" width="440" height="1"></td>
			<tr>
			<!-- 비밀번호 -->
			<tr height="60">
				<td align="center">
					<input type="text" class="regiPrimeInput" value="비밀번호 수정" name="edit_pw" id="edit_pw" style="outline:0; cursor:pointer;margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center" readonly>
				</td>
			</tr>
			<tr height="1">
				<td align="center"><img src="images/registerCheck/dot.jpg" width="440" height="1"></td>
			<tr>
			
			<tr>
				<td>
					<div id="howtoPw"></div>
				</td>
			</tr>
			
		</table>
		<table class="table_basic" width="500" cellpadding="0" cellspacing="0" style="margin-top:22px; border:1px #acacac solid">
			<!-- 이름 -->
			<tr height="60">
				<td align="center">
					<input type="text" placeholder="이름" name="user_name" id="user_name" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center; cursor:pointer" value="${mem.name }">
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
					<input type="text" placeholder="휴대전화" name="user_phone1" id="user_phone1" style="outline:0; margin-top:5px; margin-bottom:3px; width:100px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center; cursor:pointer" size="4" value="${phone1 }"> -
					<input type="text" name="user_phone2" id="user_phone2" style="outline:0; margin-top:5px; margin-bottom:3px; width:80px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center; cursor:pointer" value="${phone2 }">
					<div id="phoneMsg" class="error" style="display:none; margin-bottom:7px">
						<a name="check_phone" style="font-size:13px; color:red">휴대전화를 입력하세요</a>
					</div>
				</td>
			</tr>
		</table>
		<table class="table_basic" width="500" cellpadding="0" cellspacing="0" style="margin-top:22px; border:1px #acacac solid">
			
			<!-- 이메일-->
			<tr height="60">
				<td align="center">
					<input type="text" placeholder="이메일" name="user_email" id="user_email" style="outline:0; margin-top:5px; margin-bottom:3px; background-color:#ffffff; cursor:pointer; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center"  value="${mem.email }">
				</td>
			</tr>
			<tr height="1">
				<td align="center"><img src="images/registerCheck/dot.jpg" width="440" height="1"></td>
			<tr>
			<!-- 생년월일 -->
			<tr height="60">
				<td align="center">
					<input type="text" placeholder="생년월일" name="user_birth" id="user_birth" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center" readonly value="${mem.birth_date }">
				</td>
			</tr>
		</table>
		
		<!-- 버튼 -->
		<table class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:60px; margin-bottom:80px">
			<tr>
				<td align="right"><input id="user_edit" name="user_edit" type="button" value="수정" style="width:100px; height:60px; background-color:#6bb546; border:0; boder-radius:0; font-size:20px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"></td>
				<td width="20"></td>
				<td align="center"><input id="user_drop" name="user_drop" type="button" value="탈퇴하기" style="width:100px; height:60px; background-color:#ad1a01; border:0; boder-radius:0; font-size:20px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"></td>
				<td width="20"></td>
				<td align="left"><input onclick="javascript:history.back()" type="button" value="이전으로" style="width:100px; height:60px; background-color:#ababab; border:0; boder-radius:0; font-size:20px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"></td>
			</tr>
		</table>
		</div>
	</div>
	
      <jsp:include page="copyRight.jsp"></jsp:include>
</div>

</form>
</body>
</html>