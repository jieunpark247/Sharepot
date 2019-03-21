<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page import="manager.NoticeDTO"%>
<%@ page import="manager.NoticeDAO"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>SharePot</title>
<link rel="stylesheet" href="css/details.css" />
<!-- Bootstrap -->
<link href="/Sharepot/managerPage/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--side menu plugin-->
<link href="/Sharepot/managerPage/plugins/hoe-nav/hoe.css" rel="stylesheet">
<!-- icons-->
<link href="/Sharepot/managerPage/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="/Sharepot/managerPage/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- dataTables -->
<link href="/Sharepot/managerPage/plugins/datatables/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">
<link href="/Sharepot/managerPage/plugins/datatables/responsive.bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!--template custom css file-->
<link href="/Sharepot/managerPage/css/style.css" rel="stylesheet">

<script src="/Sharepot/managerPage/js/modernizr.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<jsp:include page="managerMenu.jsp"></jsp:include>
<!-- 상단메뉴바 -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<body hoe-navigation-type="vertical" hoe-nav-placement="left"
	theme-layout="wide-layout">

	<!--side navigation start-->
	<div id="hoeapp-wrapper" class="hoe-hide-lpanel"
		hoe-device-type="desktop">

		<div id="hoeapp-container" hoe-color-type="lpanel-bg7"
			hoe-lpanel-effect="shrink">


<title>공지사항 글쓰기</title>
<link rel="stylesheet" href="css/details.css" />
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script src="js/login_Check.js"></script>
<title>공지사항 글쓰기</title>

<style>
.contents {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>


</head>
<body style="font-family:'나눔고딕'" onload="$('#log_user_id').focus()">

<div class="div" style="background-color:#0c7733; width:100%; height:6px; border:1px #000000 solid"></div>
<%-- 네비바 끝 --%>

<!-- 로그인 내용 -->
<div id="container" class="div container" align="center">
   <div class="divWid">
      <form action="/Sharepot/managerPage/MngNoticeUpdateAction.do" method="post"> 
      
         <!-- 로그인 내용 -->
         <div style="margin-top:50px">
         
            <font style="font-size:22px; color:#414141; font-weight:bold">공지사항 수정</font><br><div style="margin-bottom:2px"></div>
            
            <br>
            <br>
             
            <input name="notice_no" readonly="readonly" type="text"  type="hidden" value=${noticelist.notice_no } />
            
            <div class="contents">
               <p>
               <p>제목 수정 :</p> <input type="text" name=title size="100" maxlength="500" value='${noticelist.title }' id="log_user_id" style="width: 70%; height: 40px; border:1px solid #CCC; font-family:'나눔고딕'; font-size:18px; text-align:center">
               </p>   
               
               <p>
               <p>내용 수정: </p> <textarea name="content" style="width: 70%; height: 70px;font-family:'나눔고딕'; font-size:18px; border:1px solid #CCC; text-align:normal;">
                        ${noticelist.content }
                  </textarea>
               </p>
      
            </div>
      
            <input id="loginBtn" name="loginBtn" type="submit" value="수정" style="width:30%; height:45px; background-color:#6bb546; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
            <input id="loginBtn" name="loginBtn" type="reset"  value="초기화" style="width:30%; height:45px; background-color:#ff3300; border:0; boder-radius:0; font-size:24px; color:#ffffff; font-family:'나눔고딕'; cursor:pointer">
         </div>
      </form> 
   </div>
</div>


</body>
</html>
