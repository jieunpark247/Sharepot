<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%@ page import="manager.QnADAO"%>
<%@ page import="manager.QnADTO"%>
<%@ page import="manager.QnACommentDTO"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>SharePot</title>
    <!-- Bootstrap -->
        <link href="./plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--side menu plugin-->
        <link href="./plugins/hoe-nav/hoe.css" rel="stylesheet">
        <!-- icons-->
        <link href="./plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="./plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- dataTables -->
        <link href="./plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
          <link href="./plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
        <!--template custom css file-->
        <link href="./css/style.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.12.1.js"></script> 
        <script src="./js/modernizr.js"></script>
        <jsp:include page="managerMenu.jsp"></jsp:include> <!-- 상단메뉴바 -->
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        
        <![endif]-->
  
        
    </head>
<body style="font-family:'나눔고딕'" onload="$('#log_user_id').focus()">



<!-- 네비바 시작 -->
<div class="div container" align="center">
   <div class="divWid">
      <c:if test="${sessionScope.idKey==null}">
   
         <!-- 위에 로그인&검색창 끝!!!! -->
      </c:if>
      <c:if test="${sessionScope.idKey!=null}">
         <!-- 로그인한 상태일 때 위에 로그인&검색창 -->
         <div class="div sub_toplogin loginBar">
            <table class="table_basic" width="800" cellpadding="0" cellspacing="0" style="margin-top:-1px">
         
               <tr>
                  <td width="490" valign="top">
                     <div class="div" style="margin-top:2px; margin-left:35px; width:414px" align="center">
                        <a class="mainMenu" id="menu1" title="스토어" onclick="$('#GNB').css('display','block')" onmouseover="$('#GNB').css('display','block')" style="cursor:pointer"><font style="font-size:18px">스토어</font></a>
                        <input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:54px" readonly>
                        <a class="mainMenu" id="menu2" href="magazine.do" title="매거진"><font style="font-size:18px">매거진</font></a>
                        <input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:54px" readonly>
                        <a class="mainMenu" id="menu3" href="story.do" title="스토리"><font style="font-size:18px">스토리</font></a>
                        <input type="text" size="2" value="l" style="text-align:center; border:0px; font-size:14px; color:#646464; width:54px" readonly>
                        <a class="mainMenu" id="menu4" href="customer.do" title="고객센터"><font style="font-size:18px">고객센터</font></a>
                     </div>
                  </td>
                  <!-- 로그인 메뉴 -->
                  <td width="245" valign="top" style="background:url('images/main/searchbar2.png'); background-size:100%; height:38px; background-repeat:no-repeat">
                     <form name="storeForm1" method="post" action="store.do">
                        <table width="245" class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:0px" align="right">
                           <tr height="38">
                              <td width="210" align="right" style="vertical-align:top">
                                 <input type="text" value="${search1}" name="searchStr1" style="font-family:'나눔고딕'; width:198px; height:25px; background-color:transparent; outline:0; border:0">
                              </td>
                              <td width="30" style="vertical-align:top"><a onclick="submit1()"><img src="images/main/searchbtn.png" width="16" style="cursor:pointer; margin-left:4px; margin-top:4px"></a></td>
                           </tr>
                        </table>
                     </form>
                  </td>
               </tr>
            </table>
         </div>
         <!-- 위에 로그인&검색창 끝!!!! -->
      </c:if>
   </div>
</div>
<div class="div" style="background-color:#0c7733; width:100%; height:3px; margin-top:5px; border:1px #000000 solid"></div>
<%-- 네비바 끝 --%>

