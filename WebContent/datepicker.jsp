<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bootstrap-Material DateTimePicker</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- selectbox -->
<link href='https://fonts.googleapis.com/css?family=Work+Sans:300,400,600&Inconsolata:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css">
<!-- datepicker -->
<link rel="stylesheet" href="./css/bootstrap-material-datetimepicker.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
<script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
<script type="text/javascript" src="./js/bootstrap-material-datetimepicker.js"></script>
<style>
h2 {padding: 0 20px 10px 20px;font-size: 20px;font-weight: 400;}
.form-control-wrapper {margin: 10px 20px;}
code {padding: 10px; background: #eee!important; display: block; color: #000;}
code > p {font-weight: bold; color: #000; font-size: 1.5em;}
@media(max-width: 300px) {.well { margin : 0}}
.dtp-actual-day {height: 22px; padding-top: 4px;}
.dtp-close {padding-top:4px}
.dtp-btn-cancel {display:none}
.dtp-btn-ok {cursor:pointer; outline:0; width: 261px; border: 1px solid #e4e4e4; height: 40px; background-color: #ffffff; border-radius: 30px; font-size: 16px; font-family: '나눔고딕'; color: #909090;}
/* selectbox */
.nice-select.wide {width:214px}
.option {width:206.99px}
</style>
<!-- <script src="js/jquery.js"></script> -->
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/fastclick.js"></script>
<script src="js/prism.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	/* datepicker */
	$('#date').bootstrapMaterialDatePicker
	({
		time: false
	});
	$(".dtp-select-day").click(function() {
		$('#birthMsg').css('display','none');
	})
	/* selectbox*/
	$('select:not(.ignore)').niceSelect();      
    FastClick.attach(document.body);
});
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-64633646-1', 'auto');
ga('send', 'pageview');
</script>
</head>
<body>
	<table class="table_basic" width="500" cellpadding="0" cellspacing="0" style="margin-top:22px; border:1px #acacac solid">
		<!-- 이메일 -->
		<tr height="60">
			<td align="center">
				<table width="499">
					<tr>
						<td width="253"><input type="text" placeholder="이메일" name="user_email" id="user_email" style="outline:0; margin-top:5px; margin-bottom:3px; width:233px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:right; padding-right:5px; padding-top:3px; background-color:#ffffff"> @</td>
						<td style="padding-left:7px; padding-top:3px"><input type="hidden" name="emailHidden" id="emailHidden">
							<select class="wide" name="user_email2" id="user_email2">
								<option value="1" selected>kt.com</option>
								<option value="2">naver.com</option>
								<option value="3">gmail.com</option>
								<option value="4">hanmail.net</option>
							</select>
						</td>
					</tr>
				</table>
				<div id="emailMsg" class="error idMsg" style="display:none; margin-bottom:7px">
					<a name="check_email" id="check_email" style="font-size:13px; color:red">이메일을 입력하세요</a>
				</div>
			</td>
		</tr>
		<tr height="1">
			<td align="center"><img src="images/registerCheck/dot.jpg" width="440" height="1"></td>
		<tr>
		<!-- 생일 -->
		<tr height="60">
			<td align="center">
				<input type="text" placeholder="생일" name="date" id="date" style="outline:0; margin-top:5px; margin-bottom:3px; width:480px; height:26px; background-color:#ffffff; cursor:pointer; font-size:18px; border:0px; text-align:center" readonly>
				<div id="birthMsg" class="error" style="display:none; margin-bottom:7px">
					<a name="check_birth" style="font-size:13px; color:red">생일을 입력하세요</a>
				</div>
			</td>
		</tr>
	</table>
<input type="text" name="user_email2" id="user_email2" style="outline:0; margin-top:5px; margin-bottom:3px; width:100px; height:26px; font-family:'나눔고딕'; font-size:18px; border:0px; text-align:center" size="4">
</body>
</html>
