<%@page import="floatingbanner.MainDAO"%>
<%@page import="floatingbanner.MainDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="static java.nio.charset.StandardCharsets.*"%>
<% 
	MainDTO dust=MainDAO.dustView();
	request.setAttribute("dust", dust);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>SharePot</title>
<link rel="stylesheet" href="css/details.css" />
<!-- Bootstrap -->
<link
	href="/Sharepot/managerPage/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!--side menu plugin-->
<link href="/Sharepot/managerPage/plugins/hoe-nav/hoe.css"
	rel="stylesheet">
<!-- icons-->
<link href="/Sharepot/managerPage/plugins/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="/Sharepot/managerPage/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="/Sharepot/managerPage/plugins/vectormap/jquery-jvectormap-2.0.2.css"
	rel="stylesheet" />
<link href="/Sharepot/managerPage/plugins/morris/morris-0.4.3.min.css"
	rel="stylesheet">
<!--template custom css file-->
<link href="/Sharepot/managerPage/css/style.css" rel="stylesheet">
<script src="/Sharepot/managerPage/js/modernizr.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<script type="text/javascript">
$(function () {
    var barOptions = {
        series: {
            lines: {
                show: true,
                lineWidth: 2,
                fill: false,
                lineTension: 1,   
                fillColor: {
                    colors: [{
                            opacity: 0.5
                        }, {
                            opacity: 0.5
                        }]
                }
            }
        },xaxis: {
            show: true,
            font: { color: '#888888'},
            position: 'bottom',
            ticks: [[0,'12 월'],[1,'1 월'],[2,'2 월'],[3,'3 월'],[4,'4 월'],[5,'5 월'],[6,'6 월'],[7,'7 월'],[8,'8 월'],[9,'9 월'],[10,'10 월'],[11,'11 월'],[12,'12 월']]
        },
        yaxis:{ show: true, font: { color: '#ababab' }, min:1},
        colors: ["#d55454"],
        grid: {
            color: "#888888",
            hoverable: true,
            clickable: true,
            tickColor: "#eeeeee",
            borderWidth: 0
        },
        legend: {
            show: false
        },
        tooltip: true,
        tooltipOpts: {
            content: "x: %x, y: %y"
        } 
    };
    var barData = {
        label: "Visiters",
        data: [[1,100]
          
        ]
    };
    
    var arr= [ [ '${mlist[0].m}', '${mlist[0].sumfee}'],
        ['${mlist[1].m}', '${mlist[1].sumfee}'],
        ['${mlist[2].m}', '${mlist[2].sumfee}'],
        [ '${mlist[3].m}', '${mlist[3].sumfee}'],
        ['${mlist[4].m}', '${mlist[4].sumfee}'],
        ['${mlist[5].m}', '${mlist[5].sumfee}'],
        [ '${mlist[6].m}', '${mlist[6].sumfee}'] ];
   
  /*   for(var i in ') */
    
  
  barData.data=arr;
    $.plot($("#flot-line-chart"), [barData], barOptions);

});

        //analytic bar chart
         $(function () {
        	
              var barData = {
                labels: ['${clist[0].item_name}', 
           		 '${clist[1].item_name}', 
           		 '${clist[2].item_name}' ,
           		 '${clist[3].item_name}' ,
           		 '${clist[4].item_name}' ,
           		 '${clist[5].item_name}' ,
           		 '${clist[6].item_name}',
           		 '${clist[7].item_name}',
           		 '${clist[8].item_name}',
           		 '${clist[9].item_name}' 
           		],
                datasets: [
                    {
                        label: "My First dataset",
                        fillColor: "rgba(171,171,171,0.5)",
                        strokeColor: "rgba(171,171,171,0.8)",
                        highlightFill: "rgba(171,171,171,0.75)",
                        highlightStroke: "rgba(171,171,171,1)",
                        data: ['${clist[0].cursu}', 
                      		 '${clist[1].cursu}', 
                       		 '${clist[2].cursu}' ,
                       		 '${clist[3].cursu}' ,
                       		 '${clist[4].cursu}' ,
                       		 '${clist[5].cursu}' ,
                       		 '${clist[6].cursu}',
                       		 '${clist[7].cursu}',
                       		 '${clist[8].cursu}',
                       		 '${clist[9].cursu}' ]
                    },
                    {
                        label: "My Second dataset",
                        fillColor: "rgba(213, 84, 84,0.5)",
                        strokeColor: "rgba(213, 84, 84,0.8)",
                        highlightFill: "rgba(213, 84, 84,0.75)",
                        highlightStroke: "rgba(213, 84, 84,1)",
                        data: ['${clist[0].su}', 
                      		 '${clist[1].su}', 
                       		 '${clist[2].su}' ,
                       		 '${clist[3].su}' ,
                       		 '${clist[4].su}' ,
                       		 '${clist[5].su}' ,
                       		 '${clist[6].su}',
                       		 '${clist[7].su}',
                       		 '${clist[8].su}',
                       		 '${clist[9].su}' ]
                    }
                ]
            };

            var barOptions = {
                scaleBeginAtZero: true,
                scaleShowGridLines: true,
                scaleGridLineColor: "rgba(0,0,0,.05)",
                scaleGridLineWidth: 1,
                barShowStroke: true,
                barStrokeWidth: 1,
                barValueSpacing: 5,
                barDatasetSpacing: 1,
                responsive: true
            };
               var ctx = document.getElementById("barChart").getContext("2d");
            var myNewChart = new Chart(ctx).Bar(barData, barOptions);
            });
        
        </script>





