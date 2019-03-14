<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% String user_id = request.getParameter("user_id");
    request.setAttribute("user_id", user_id);
    %>
<script>
	$(function(){
		$('#dropMember').click(function(){
			var checkPw = $('#dropPw').val();
			if(checkPw==""){
				document.getElementById('msgAboutDrop').style.color="red";
				document.getElementById('msgAboutDrop').innerHTML="비밀번호를 입력해주세요";
			}else{
				var formData = $('form[name=dropForm]').serialize();
				$.ajax({
					type:"POST",
					dataType:"json",
					data:formData,
					url:"memberDrop.do",
					success:function(data){
						if(data.check=="no"){
							document.getElementById('msgAboutDrop').style.color="red";
							document.getElementById('msgAboutDrop').innerHTML="비밀번호가 일치하지 않습니다.";
						}else{
							$('#dropForm').submit();
						}
					},
					error:function(){
						alert("error!")
					}
					
				})
				
			}
		});
	})
</script>
<br>
<br>
<br>
<form id="dropForm" name="dropForm" action="memberDropComplete.do" method="post">

   <font style="font-size:22px; color:#414141; font-weight:bold; color: #6bb546">* 탈퇴 안내*</font><br><div style="margin-bottom:2px"></div>
   <font style="font-size:14px; color:#acacac">회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
   <br>
   <br> * 탈퇴 후 회원정보 및 대여 서비스 이용 기록은 모두 삭제 됩니다.
   <br> * 탈퇴 후에도 게시판형 서비스에 등록한 게시물을 그대로 남아 있습니다.
   
   <br>
   <br> <b>안내 사항을 모두 확인하였으며, 이에 동의한다면, <br>
   	안전한 사용을 위해 비밀번호를 다시 한 번 입력해주세요.
   </b>
   </font>
   <table class="table_basic" width="500" cellpadding="0" cellspacing="0" style="margin-top:15px; border:1px #acacac solid">
      <!-- 아이디 -->
      <tr height="60">
         <td align="center">
            <input type="text" class="regiPrimeInput" name="user_id" id="user_id" value="${user_id }"
             id="dropId" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px;
              height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center"
              readonly="readonly">
         </td>
      </tr>
      <tr height="1">
				<td align="center"><img src="images/registerCheck/dot.jpg" width="440" height="1"></td>
	</tr>
      <!-- 비밀번호 -->
      <tr height="60">
         <td align="center">
            <input type="password" class="regiPrimeInput" placeholder="비밀번호" name="user_pw" id="user_pw" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center">
            <div id="msgAboutDrop">
            </div>
         </td>
      </tr>
   </table>
   <table class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:60px; margin-bottom:80px">
      <tr>
         <td align="center"><input id="dropMember" name="dropMember" type="button" value="확인" style="width:180px; height:70px; background-color:#6bb546; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"></td>
         <td width="20"></td>
      </tr>
   </table>
   
</form>