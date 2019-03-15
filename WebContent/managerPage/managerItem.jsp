<%@page import="manager.ManagerReturnDTO"%>
<%@page import="java.util.List"%>
<%@page import="manager.ManagerReturnDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
        <jsp:include page="managerMenu.jsp"></jsp:include> <!-- 상단메뉴바 -->
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        <!-- The Modal -->
      <div class="modal fade" id="myModal">
         <div class="modal-dialog">
            <div class="modal-content">

                 <div class="page-center modal-header">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <div class="page-center-in">
                         <form action="managerItemInsert.do?pg=0" method="post" class="sign-box">
                             <div class="sign-avatar">
                                 <img src="photo.png" alt="" width="150" height="150" class="img-circle">
                             </div>
                             <header class="sign-title">물품 사진</header>
                              
                                   <div class="form-group">
                                 <input type="text" class="form-control" placeholder="물품 이름" name="item_name">
                             </div>
                                
                                <div class="form-group">
                                 <input type="text" class="form-control" placeholder="물품 사진" name="img">
                             </div>
                               
                                <div class="form-group">
                                 <input type="text" class="form-control" placeholder="물품 위치" name="location">
                             </div>
                           <div class="form-group">
                                 <input type="text" class="form-control" placeholder="물품 가격" name="cost">
                             </div>
                           
                             <button type="submit" class="btn btn-success rounded btn-lg">등록하기</button>
                             <hr>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                         </form>

                     </div><!--page center in-->
                 </div><!--page center-->
            </div>
         </div>
      </div>

      <!-- The Modal -->
      <div class="modal fade" id="myModal_plus">
         <div class="modal-dialog">
            <div class="modal-content">

                 <div class="page-center modal-header">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <div class="page-center-in">
                         <form class="sign-box">
                             <div class="sign-avatar">
                                 <img src="photo.png" alt="" width="150" height="150" class="img-circle">
                             </div>
                             <header class="sign-title"> 넥타이</header>

                             <div class="form-group">
                                 <input type="password" class="form-control" placeholder="물품 수량">
                             </div>
                             <button type="submit" class="btn btn-success rounded btn-lg">수정하기</button>
                             <hr>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                         </form>

                     </div><!--page center in-->
                 </div><!--page center-->
            </div>
         </div>
      </div>
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
 <div class="col-sm-2">
                     <div class="panel">
                        <div class="panel-body">
                           <div class="text-center">
                              <button type="button"  class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#myModal"><i class="ion-ios-compose-outline"></i> 새 물품 추가</button>
                           </div>
                           <hr>
                           <ul class="list-unstyled inbox-nav">

  								<c:forEach var="managerItemDTO" items="${list}">
                                             
                                              
                                                    <li><a href="managerItem.do?pg=${managerItemDTO.item_no}">
                                                    <i class="ion-android-folder-open"></i>${managerItemDTO.item_name} </a></li>
                                                    
                    
                                            </c:forEach>
                              
                           
                           </ul>
                        </div>
                     </div>
                  </div>
                  <row>
                  
                            <div class="col-md-9">
                                <div class="panel">
                                    <header class="panel-heading">
                                        <h2 class="panel-title">물품 관리</h2>
                                    </header>
                                    <div class="panel-body">
                                        <table id="datatable" class="table table-striped dt-responsive nowrap">
                                            <thead>
                                                <tr>
                                                
                                                    <th>물품 코드</th>
                                                    <th>물품 종류</th>
                                                    <th>물품 위치</th>
                                                    <th>물품 가격</th>
                                                    <th>반입 일자</th>
                                                 
                                                </tr>
                                            </thead>
											
                                                            
   
                                            <tbody>  
                                               
                                  <c:forEach var="managerItemDTO" items="${ilist}">
                                             
                                                <tr>
                                                    
                                                    <td>${managerItemDTO.item_no}</td>
                                                    <td>${managerItemDTO.item_name}</td>
                                                    <td>${managerItemDTO.location}</td>
                                                    <td>${managerItemDTO.cost}</td>
                                                    <td>${managerItemDTO.date}</td>
                                              
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div><!--panel body end-->
                                </div><!--end panel-->
                            </div><!--col end-->
                            </row>
                            <row>
                             <div class="col-md-3">
                                <div class="panel">
                                    <header class="panel-heading">
                                        <div class="panel-actions">
                                            <a href="javascript:void(0)" class="panel-action panel-action-toggle" data-panel-toggle=""></a>                                   
                                            <a href="javascript:void(0)" class="panel-action panel-action-dismiss" data-panel-dismiss=""></a>
                                            <div class="dropdown pull-left">
                                                <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="ion-more"></i></a>
                                                <ul class="dropdown-menu dropdown-menu-scale">
                                                    <li><a href="javascript:void(0)">Action</a></li>
                                                    <li><a href="javascript:void(0)">Just Action</a></li>
                                                    <li><a href="javascript:void(0)">Action Now</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <h2 class="panel-title">인기 물품</h2>
                                        
                                        
                                    </header>
                                    <div class="panel-body">
                                        <div class="scrollDiv">
                                            <table class="table table-striped">
                                                <tbody><tr>
                                                        <th><div>물품 명</div></th>
                                                
                                              <th align="center"><div>대여율</div></th>
                                                        <th align="center"><div>위치</div></th>
                                                </tr>
                                                  <c:forEach var="curVO" items="${ulist}">
  				  <tr>
                                                        
                                                            <td align="center">${curVO.item_name}</td>
                                                            <td align="center">${curVO.useRate} %</td>
                                                            <td align="center">${curVO.location}</td>
                                                        </tr>

</c:forEach>
                                                   
                                                </tbody></table>
                                        </div>
                                    </div><!--end panel body-->
                                </div><!--end panel-->
                            </div><!--end col 6-->
                            
                            
                            
                              <div class="col-md-6">
                                <div class="panel">
                                    <header class="panel-heading">
                                        <div class="panel-actions">
                                            <a href="javascript:void(0)" class="panel-action panel-action-toggle" data-panel-toggle=""></a>                                   
                                            <a href="javascript:void(0)" class="panel-action panel-action-dismiss" data-panel-dismiss=""></a>
                                            <div class="dropdown pull-left">
                                                <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="ion-more"></i></a>
                                                <ul class="dropdown-menu dropdown-menu-scale">
                                                    <li><a href="javascript:void(0)">Action</a></li>
                                                    <li><a href="javascript:void(0)">Just Action</a></li>
                                                    <li><a href="javascript:void(0)">Action Now</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <h2 class="panel-title">요청 물품</h2>
                                        
                                        
                                    </header>
                                    <div class="panel-body">
                                        <div class="scrollDiv">
                                            <table class="table table-striped">
                                                <tbody>      <tr>
                                                
                                                    <th>물품 이름</th>
                                                    <th>물품 설명</th>
                                                    <th>추천수</th>
                                                    <th>요청자</th>
                                                 
                                                </tr>
                                               <c:forEach var="managerItemDTO2" items="${rlist}">
                                             
                                                <tr>
 
                                                    <td>${managerItemDTO2.name}</td>
                                                    <td>${managerItemDTO2.content}</td>
                                                    <td>${managerItemDTO2.hits}</td>
                                                    <td>${managerItemDTO2.member_id}</td>
                                              
                                                </tr>
                                            </c:forEach>
                                                   
                                                </tbody></table>
                                        </div>
                                    </div><!--end panel body-->
                                </div><!--end panel-->
                            </div><!--end col 6-->
                            
                            
                  
                             
                              
                            </row>
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