<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="aboveMenu.jsp"></jsp:include> <!-- 상단메뉴바 -->
<jsp:include page="floatingBanner.jsp"></jsp:include> <!-- 플로팅배너 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="css/details.css" />
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/mypage.js"></script>
<script>
$(function(){
   $('#pwCheck_btn').click(function(){
      var check_pw = $("#user_pass").val();
      
      if(check_pw=="" || check_pw==null){
         document.getElementById('testtest').style.color="red";
         document.getElementById('testtest').innerHTML="비밀번호를 입력하세요.";
      }else{
    	  var user_pass = $("#user_pass").val();
           $.ajax({
            type:"POST",
            dataType:"json",
            data:{"user_pass" : check_pw},
            url:'mypagePwCheck.do',
            
            success:function(data,status){
            	if(data.check=="no"){
            		document.getElementById('testtest').style.color="red";
                    document.getElementById('testtest').innerHTML="패스워드가 일치하지 않습니다.";
            	}else{
            		$('#pwCheck').submit();
            	}
            },
            error: function(){
            	alert("error!");
            }
         
         });
         
      }
      
   })
})
</script>
</head>
<body style="font-family: '나눔고딕'" onload="$('#log_user_id').focus()">

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
      </div>
      
         <br>
   <br>
   <br>
   <form id="pwCheck" method="post" action="mypagePwCheckComplete.do">
   

   <font style="font-size:22px; color:#414141; font-weight:bold; color: #6bb546">* 비밀번호 재확인*</font><br><div style="margin-bottom:2px"></div>
   <font style="font-size:14px; color:#acacac">본인 확인을 위해 한번 더 비밀번호를 입력해 주세요.<br> 비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</font>
   <table class="table_basic" width="500" cellpadding="0" cellspacing="0" style="margin-top:15px; border:1px #acacac solid">
      <!-- 아이디 -->
      <tr height="60">
         <td align="center">
            <input type="text" class="regiPrimeInput" name="user_id" value="${requestScope.member_id }"
             id="user_id" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px;
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
            <input type="password" class="regiPrimeInput" placeholder="비밀번호" name="user_pass" id="user_pass" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center">
         </td>
         
      </tr>
      
   </table>
   <br>
   <div  id="testtest" align="center"></div>
   <table class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:60px; margin-bottom:80px">
      <tr>
         <td align="center"><input id="pwCheck_btn" name="registerNext" type="button" value="확인" style="width:240px; height:75px; background-color:#6bb546; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer"></td>
      </tr>
   </table>
   </form>
      <jsp:include page="copyRight.jsp"></jsp:include>
   </div>
</body>
</html>



