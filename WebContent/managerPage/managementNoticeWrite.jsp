<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page import="manager.NoticeDTO"%>
<%@ page import="manager.NoticeDAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<link href="./plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="./plugins/summernote/summernote.css" rel="stylesheet">
<!-- dataTables -->
<link href="./plugins/datatables/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">
<link href="./plugins/datatables/responsive.bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!--template custom css file-->
<link href="./css/style.css" rel="stylesheet">

<script src="./js/modernizr.js"></script>
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
													<h3>공지사항 글쓰기</h3>
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


											<form action="../MngNoticeWriteSubmitAction.do" method="post">
												<hr>
										<%-- 		<input name="notice_no" type="hidden" readonly="readonly"
													value=${noticelist.notice_no } /> --%>
												<div class="space-20"></div>

												<div class="form-group">
													<label class="col-sm-2 control-label">보낼 사람:</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" value="관리자">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">제목:</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="title"
															value=''>
													</div>
												</div>

												<div class="space-20"></div>

												<div class="row">
										 			<div class="col-sm-12">
										 			<div class="space-20"></div>
													
																<textarea class="summernote" name="content"
																	style="width: 100%; height: 70px; font-family: '나눔고딕'; border: 1px solid #CCC; text-align: normal;"></textarea>
														
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
	<script src="./plugins/jquery/dist/jquery.min.js"></script>
	<script src="./plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="./plugins/hoe-nav/hoe.js"></script>
	<script src="./plugins/pace/pace.min.js"></script>
	<script src="./plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="./js/app.js"></script>
	<script src="./plugins/summernote/summernote.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.summernote').summernote();
		});
	</script>
</body>
</html>


<!-- </head>

<body>
	<form action="./MngNoticeWriteSubmitAction.do" method="post">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				BOARD TITLE
				<td colspan="2" align="center"><h2>공지사항 글쓰기</h2></td>
			</tr>
			<tr height="40">
				<th>글제목</th>
				<td><input name=title type="text" size="50" maxlength="50" /></td>
			</tr>

			<tr>
				<th>글내용</th>
				<td><textarea name=content style="width: 100%; height: 200px;"></textarea></td>
			</tr>

			<tr>
				<td colspan="2" align="right"><input type="submit" value="글입력" />
					<input type="reset" value="초기화" /></td>
			</tr>
		</table>
	</form>
</body>
</html> -->
