<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <script>
    	$(function(){
    		$('#chEmail').click(function(){
    			var emailId = $('#changeEmailId').val();
    			var emailAdd = $('#changeEmailAdd').val();
    			if(emailId=="" || emailId==null){
    				document.getElementById('checkEmail').style.color="blue";
    				document.getElementById('checkEmail').innerHTML="이메일을 입력해주세요";
    			}
    		});
    		
    	});
    </script>
    <table style="background-color: #f6f6f6">
   <!-- 비밀번호 -->
			<tr height="60">
				<td align="center">
					<input type="password" class="regiPrimeInput" placeholder="현재 비밀번호" name="user_pass" id="user_pass" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center">
					<div id="passMsg" class="error" style="display:none; margin-bottom:7px">
						<a name="check_pass" style="font-size:13px; color:red">현재 비밀번호를 입력하세요</a>
					</div>
				</td>
			</tr>
			<tr height="1">
				<td align="center"><img src="images/registerCheck/dot.jpg" width="440" height="1"></td>
			<tr>
			<!-- 비밀번호 재확인 -->
			<tr height="60">
				<td align="center">
					<input type="password" class="regiPrimeInput" placeholder="신규 비밀번호" name="user_repass" id="user_repass" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center">
					<div id="repassMsg" class="error" style="display:none; margin-bottom:7px">
						<a name="check_chpass" style="font-size:13px; color:red">변경할 비밀번호를 입력하세요</a>
					</div>
				</td>
			</tr>
			<tr height="1">
				<td align="center"><img src="images/registerCheck/dot.jpg" width="440" height="1"></td>
			<tr>
			<tr height="60">
				<td align="center">
					<input type="password" class="regiPrimeInput" placeholder="비밀번호 확인" name="user_repass2" id="user_repass2" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center">
					<div id="repassMsg2" class="error" style="display:none; margin-bottom:7px">
						<a name="check_chpass2" style="font-size:13px; color:red">새  비밀번호를 한번 더 입력하세요</a>
					</div>
				</td>
			</tr>
    </table>
    <div id="checkEmail">
    	
    </div>