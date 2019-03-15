<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="floatingbanner.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	MainDTO dust=MainDAO.dustView();
	request.setAttribute("dust", dust);
%>
<div class="floatingBanner" style="width:100%; height:0px; position:fixed; margin-top:68px" align="center">
	<div style="width:800px; height:0px">
		<div style="width:105px; height:500px; margin:0 auto; margin-left:-120px; float:left">
			<div class="laypop_quick" style="width:105px; height:0px; position:absolute; z-index:100; margin:0 auto; top:30px" align="center">
				<c:if test="${dust.getWeather_flage_array().equals('맑음')}"><img src="images/emoji/sunny.png" width="100"></c:if>
				<c:if test="${dust.getWeather_flage_array().equals('구름 조금')}"><img src="images/emoji/cloudy1.png" width="100"></c:if>
				<c:if test="${dust.getWeather_flage_array().equals('구름 많음')}"><img src="images/emoji/cloudy2.png" width="100"></c:if>
				<c:if test="${dust.getWeather_flage_array().equals('흐림')}"><img src="images/emoji/dark.png" width="100"></c:if>
				<c:if test="${dust.getWeather_flage_array().equals('비')}"><img src="images/emoji/rainy.png" width="100"></c:if>
				<c:if test="${dust.getWeather_flage_array().equals('눈/비')}"><img src="images/emoji/rainy_snowy.png" width="100"></c:if>
				<c:if test="${dust.getWeather_flage_array().equals('눈')}"><img src="images/emoji/snowy.png" width="100"></c:if>
				<table border="1" frame="void" rules="rows" cellpadding="0" cellspacing="0">
					<tr height="65">
						<td colspan="3" align="center" style="vertical-align:top; padding-top:5px" width="100"><font style="font-size:30px"><fmt:formatNumber value="${dust.getWeather_degree_array()}" pattern="0" />℃</font><br><font style="font-size:15px; color:#14b1bf"><fmt:formatNumber value="${dust.getWeather_min_array()}" pattern="0" />℃ </font><font style="font-size:12px">/</font><font style="font-size:15px; color:#d63535"> <fmt:formatNumber value="${dust.getWeather_max_array()}" pattern="0" />℃</font></td>
					</tr>
					<tr height="30">
						<td><font style="font-size:12px; font-weight:bold">PM10</font></td>
						<td align="right">
							<c:if test="${dust.getPm10_state().equals('측정 불가')}"><font style="font-size:12px; color:#878787">측정 불가</font></c:if>
							<c:if test="${dust.getPm10_state().equals('좋음')}"><font style="font-size:12px; color:#32a1ff">${dust.getPm10_array()}㎍/㎡</font></c:if>
							<c:if test="${dust.getPm10_state().equals('보통')}"><font style="font-size:12px; color:#00a83d">${dust.getPm10_array()}㎍/㎡</font></c:if>
							<c:if test="${dust.getPm10_state().equals('나쁨')}"><font style="font-size:12px; color:#fd9b5a">${dust.getPm10_array()}㎍/㎡</font></c:if>
							<c:if test="${dust.getPm10_state().equals('매우 나쁨')}"><font style="font-size:12px; color:#ff5958">${dust.getPm10_array()}㎍/㎡</font></c:if>
						</td>
						<td>
							<c:if test="${dust.getPm10_state().equals('측정 불가')}"></c:if>
							<c:if test="${dust.getPm10_state().equals('좋음')}"><img src="images/emoji/blue.png" width="14"></c:if>
							<c:if test="${dust.getPm10_state().equals('보통')}"><img src="images/emoji/green.png" width="14"></c:if>
							<c:if test="${dust.getPm10_state().equals('나쁨')}"><img src="images/emoji/orange.png" width="14"></c:if>
							<c:if test="${dust.getPm10_state().equals('매우 나쁨')}"><img src="images/emoji/red.png" width="14"></c:if>
						</td>
					</tr>
					<tr height="30">
						<td><font style="font-size:12px; font-weight:bold">PM2.5</font></td>
						<td align="right">
							<c:if test="${dust.getPm25_state().equals('측정 불가')}"><font style="font-size:12px; color:#878787">측정불가</font></c:if>
							<c:if test="${dust.getPm25_state().equals('좋음')}"><font style="font-size:12px; color:#32a1ff">${dust.getPm25_array()}㎍/㎡</font></c:if>
							<c:if test="${dust.getPm25_state().equals('보통')}"><font style="font-size:12px; color:#00a83d">${dust.getPm25_array()}㎍/㎡</font></c:if>
							<c:if test="${dust.getPm25_state().equals('나쁨')}"><font style="font-size:12px; color:#fd9b5a">${dust.getPm25_array()}㎍/㎡</font></c:if>
							<c:if test="${dust.getPm25_state().equals('매우 나쁨')}"><font style="font-size:12px; color:#ff5958">${dust.getPm25_array()}㎍/㎡</font></c:if>
						</td>
						<td>
							<c:if test="${dust.getPm25_state().equals('측정 불가')}"></c:if>
							<c:if test="${dust.getPm25_state().equals('좋음')}"><img src="images/emoji/blue.png" width="14"></c:if>
							<c:if test="${dust.getPm25_state().equals('보통')}"><img src="images/emoji/green.png" width="14"></c:if>
							<c:if test="${dust.getPm25_state().equals('나쁨')}"><img src="images/emoji/orange.png" width="14"></c:if>
							<c:if test="${dust.getPm25_state().equals('매우 나쁨')}"><img src="images/emoji/red.png" width="14"></c:if>
						</td>
						
					</tr>
					<tr height="26">
						<td colspan ="3" align="right"><font style="font-size:11px">(${dust.getWeather_clock_array()}:00기준)</font></td>
					</tr>
				</table>
			</div>
		</div>
		<div style="width:105px; height:500px; margin:0 auto; margin-right:-120px">
			<div class="laypop_quick" style="displan:none; width:94px; position:absolute; z-index:100; margin:0 auto; top:30px"> 
				<div class="div" style="width:94px; height:26px; border-radius:0px; background-color:#ffffff; padding-top:7px; padding-bottom:7px; border:1px solid #dcdcdc">
					<font style="font-size:12px; color:#000000">나의 쇼핑</font><br><img src="images/arrowDown2.png" width="10" style="margin-top:4px">
				</div>
				<div class="div" style="width:94px; border-radius:0px; background-color:#ffffff; padding-top:0px; margin-top:8px; border:1px solid #dcdcdc">
					<div style="width:70px; height:3px; margin-top:-1px; background-color:#3b3b3b; margin-bottom:7px"></div>
					<font style="font-size:12px; color:#000000">오늘 본 상품</font>
					<div style="margin-top:2px; margin-bottom:2px; width:92px; background-color:#ffffff">
							<a href="#"><img src="images/items/umbrella.jpg" width="80" style="margin-top:3px; margin-bottom:3px"></a>
					</div>
					<a onclick="btn_top()" style="cursor:pointer"><div style="margin-top:4px; margin-left:-1px; width:96px; padding-top:6px; padding-bottom:7px; background-color:#3b3b3b">
						<font style="font-size:12px; color:#ffffff; font-family:'Arial'; letter-spacing:0.5px">TOP</font><img src="images/arrowUp.png" width="10" style="margin-bottom:1px; margin-left:4px">
					</div></a>
				</div>
			</div>
		</div>
	</div>
</div>