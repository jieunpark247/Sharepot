<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.mypageDAO" %>
<%@ page import="dto.Rent" %>
<%@ page import="action.MypageAction" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
	int member_id =  Integer.parseInt((String) session.getAttribute("idKey"));
	String thisPage = request.getParameter("thisPage");  
	if(thisPage==null){
		thisPage="1";
	}
	int perPage= 10;
	mypageDAO dao = new mypageDAO();
	Rent[] rents = dao.getRents(Integer.parseInt(thisPage), perPage,MypageAction.DELAYRENT,member_id);

	int totalNum = dao.getTotalNum(MypageAction.DELAYRENT,member_id);

	int totalPageNum = totalNum/perPage;
	if(totalNum % perPage !=0){
		totalPageNum++;
	}
	long[] delayDay = new long[rents.length];
	int idx = 0;
	
	for(Rent unit : rents){
		if(unit.getState()==0){
			//대여 중이라면
			delayDay[idx] = (System.currentTimeMillis() - unit.getRent_date().getTime())/(24*60*60*1000);
		}else{
			delayDay[idx] = (unit.getReturn_date().getTime() - unit.getRent_date().getTime())/(24*60*60*1000) -1;
		}
		idx++;
	}
	request.setAttribute("totalNum", totalNum);
	request.setAttribute("rents", rents);
	request.setAttribute("thisPage", thisPage);
	request.setAttribute("totalPageNum", totalPageNum);
	request.setAttribute("delayDay", delayDay);
%>

<script>
$(function() {
	$('.delayPaging').click(function(){
		$.ajax({
			url: "delayNoFee.jsp",
			data:{thisPage:$(this).text()},
			success: function(src){
	  	  		$(".noFeeTable").html(src);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	})
})

</script>
<font style="font-size:18px; color:#414141; font-weight:bold; color: #d55454">  * 미납 연체 현황</font><br>
<div style="padding-top:10px;padding-left: 15px">
<font style="font-size:14px; color:#acacac">물품은 반납했지만, 아직 연체 대금을 내지 않은 현황입니다. 미반납 물품의 연체현황은 대여현황에서 확인하세요.<br></font>
</div>

<br>
<br>
<font style="font-size: 16px">총<b> ${requestScope.totalNum }</b>건</font>
	
	<table class="content-table" width="740" border="1" frame="void"
		rules="rows" cellpadding="0" cellspacing="0"
		style="margin-bottom: 14px">
		<tr height="40" style="background-color: #f6f6f6">
			<td id="table-td" width="60">대여번호</td>
			<td id="table-td" class="table-line" width="270" colspan="2">물품명</td>
			<td id="table-td" class="table-line" width="100">위치</td>
			<td id="table-td" class="table-line" width="100">연체 일수</td>
			<td id="table-td" class="table-line" width="100">연체 금액</td>
		</tr>
		<c:choose>
			<c:when test="${requestScope.totalNum == 0 || empty requestScope.totalNum}">
				<tr style="height: 100.67px">
				<td colspan="6"> 연체 현황이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach  items="${rents}" var="rent" varStatus="status">
				<tr>
					<td align="center" style="padding-top: 10px; padding-bottom: 10px">${rent.rent_id}</td>
					<td align="center" width="80" style="padding-left: 70px;"><img alt="" src="${rent.img }" width="80"></td>
					<td align="left">${rent.item_name }</td>
					<td align="center">${rent.location }</td>
					<td align="center">${delayDay[status.index] }일</td>
					<td align="center">
						${delayDay[status.index] * rent.item_cost } 원
					</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		<div align="right" style="width:740px"><font style="font-size:12px; color:#acacac">* 연체금액 = 연체일수 * 500원 <br></font></div>
		
		<c:set var="thisPage" value="${requestScope.thisPage }"/>
		<c:set var="totalPageNum" value="${requestScope.totalPageNum }"/>

		
		<c:if test="${totalPageNum > 0 }">
		<table cellpadding="0" cellspacing="0" border="1" bordercolor="#e5e5e5" style="border-collapse:collapse" align="center">
			<tr height="40">
				<c:forEach var="idx" begin="1" end="${totalPageNum }">
					<c:choose>
						<c:when test="${idx==thisPage }">
							<td class="delayPaging" style="background-color:#f2f2f2; font-size:11px; vertical-align:middle" width="31" align="center">${idx }</td>
						</c:when>
						<c:otherwise>
							<td class="delayPaging"  style="font-size:11px; vertical-align:middle; cursor:pointer" width="31" align="center">${idx }</td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
		</table>
		
		</c:if>
		
		
	