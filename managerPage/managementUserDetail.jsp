
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%@ page import="manager.rentDTO"%>
<%@ page import="manager.rentDAO"%>
<%@ page import="manager.UserDTO"%>
<%@ page import="manager.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<link href="/Sharepot/managerPage/plugins/lightbox2/dist/css/lightbox.css" rel="stylesheet">
<!--template custom css file-->
<link href="/Sharepot/managerPage/css/style.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<jsp:include page="managerMenu.jsp"></jsp:include>
<!-- 상단메뉴바 -->

<script src="/Sharepot/managerPage/js/modernizr.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<!-- 상단메뉴바 -->
</head>
<body hoe-navigation-type="vertical" hoe-nav-placement="left"
	theme-layout="wide-layout">

	<!--side navigation start-->
	<div id="hoeapp-wrapper" class="hoe-hide-lpanel"
		hoe-device-type="desktop">

		<div id="hoeapp-container" hoe-color-type="lpanel-bg7"
			hoe-lpanel-effect="shrink">

			<!--aside left menu end-->

			<!--start main content-->
			<section id="main-content">
			<div class="space-30"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="panel">
							<div class="panel-body">
								<div class="profile-info">
									<img src="assets/images/avtar-6.jpg" alt="" width="120"
										class="img-circle">
									<h4>${userdto.name }님</h4>
									<p class="text-uppercase color-info">ID :
										${userdto.member_id }</p>

									<div class="ui-buttons"></div>
									<div class="space-30"></div>
									<ul class="profile-menu list-unstyled">
										<li class="active"><a href="#"><i
												class="ion-ios-home-outline"></i> ${userdto.name }</a></li>
										<li><a href="#"><i class="ion-ios-settings"></i>
												${userdto.member_id }</a></li>
										<li><a href="#"><i class="ion-ios-help-outline"></i>
												연체 이력</a></li>
									</ul>
								</div>
								<!--profile info-->
							</div>
							<!--panel body-->
						</div>
						<!--panel-->
						<div class="space-20"></div>
						<div class="panel">
							<div class="panel-body">
								<div class="profile-states">
									<div class="row">


										<div class="col-md-4 col-sm-4 col-xs-6">
											<c:set var="sumReturn" value="0" />
											<c:set var="sumOverdue" value="0" />
											<c:set var="sumAll" value="0" />
											<c:forEach items="${rentlist}" var="rentlist">
												<c:if test="${rentlist.state  eq  1}">
													<c:set var="sumReturn" value="${sumReturn + 1}" />
												</c:if>

												<c:if test="${rentlist.state  eq  0}">
													<c:set var="sumOverdue" value="${sumOverdue + 1}" />
												</c:if>

												<c:set var="sumAll" value="${sumAll + 1}" />

											</c:forEach>
											<h1>
												<c:out value="${sumReturn}" />
											</h1>
											<h4>반납한 횟수</h4>
										</div>
										<div class="col-md-4 col-sm-4 col-xs-6">
											<h1>
												<c:out value="${sumOverdue}" />
											</h1>
											<h4>대여중인 물품수</h4>
										</div>
										<div class="col-md-4 col-sm-4 col-xs-6">
											<h1>
												<c:out value="${sumAll}" />
											</h1>
											<h4>총 빌린 이력</h4>
										</div>

									</div>
								</div>
								<!--Profile states-->
							</div>
							<!--panel body-->
						</div>
						<!--panel-->
						<div class="space-20"></div>
						<div class="panel">
							<div class="panel-body">
								<div class="about-profile">
									<h4>${userdto.name }님 의 대기상태</h4>
									<br>
											<p>대여요청 상태 :</p>
											<p>
									<c:forEach items="${rentlist}" var="rentlist">
										<c:if test="${rentlist.state  eq  2}">
									${rentlist.item_name }<br>
								

									</c:if>

									</c:forEach>
									</p>
									<a class="btn btn-facebook" href="#"> <i
										class="fa fa-facebook"></i>
									</a> <a class="btn btn-twitter" href="#"> <i
										class="fa fa-twitter"></i>
									</a> <a class="btn btn-linkedin" href="#"> <i
										class="fa fa-linkedin"></i>
									</a>
								</div>
							</div>
							<!--panel body-->
						</div>
						<!--panel-->
					</div>
					<div class="col-md-9">
						<div class="row">
							<div class="col-md-12">
								<div class="panel">
									<div class="panel-body">
										<div>
											<!-- Nav tabs -->
											<ul class="list-inline tabs-bordered margin-b-20"
												role="tablist">
												<li role="presentation"><a href="#gallery"
													aria-controls="gallery" role="tab" data-toggle="tab"><i
														class="ion-images"></i> 빌려간 이력</a></li>
												<li role="presentation"><a href="#settings"
													aria-controls="settings" role="tab" data-toggle="tab"><i
														class="ion-ios-settings"></i> 상세 정보</a></li>
											</ul>



											<!-- Tab panes -->
											<div class="tab-content">
												<div role="tabpanel" class="tab-pane active" id="gallery">
													<div class="row">
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w1.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w1.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w2.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w2.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w3.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w3.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w4.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w4.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
													</div>
													<div class="row">
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w5.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w5.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w6.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w6.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w7.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w7.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w8.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w8.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
													</div>
													<div class="row">
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w1.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w1.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w2.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w2.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w3.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w3.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
														<div class="col-md-3 col-sm-6">
															<a class="gallery-box" href="assets/images/w4.jpg"
																data-lightbox="gallery"> <img
																src="assets/images/w4.jpg" alt="" class="img-responsive">
																<div class="gallery-overlay">
																	<i class="ion-ios-eye-outline"></i>
																</div>
															</a>
														</div>
													</div>

												</div>



												<!-- 상세정보 -->
												<div role="tabpanel" class="tab-pane" id="settings">
													<form class="form-horizontal">
														<div class="form-group">
															<label for="name" class="col-sm-3 control-label" label style="color:black;" >닉네임</label>
															<div class="col-sm-7">
																<input type="email" class="form-control" id="name"
																	placeholder=${userdto.member_id }>
															</div>
														</div>
														<div class="form-group">
															<label for="pname" class="col-sm-3 control-label" label style="color:black;" >이름</label>
															<div class="col-sm-7">
																<input type="text" class="form-control" id="pname"
																	placeholder=${userdto.name }>
															</div>
														</div>
														<div class="form-group">
															<label for="position" class="col-sm-3 control-label" label style="color:black;">전화번호</label>
															<div class="col-sm-7">
																<input type="text" class="form-control" id="position"
																	placeholder=${userdto.tel }>
															</div>
														</div>
														<div class="form-group">
															<label for="about" class="col-sm-3 control-label"label style="color:black;">이메일
																사항</label>
															<div class="col-sm-7">
																<textarea style="height: 100px" class="form-control"
																	id="about" placeholder=${userdto.email }></textarea>
															</div>
														</div>
														<hr>
														<h4>Info</h4>
														<div class="form-group">
															<label for="address" class="col-sm-3 control-label" label style="color:black;" >생일
																주소</label>
															<div class="col-sm-7">
																<input type="text" class="form-control" id="address"
																	placeholder=${userdto.birth_date }>
															</div>
														</div>
														<div class="form-group">
															<label for="city" class="col-sm-3 control-label" label style="color:black;">등록날짜</label>
															<div class="col-sm-7">
																<input type="text" class="form-control" id="city"
																	placeholder=${userdto.date }>
															</div>
														</div>

														<div class="form-group">
															<label for="skills" class="col-sm-3 control-label" label style="color:black;">이메일
																체크여부</label>
															<div class="col-sm-7">
																<input type="text" class="form-control" id="skills"
																	placeholder=${userdto.email_check }>
															</div>
														</div>
														<hr>
														<div class="form-group">

															<label for="skills" class="col-sm-3 control-label" label style="color:black;">프로필
																사진</label>
															<div class="col-sm-7">
																<img src="assets/images/avtar-1.jpg" alt="" width="80">
																<div class="space-20"></div>
																<input type="file" class="form-control" id="avtar">
																<p class="help-block">JPEG/PNG 80x80px</p>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-offset-3 col-sm-9">
																<button type="submit"
																	class="btn btn-lg btn-primary rounded">Save
																	changes</button>
																<button type="button"
																	class="btn btn-lg btn-warning rounded">Cancel</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="panel">
									<header class="panel-heading">
									<h2 class="panel-title">최근 반납</h2>
									</header>

									<div class="panel-body">
										<div class="scrollDiv">
											<ul class="list-unstyled stream-list">
												<li class="clearfix"><img
													src="assets/images/avtar-1.jpg" alt="" class="img-circle"
													width="40">
													<div class="stream-content">
														<!-- 	----------------------------------------------- -->
														<%-- 		<c:forEach items="${rentlist}" var="rentlist">				
													${rentlist.item_name }											
												</c:forEach> --%>

														<c:forEach items="${rentlist}" var="rentlist">
															<c:if test="${rentlist.state  eq  1}">
											${rentlist.item_name }
												<small class="stream-time color-success">연체료
																	:${rentlist.fee }원</small>
																<h5>
																	<strong>${rentlist.item_name }</strong>을(를)반납하였습니다.
																</h5>
																<small>${rentlist.return_date }</small>
																<div>
																	<a class="btn btn-xs btn-default"><i
																		class="ion-eye"></i> 물품 상태</a> <a
																		class="btn btn-xs btn-success"><i
																		class="ion-thumbsup"></i>반납완료</a>
																</div>
															</c:if>
														</c:forEach>

													</div></li>


											</ul>
										</div>
									</div>
									<!--panel body-->
								</div>
								<!--panel-->
							</div>
							<div class="col-md-6">
								<div class="panel">

									<header class="panel-heading">
									<div class="panel-search">
										<div class="form-panel-search">
											<input type="text" class="form-control"
												placeholder="Search..."> <i class="fa fa-search"></i>
										</div>
									</div>
									<h2 class="panel-title">
										대여 목록 <span class="color-danger helping-text">80개 조회</span>
									</h2>
									</header>
									<div class="panel-body">
										<div class="scrollDiv">
											<ul class="task-list list-unstyled">


												<c:forEach items="${rentlist}" var="rentlist">
													<c:if test="${rentlist.state  eq  0}">
														<li class="clearfix">
															<div class="task-label">
																<label class="label label-primary">대여 중</label>
															</div>
															
															<div class="task-text">
																<p><a href="#">${rentlist.item_name } </a></p>
															</div>
													</c:if>
												</c:forEach>
												


											</ul>
										</div>
									</div>
									<!--panel body-->
								</div>
								<!--panel-->





							</div>
						</div>
					</div>
				</div>
			</div>
			<!--footer start-->
			<div class="footer">
				<div class="row">
					<div class="col-sm-12">
						<span>&copy; Copyright 2016. Assan</span>
					</div>
				</div>
			</div>
			<!--footer end--> </section>
			<!--end main content-->
		</div>
	</div>
	<!--end wrapper-->



	<!--Common plugins-->
	<script src="/Sharepot/managerPage/plugins/jquery/dist/jquery.min.js"></script>
	<script src="/Sharepot/managerPage/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/Sharepot/managerPage/plugins/hoe-nav/hoe.js"></script>
	<script src="/Sharepot/managerPage/plugins/pace/pace.min.js"></script>
	<script src="/Sharepot/managerPage/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/Sharepot/managerPage/js/app.js"></script>
	<!--page script-->
	<script src="/Sharepot/managerPage/plugins/lightbox2/dist/js/lightbox.min.js"></script>
</body>
</html>