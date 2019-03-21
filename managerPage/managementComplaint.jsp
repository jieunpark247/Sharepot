<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%@ page import="manager.QnADAO"%>
<%@ page import="manager.QnADTO"%>
<%@ page import="manager.QnACommentDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
        <link href="/Sharepot/managerPage/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- dataTables -->
        <link href="/Sharepot/managerPage/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
          <link href="/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
        <!--template custom css file-->
        <link href="/Sharepot/managerPage/css/style.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.12.1.js"></script> 
        <script src="/js/modernizr.js"></script>
        <jsp:include page="/managerPage/managerMenu.jsp"></jsp:include> <!-- 상단메뉴바 -->
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        
        <![endif]-->
       
</head>
<body>
건의사항 게시판

</body>


        <!--Common plugins-->
        <script src="/Sharepot/managerPage/plugins/jquery/dist/jquery.min.js"></script>
        <script src="/Sharepot/managerPage/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="/Sharepot/managerPage/plugins/hoe-nav/hoe.js"></script>
        <script src="/Sharepot/managerPage/plugins/pace/pace.min.js"></script>
        <script src="/Sharepot/managerPage/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="/Sharepot/managerPage/js/app.js"></script>
</html>