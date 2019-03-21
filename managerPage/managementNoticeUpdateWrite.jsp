<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page import="manager.NoticeDTO"%>
<%@ page import="manager.NoticeDAO"%>

<html> 
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
<link href="/Sharepot/managerPage/plugins/summernote/summernote.css" rel="stylesheet">
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
			<body style="font-family: '나눔고딕'" onload="$('#log_user_id').focus()">

				<%-- 네비바 끝 --%>
				<!--side navigation start-->
				<div id="hoeapp-wrapper" class="hoe-hide-lpanel"
					hoe-device-type="desktop">

					<div id="hoeapp-container" hoe-color-type="lpanel-bg7"
						hoe-lpanel-effect="shrink">


						<!--start main content-->
						<section id="main-content">
						<div class="space-30"></div>
						<div class="container">

							<div class="row">


								<div class="col-sm-12">
									<div class="panel">
										<div class="panel-body">
											<div class="row mail-header">
												<div class="col-md-6">
													<h3>공지사항 수정</h3>
												</div>
												<div class="col-md-6">
													<div class="pull-right tooltip-show">
														<a href="mailbox.html" class="btn btn-default btn-sm"
															data-toggle="tooltip" data-placement="top" title=""
															data-original-title="Move to draft folder"><i
															class="fa fa-pencil"></i> 수정하기</a> <a href="mailbox.html"
															class="btn btn-danger btn-sm" data-toggle="tooltip"
															data-placement="top" title=""
															data-original-title="Discard email"><i
															class="fa fa-times"></i> 나가기</a>
													</div>
												</div>
											</div>


											<form action="/Sharepot/managerPage/MngNoticeUpdateAction.do" method="post">
												<hr>
												<input name="notice_no" type="hidden" readonly="readonly"
													value=${noticelist.notice_no } />
												<div class="space-20"></div>

												<div class="form-group">
													<label style="color:black;"class="col-sm-2 control-label">보낼 사람:</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" value="관리자">
													</div>
												</div>
												<div class="form-group">
													<label style="color:black;" class="col-sm-2 control-label">제목:</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="title"
															value='${noticelist.title }'>
													</div>
												</div>

												<div class="space-20"></div>

												<div class="row">
										 			<div class="col-sm-12">
										 			<div class="space-20"></div>
														<!-- <div class="summernote-theme-1"> 
															<div class="summernote"> -->
																<textarea class="summernote" name="content"
																	style="width: 100%; height: 70px; font-family: '나눔고딕'; border: 1px solid #CCC; text-align: normal;">${noticelist.content }</textarea>
																<%-- 			<input type="text" class="form-control" name="content" value='${noticelist.content }'> --%>
															<!-- </div>
														</div> -->
													</div>
												</div>
												<div class="text-right">
													<button type="submit"
														class="btn btn-primary btn-lg rounded">보내기</button>
													<button type="reset" class="btn btn-danger  btn-lg rounded">삭제하기</button>
												</div>
											</form>



										</div>
										<!--.chat-area-bottom-->
									</div>
								</div>
								<!--row end-->
								</form>

							</div>
						</div>
					</div>
					<!--col-md-9 end-->

				</div>
				<!--row end-->
		</div>
		<!--container end-->
		<!--footer start-->
		<div class="footer">
			<div class="row">
				<div class="col-sm-12">
					<span>&copy; Copyright 2019. SharePot</span>
				</div>
			</div>
		</div>
		<!--footer end-->
		</section>
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
	<script src="/Sharepot/managerPage/plugins/summernote/summernote.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.summernote').summernote();
		});
	</script>
</body>
</html>

<%-- <!-- 로그인 내용 -->
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
 --%>

<!-- </body>
</html>
 -->