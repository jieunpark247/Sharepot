<%@page import="manager.ManagerRentDTO"%>
<%@page import="java.util.List"%>
<%@page import="manager.ManagerRentDAO"%>
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
        function isConfirm(num) {
        var con_test = confirm("대여 처리 하시겠습닙까?.");
			if(con_test == true){
  			alert("대여 되었습니다");
  			location.href = "managerRent.do?delid="+num;
  			
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
                                        <h2 class="panel-title">대여 요청</h2>
                                    </header>
                                    <div class="panel-body">
                                        <table id="datatable" class="table table-striped dt-responsive nowrap">
                                            <thead>
                                                <tr>
                                                
                                                    <th>대여 코드</th>
                                                    <th>물품 코드</th>
                                                    <th>대여 아이디</th>
                                                    <th>대여 일자</th>
                                                    <th>반납 일자</th>
                                                    <th>연체료</th>
                                                    <th>대여 처리</th>
                                                </tr>
                                            </thead>
											
                                                            
   
                                            <tbody>
                                               
                                  <c:forEach var="managerRentDTO" items="${list}">
                                             
                                                <tr>
                                                    
                                                    <td>${managerRentDTO.rent_id}</td>
                                                    <td>${managerRentDTO.item_no}</td>
                                                    <td>${managerRentDTO.member_id}</td>
                                                    <td>${managerRentDTO.rent_date}</td>
                                                    <td>${managerRentDTO.return_date}</td>
                                                
                                                    <td>${managerRentDTO.fee}</td>
                                                       <td><span class="label label-success" color:white><a href="#" onclick="isConfirm(${managerRentDTO.item_no})">대여 승인</a></span></td>
                                        
                                                
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
                                <span>&copy; Copyright 2016. Assan</span>
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
                                        <h2 class="panel-title">대여 중</h2>
                                    </header>
                                    <div class="panel-body">
                                        <table id="datatable2" class="table table-striped dt-responsive nowrap">
                                            <thead>
                                                <tr>
                                                
                                                    <th>대여 코드</th>
                                                    <th>물품 코드</th>
                                                    <th>대여 아이디</th>
                                                    <th>대여 일자</th>
                                                    <th>반납 일자</th>
                                                    <th>연체료</th>
                                                </tr>
                                            </thead>
											
                                                            
   
                                            <tbody>
                                               
                                  <c:forEach var="managerRentListDTO" items="${list2}">
                                             
                                                <tr>
                                                    
                                                    <td>${managerRentListDTO.rent_id}</td>
                                                    <td>${managerRentListDTO.item_no}</td>
                                                    <td>${managerRentListDTO.member_id}</td>
                                                    <td>${managerRentListDTO.rent_date}</td>
                                                    <td>${managerRentListDTO.return_date}</td>
                                                
                                                    <td>${managerRentListDTO.fee}</td>
                                                   
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
                                <span>&copy; Copyright 2016. Assan</span>
                            </div>
                        </div>
                    </div>
                    <!--footer end-->
                </section><!--end main content-->
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