</head>
<body hoe-navigation-type="vertical" hoe-nav-placement="left"
	theme-layout="wide-layout">

	<!--side navigation start-->
	<div id="hoeapp-wrapper" class="hoe-hide-lpanel"
		hoe-device-type="desktop">


		<jsp:include page="managerMenu.jsp"></jsp:include>

		<!--start main content-->
		<section id="main-content">
			<div style="background-color: #F3F2ED;" class="space-30"></div>
			<div class="container">

				<div style="background-color: #F3F2ED;" class="row">
					<div class="col-md-3">
						<div class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="javascript:void(0)"
										class="panel-action panel-action-toggle" data-panel-toggle=""></a>
									<a href="javascript:void(0)" class="panel-action action-link"><i
										class="ion-refresh"></i></a> <a href="javascript:void(0)"
										class="panel-action panel-action-dismiss"
										data-panel-dismiss=""></a>
									<div class="dropdown pull-left">
										<a href="" data-toggle="dropdown" class="dropdown-toggle"><i
											class="ion-more"></i></a>
										<ul class="dropdown-menu dropdown-menu-scale">
											<li><a href="javascript:void(0)">Action</a></li>
											<li><a href="javascript:void(0)">Just Action</a></li>
											<li><a href="javascript:void(0)">Action Now</a></li>
										</ul>
									</div>
								</div>
								<h2 class="panel-title">
									오늘의 날씨 <span class="helping-text"></span>
								</h2>
							</header>
							<div align="center" style="padding-top:18px">
								<c:if test="${dust.getWeather_flage_array().equals('맑음')}">
									<img src="/Sharepot/images/emoji/sunny.png" width="80%">
								</c:if>
								<c:if test="${dust.getWeather_flage_array().equals('구름 조금')}">
									<img src="/Sharepot/images/emoji/cloudy1.png" width="80%">
								</c:if>
								<c:if test="${dust.getWeather_flage_array().equals('구름 많음')}">
									<img src="/Sharepot/images/emoji/cloudy2.png" width="80%">
								</c:if>
								<c:if test="${dust.getWeather_flage_array().equals('흐림')}">
									<img src="/Sharepot/images/emoji/dark.png" width="80%">
								</c:if>
								<c:if test="${dust.getWeather_flage_array().equals('비')}">
									<img src="/Sharepot/images/emoji/rainy.png" width="80%">
								</c:if>
								<c:if test="${dust.getWeather_flage_array().equals('눈/비')}">
									<img src="/Sharepot/images/emoji/rainy_snowy.png" width="80%">
								</c:if>
								<c:if test="${dust.getWeather_flage_array().equals('눈')}">
									<img src="/Sharepot/images/emoji/snowy.png" width="80%">
								</c:if>
							</div>
							<div align="center" style="padding-top:10px">
								<font style="font-size: 20px">현재 온도 : <fmt:formatNumber
										value="${dust.getWeather_degree_array()}" pattern="0" />℃
								</font>
							</div>
							<div align="center" style="padding-bottom:25px">
								<font style="font-size: 20px; color: #14b1bf"><fmt:formatNumber
										value="${dust.getWeather_min_array()}" pattern="0" />℃ </font><font
									style="font-size: 20px"> / </font><font
									style="font-size: 20px; color: #d63535"> <fmt:formatNumber
										value="${dust.getWeather_max_array()}" pattern="0" />℃
								</font>
							</div>
						</div>
					</div>

					<div class="col-md-8">
						<div class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="javascript:void(0)"
										class="panel-action panel-action-toggle" data-panel-toggle=""></a>
									<a href="javascript:void(0)" class="panel-action action-link"><i
										class="ion-refresh"></i></a> <a href="javascript:void(0)"
										class="panel-action panel-action-dismiss"
										data-panel-dismiss=""></a>
									<div class="dropdown pull-left">
										<a href="" data-toggle="dropdown" class="dropdown-toggle"><i
											class="ion-more"></i></a>
										<ul class="dropdown-menu dropdown-menu-scale">
											<li><a href="javascript:void(0)">Action</a></li>
											<li><a href="javascript:void(0)">Just Action</a></li>
											<li><a href="javascript:void(0)">Action Now</a></li>
										</ul>
									</div>
								</div>
								<h2 class="panel-title">
									강수량 / 미세먼지 차트 <span class="helping-text"></span>
								</h2>
							</header>
							<div align="center" style="padding-top:18px">
								<div align="left" style="width:96%; padding-bottom:12px;">
									<h5>
										<font style="font-weight:bold">강수 확률 : ${dust.getWeather_rain_percent_array()}%</font>
										(<c:choose>
											<c:when test="${dust.getWeather_rain_percent_array()>70 }">강수확률이 높으므로 우산을 많이 빌려갈 것으로 예상됩니다.</c:when>
											<c:when test="${dust.getWeather_rain_percent_array()>30 }">강수확률이 있으므로 우산을 빌려가는 사람이 생길 것으로 예상됩니다.</c:when>
											<c:otherwise>강수확률이 낮으므로 우산을 빌려가는 사람이 별로 없을 것 같습니다.</c:otherwise>
										</c:choose>)
									</h5>
									<div class="progress">
 									<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="background-color:#5cb85c; width:${dust.getWeather_rain_percent_array()}%">
    									<span class="sr-only"></span>
  									</div>
								</div>
									<h5>
										<font style="font-weight:bold">미세먼지 : ${dust.getPm10_array()} ㎍/m³</font>
										(<c:choose>
											<c:when test="${dust.getPm10_array()==-1}">측정 이상</c:when>
											<c:when test="${dust.getPm10_array()>150 }">미세먼지 농도가 매우 높으므로 마스크를 매우 많이 준비해 두세요.</c:when>
											<c:when test="${dust.getPm10_array()>80 }">미세먼지 농도가 높으므로 마스크를 찾는 사람이 많이 챙길 것 같습니다.</c:when>
											<c:when test="${dust.getPm10_array()>30 }">미세먼지 농도가 보통 이므로 일부 인원은 마스크를 찾을 것 같습니다.</c:when>
											<c:otherwise>미세먼지 농도가 좋음 이므로 마스크를 찾는 인원이 없을것 같습니다.</c:otherwise>
										</c:choose>)
									</h5>
									<div class="progress">
 									<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="background-color:#f0ad4e; width:${dust.graph10()}%">
    									<span class="sr-only"></span>
  									</div>
								</div>
									<h5>
										<font style="font-weight:bold">초 미세먼지 : ${dust.getPm25_array()} ㎍/m³</font>
										(<c:choose>
											<c:when test="${dust.getPm25_array()==-1}">측정 이상</c:when>
											<c:when test="${dust.getPm10_array()>150 }">초미세먼지 농도가 매우 높으므로 마스크를 매우 많이 준비해 두세요.</c:when>
											<c:when test="${dust.getPm10_array()>80 }">초미세먼지 농도가 높으므로 마스크를 찾는 사람이 많이 챙길 것 같습니다.</c:when>
											<c:when test="${dust.getPm10_array()>30 }">초미세먼지 농도가 보통 이므로 일부 인원은 마스크를 찾을 것 같습니다.</c:when>
											<c:otherwise>초미세먼지 농도가 좋음 이므로 마스크를 찾는 인원이 없을것 같습니다.</c:otherwise>
										</c:choose>)
									</h5>
									<div class="progress">
 									<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="background-color:#d9534f; width:${dust.graph25()}%">
    									<span class="sr-only"></span>
  									</div>
								</div>
									</div>
								</div>
								</div>
							

					</div>


				</div>
				<div style="background-color: #F3F2ED;" class="row">
					<div class="col-md-5">
						<div class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="javascript:void(0)"
										class="panel-action panel-action-toggle" data-panel-toggle=""></a>
									<a href="javascript:void(0)" class="panel-action action-link"><i
										class="ion-refresh"></i></a> <a href="javascript:void(0)"
										class="panel-action panel-action-dismiss"
										data-panel-dismiss=""></a>
									<div class="dropdown pull-left">
										<a href="" data-toggle="dropdown" class="dropdown-toggle"><i
											class="ion-more"></i></a>
										<ul class="dropdown-menu dropdown-menu-scale">
											<li><a href="javascript:void(0)">Action</a></li>
											<li><a href="javascript:void(0)">Just Action</a></li>
											<li><a href="javascript:void(0)">Action Now</a></li>
										</ul>
									</div>
								</div>
								<h2 class="panel-title">
									월별 연체료 수익 <span class="helping-text"></span>
								</h2>
							</header>


							<div class="panel-body">
								<div
									style="padding: 10px; height: auto; min-height: 320px; overflow: hidden;"
									class="flot-chart">
									<div
										style="padding: 10px; height: auto; min-height: 320px; overflow: hidden;"
										class="flot-chart-data" id="flot-line-chart"></div>
								</div>
							</div>
							<!--end panel body-->
						</div>
						<!--end panel-->
					</div>
					<!--end col 6-->
					<div class="col-md-6">
						<div class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="javascript:void(0)"
										class="panel-action panel-action-toggle" data-panel-toggle=""></a>
									<a href="javascript:void(0)" class="panel-action action-link"><i
										class="ion-refresh"></i></a> <a href="javascript:void(0)"
										class="panel-action panel-action-dismiss"
										data-panel-dismiss=""></a>
									<div class="dropdown pull-left">
										<a href="" data-toggle="dropdown" class="dropdown-toggle"><i
											class="ion-more"></i></a>
										<ul class="dropdown-menu dropdown-menu-scale">
											<li><a href="javascript:void(0)">Action</a></li>
											<li><a href="javascript:void(0)">Just Action</a></li>
											<li><a href="javascript:void(0)">Action Now</a></li>
										</ul>
									</div>
								</div>
								<h2 class="panel-title">물품 대여 현황</h2>
							</header>
							<div class="panel-body">
								<div class="chartjs-data">
									<canvas id="barChart" height="129"></canvas>
								</div>
							</div>
							<!--end panel body-->
						</div>
						<!--end panel-->
					</div>
					<!--end col 6-->
				</div>
				<!--end row-->
				<div style="background-color: #F3F2ED;" class="row">
					<div class="col-md-5">
						<div style="height: auto; width: 100%;" class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="javascript:void(0)"
										class="panel-action panel-action-toggle" data-panel-toggle=""></a>
									<a href="javascript:void(0)"
										class="panel-action panel-action-dismiss"
										data-panel-dismiss=""></a>
									<div class="dropdown pull-left">
										<a href="" data-toggle="dropdown" class="dropdown-toggle"><i
											class="ion-more"></i></a>
										<ul class="dropdown-menu dropdown-menu-scale">
											<li><a href="javascript:void(0)">Action</a></li>
											<li><a href="javascript:void(0)">Just Action</a></li>
											<li><a href="javascript:void(0)">Action Now</a></li>
										</ul>
									</div>
								</div>
								<h2 class="panel-title">연체료 순위</h2>


							</header>
							<div class="panel-body">
								<div class="scrollDiv">
									<table class="table table-striped">
										<tbody>
											<tr>
												<th><div>순위</div></th>

												<th align="center"><div>이용자</div></th>
												<th align="center"><div>연체 료</div></th>
											</tr>




											<c:forEach var="FeeVO" items="${rlist}" varStatus="status">
												<tr>
													<td><span class="label label-warning">${status.index+1}</span>
													</td>
													<td align="center">${FeeVO.member_id}</td>
													<td align="center">${FeeVO.fee}</td>
												</tr>

											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
							<!--end panel body-->
						</div>
						<!--end panel-->
					</div>
					<!--end col 6-->

					<div class="col-md-6">
						<div class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="javascript:void(0)"
										class="panel-action panel-action-toggle" data-panel-toggle=""></a>
									<a href="javascript:void(0)"
										class="panel-action panel-action-dismiss"
										data-panel-dismiss=""></a>
									<div class="dropdown pull-left">
										<a href="" data-toggle="dropdown" class="dropdown-toggle"><i
											class="ion-more"></i></a>
										<ul class="dropdown-menu dropdown-menu-scale">
											<li><a href="javascript:void(0)">Action</a></li>
											<li><a href="javascript:void(0)">Just Action</a></li>
											<li><a href="javascript:void(0)">Action Now</a></li>
										</ul>
									</div>
								</div>
								<h2 class="panel-title">건의함</h2>
							</header>
							<div class="panel-body">
								<div class="scrollDiv">
									<div class="media-group feeds-group">
										<c:forEach var="QnaVO" items="${list}">

											<div class="media-group-item">
												<div class="media">
													<div class="media-left">
														<div class="avatar" align="center">
															<img src="/Sharepot/managerPage/images/profile.jpg" alt="" class="img-circle" width="40" style="border:1px solid #d96262">
														</div>
														<div class="my_name">
															<p class=”bg-primary“ style="font-size:10px">${QnaVO.member_id}</p>
														</div>
													</div>
													<div class="media-body">
														<h5>
															<a
																href="managementReportDetail.do?report_no=${QnaVO.qna_no }">${QnaVO.content}</a>
														</h5>
														<small class="text-muted">${QnaVO.date}</small>
													</div>
												</div>
											</div>
											<!-- .media-group-item -->
										</c:forEach>
									</div>
								</div>
							</div>
							<!--end panel body-->
						</div>
						<!--end panel-->
					</div>
					<!--end col 6-->



				</div>
				<!--end row-->

			</div>
			<!--end container-->

			<!--footer start-->
			<div class="footer">
				<div class="row">
					<div class="col-sm-12">
						<span>&copy; Copyright 2019. ktds</span>
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
	<script
		src="/Sharepot/managerPage/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/Sharepot/managerPage/plugins/hoe-nav/hoe.js"></script>
	<script src="/Sharepot/managerPage/plugins/pace/pace.min.js"></script>
	<script
		src="/Sharepot/managerPage/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/Sharepot/managerPage/js/app.js"></script>
	<!--page scripts-->
	<!-- Flot chart js -->
	<script src="/Sharepot/managerPage/plugins/flot/jquery.flot.js"></script>
	<script
		src="/Sharepot/managerPage/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="/Sharepot/managerPage/plugins/flot/jquery.flot.resize.js"></script>
	<script src="/Sharepot/managerPage/plugins/flot/jquery.flot.pie.js"></script>
	<script src="/Sharepot/managerPage/plugins/flot/jquery.flot.time.js"></script>
	<!--vector map-->
	<script
		src="/Sharepot/managerPage/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="/Sharepot/managerPage/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- ChartJS-->
	<script src="/Sharepot/managerPage/plugins/chartJs/Chart.min.js"></script>
	<!--dashboard custom script-->
	<!--    <script src="js/dashboard.js"></script> -->
</body>
</html>