<!-- 마이페이지 시작 -->
<div id="container" class="div container" align="center">
   <div class="divWid">
      <!-- 주문내역 조회 시작 -->
      <!-- 마이페이지 이미지 -->
   
   
      
      <div style="width:740px; text-align:left; margin-top:40px; margin-bottom:80px">
         <div style="width:100%; height:62px; text-align:center; margin-bottom:20px"><font style="font-size:32px; color:#424242; font-weight:bold; margin-bottom:40px">* Q&A 문의내역 *</font><br>
         <br>
         <font style="font-size:14px; color:#b4b4b4">문의글은 고객센터를 이용해주시기 바랍니다.</font></div>
         
         <table class="content-table myQna" width="740" border="1px solid black" rules="cols" cellpadding="0" cellspacing="0" style="margin-top:30px">
            <tr height="50" style="border:1px solid black;">
               <td id="table-td" width="100" style="background-color:#E6E6E6; text-align:center;"><font style="font-size:15px; color:#151515;  margin-bottom:40px">제목</font></td>
               <td id="table-td" width="404" align="left" style="padding-left:15px; text-align:center;">${qnaDTO.title }</td>
               <td id="table-td" width="109" style="background-color:#E6E6E6; text-align:center;"><font style="font-size:15px; color:#151515;  margin-bottom:40px">등록일</font></td>
               <td id="table-td" width="109" style="text-align:center;"><fmt:formatDate value="${qnaDTO.date }" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr height="40" style="border:1px solid black;">
            <td colspan="1" id="table-td" width="100" style="background-color:#E6E6E6; text-align:center;"><font style="font-size:15px; color:#151515; margin-bottom:40px">ID</font></td>
            <td colspan="3" id="table-td" width="404" align="left" style="padding-left:15px; text-align:center;">${qnaDTO.member_id }</td>
            </tr>
            </tr>
            <tr height="40" style="border:1px solid black;">
            <td colspan="1" id="table-td" width="100" style="background-color:#E6E6E6; text-align:center;"><font style="font-size:15px; color:#151515; margin-bottom:40px">내용</font></td>
            <td colspan="3" id="table-td" width="404" align="left" style="padding-left:15px; text-align:center;">${qnaDTO.content }</td>
            </tr>
            <tr height="30"></tr>
            <c:forEach var="qnaCommentlist" items="${qnaCommentlist}">
                     
            <tr height="30" style="border:1px solid #ffffff;" ><td colspan="4" style="text-align:center;"><font style="font-size:29px; color:#424242; font-weight:bold; margin-bottom:40px">답변</font></td></tr>
            <tr height="20">
            <tr height="50" style="border:1px solid black;">
            <td id="table-td" width="100" style="background-color:#E6E6E6; text-align:center;"><font style="font-size:15px; color:#151515;  margin-bottom:40px">ID</font></td>
               <td id="table-td" width="404" align="left" style="padding-left:15px; text-align:center;">관리자</td>
               <td id="table-td" width="109" style="background-color:#E6E6E6; text-align:center;"><font style="font-size:15px; color:#151515; margin-bottom:40px">등록일</font></td>
               <td id="table-td" width="109" style="text-align:center;"><fmt:formatDate value="${qnaCommentlist.date }" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr class="myQna" height="50" style="border:1px solid black;">
                  <td colspan="1" id="table-td" width="100" style="background-color:#E6E6E6;  text-align:center;"><font style="font-size:15px; color:#151515;  margin-bottom:40px">답변</font></td>
                  <td colspan="3" id="table-td" width="808" align="left" style="padding-left:15px;  text-align:center;">${qnaCommentlist.content }
            </td>
            </tr>
            </c:forEach>
            
            
            
            
            

        <!--Common plugins-->
        <script src="./plugins/jquery/dist/jquery.min.js"></script>
        <script src="./plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="./plugins/hoe-nav/hoe.js"></script>
        <script src="./plugins/pace/pace.min.js"></script>
        <script src="./plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="./js/app.js"></script>

        <!-- Datatables-->
        <script src="./plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="./plugins/datatables/dataTables.responsive.min.js"></script>
        <script>
            $(document).ready(function() {
        $('#datatable').dataTable();
        });
        </script>
    </body>
</html>