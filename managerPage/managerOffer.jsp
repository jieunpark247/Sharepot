<%@page import="product.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
     <title>SharePot</title>

        <!-- Bootstrap -->
        <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--side menu plugin-->
        <link href="plugins/hoe-nav/hoe.css" rel="stylesheet">
        <!-- icons-->
        <link href="plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- dataTables -->
        <link href="plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
          <link href="plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
        <!--template custom css file-->
        <link href="css/style.css" rel="stylesheet">

        <script src="js/modernizr.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script> 
        <jsp:include page="managerMenu.jsp"></jsp:include> <!-- 상단메뉴바 -->
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        
        
               <script type="text/javascript">
        function isConfirm(history,offer) {
        var con_test = confirm("제공 처리 하시겠습닙까?.");
			if(con_test == true){
  			alert("제공 되었습니다");
  			location.href = "/Sharepot/managerPage/managerOffer.do?history_no="+history+"&offer_no="+offer;
  			
			}
			else if(con_test == false){
  			alert("취소 되었습니다.");
			}
        }
			</script>
        
        
    </head>
    <body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout">

        <!--side navigation start-->
        <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
           
            <div id="hoeapp-container" hoe-color-type="lpanel-bg7" hoe-lpanel-effect="shrink">
                  
        
     
                <!--start main content-->
                <section id="main-content">
                    <div class="space-30"></div>
                    <div class="container">

                        <div class="row">

                            <div class="col-md-12">
                                <div class="panel">
                                    <header class="panel-heading">
                                        <h2 class="panel-title">제공 요청</h2>
                                    </header>
                                    <div class="panel-body">
                                        <table id="datatable" class="table table-striped dt-responsive nowrap">
                                            <thead>
                                                <tr>
                                                
                                                    <th>제공 코드</th>
                                                    <th>수취 아이디</th>
                                                    <th>제공품 코드</th>
                                                    <th>제공 일자</th>
                                                    <th>제공 처리</th>
                                                  
                                                  
                                                </tr>
                                            </thead>
											
                                                            
   
                                            <tbody>
                                               
                                  <c:forEach var="managerOfferDTO" items="${list}">
            
                                                <tr>
                                                    
                                                    <td>${managerOfferDTO.history_no}</td>
                                                    <td>${managerOfferDTO.member_id}</td>
                                                    <td>${managerOfferDTO.offer_no}</td>
                                                    <td>${managerOfferDTO.date}</td>
                                             
                                                       <td><span class="label label-success"><a style="font-weight: bold" href="#" onclick="isConfirm(${managerOfferDTO.history_no},${managerOfferDTO.offer_no})">제공 승인</a></span></td>
                                        
                                                
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div><!--panel body end-->
                                </div><!--end panel-->
                            </div><!--col end-->
                        </div><!--row end-->
                    </div><!--container end-->

                    <!--footer start-->
                    <div class="footer">
                        <div class="row">
                            <div class="col-sm-12">
                                <span>&copy; Copyright 2019. ktds</span>
                            </div>
                        </div>
                    </div>
                    <!--footer end-->
                    
                    <div class="space-30"></div>
                    <div class="container">

                        <div class="row">

                            <div class="col-md-12">
                                <div class="panel">
                                    <header class="panel-heading">
                                        <h2 class="panel-title">제공 중</h2>
                                    </header>
                                    <div class="panel-body">
                                        <table id="datatable2" class="table table-striped dt-responsive nowrap">
                                            <thead>
                                                <tr>
                                                
                                                    <th>제공 코드</th>
                                                    <th>수취 아이디</th>
                                                    <th>제공품 코드</th>
                                                    <th>제공 일자</th>
                                                  
                                                  
                                                </tr>
                                            </thead>
											
                                                            
   
                                            <tbody>
                                               
                                  <c:forEach var="managerHistDTO" items="${list2}">
                                             
                                                <tr>
                                                    
                                                    <td>${managerHistDTO.history_no}</td>
                                                    <td>${managerHistDTO.member_id}</td>
                                                    <td>${managerHistDTO.offer_no}</td>
                                                    <td>${managerHistDTO.date}</td>
                                                   
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div><!--panel body end-->
                                </div><!--end panel-->
                            </div><!--col end-->
                        </div><!--row end-->
                    </div><!--container end-->

            </div>
        </div><!--end wrapper-->



        <!--Common plugins-->
        <script src="plugins/jquery/dist/jquery.min.js"></script>
        <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="plugins/hoe-nav/hoe.js"></script>
        <script src="plugins/pace/pace.min.js"></script>
        <script src="plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="js/app.js"></script>

        <!-- Datatables-->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.responsive.min.js"></script>
        <script>
            $(document).ready(function() {
        $('#datatable').dataTable();
        });
            $(document).ready(function() {
                $('#datatable2').dataTable();
                });
        </script>
    </body>
</html>