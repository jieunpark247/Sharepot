<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <header id="hoe-header" hoe-lpanel-effect="shrink">
                <div class="hoe-left-header">
                    <a href="#"><img src="images/logo/logo3.png" width="100"></a>
                    <span class="hoe-sidebar-toggle"><a href="main.do"></a></span>
                </div>

                <div class="hoe-right-header" hoe-position-type="relative">
                  
                    <ul class="right-navbar navbar-right">
                       
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle"><img src="/Sharepot/managerPage/images/avtar.png" alt="" width="30" class="img-circle"> <%=session.getAttribute("m_idKey") %></a>
                            <ul class="dropdown-menu dropdown-menu-scale user-dropdown">
                                  <!-- <li><a href="#"><i class="ion-person"></i> Profile </a></li>
                      -->
                                <li><a href="/Sharepot/logout.do"><i class="ion-log-out"></i> Logout </a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </header>
            <div id="hoeapp-container" hoe-color-type="lpanel-bg7" hoe-lpanel-effect="shrink">
                <aside id="hoe-left-panel" hoe-position-type="absolute">



      <ul class="nav panel-list">

                        <li>
                            <a href="/Sharepot/managerPage/managerMain.do">
                                <i class="fa fa-home"></i>
                                <span class="menu-text">관리자 메인</span>
                                <span class="selected"></span>
                            </a>
                        </li>
            <li>
                           <a href="/Sharepot/managerPage/managementUser.do">
                                <i class="fa fa-user"></i>
                                <span class="menu-text">사용자 관리</span>
                                <span class="selected"></span>
                            </a>
                           
                        </li>
                           <li>
                           <a href="/Sharepot/managerPage/managementNotice.do">
                                <i class="fa fa-table"></i>
                                <span class="menu-text">공지사항</span>
                                <span class="selected"></span>
                            </a>
                           
                        </li>
                            <li>
                           <a href="/Sharepot/managerPage/managementReport.do">
                                <i class="fa fa-table"></i>
                                <span class="menu-text">건의사항</span>
                                <span class="selected"></span>
                            </a>
                           
                        </li>
                               <li>
                           <a href="/Sharepot/managerPage/managementQnA.do">
                                <i class="fa fa-table"></i>
                                <span class="menu-text">Q & A</span>
                                <span class="selected"></span>
                            </a>
                           
                        </li>
                           <li>
                           <a href="/Sharepot/managerPage/managerRent.do?delid=0">
                                <i class="fa fa-th-large"></i>
                                <span class="menu-text">대여 관리</span>
                                <span class="selected"></span>
                            </a>
                           
                        </li>
                        <li>
                           <a href="/Sharepot/managerPage/managerReturn.do?flag=0&delid=0&item=0">
                                <i class="fa fa-th-large"></i>
                                <span class="menu-text">반납 관리</span>
                                <span class="selected"></span>
                            </a>
                           
                        </li>
                     
                       <li>
                           <a href="/Sharepot/managerPage/managerItem.do?pg=0">
                                <i class="fa fa-th-large"></i>
                                <span class="menu-text">물품 관리</span>
                                <span class="selected"></span>
                            </a>
                           
                        </li>
                       
                    
                    

               
                    </ul>
                </aside><!--aside left menu end-->
