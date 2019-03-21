<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="dao.mypageDAO" %>
<%@ page import="dto.Offer" %>
<%@ page import="action.MypageAction" %>
<%
int totalNum = 0;
mypageDAO dao = new mypageDAO();
int member_id =  Integer.parseInt((String) session.getAttribute("idKey"));
String thisPage = request.getParameter("thisPage"); 
if(thisPage==null){
	thisPage = "1";
}
int perPage = 10;

Offer[] offers = dao.getOffer(member_id,Integer.parseInt(thisPage),perPage);
totalNum = dao.getTotalNum(MypageAction.OFFER, member_id);
request.setAttribute("offers", offers);

int totalPageNum = totalNum/perPage;
if(totalNum % perPage !=0){
	totalPageNum++;
}

request.setAttribute("totalNum", totalNum);
request.setAttribute("thisPage", thisPage);
request.setAttribute("totalPageNum", totalPageNum);
%>
<script>
$(function(){
	$('.offerPaging').click(function(){
		$.ajax({
			url: "offerList.jsp",
			data:{thisPage:$(this).text()},
			success: function(src){
	  	  		$("#chContent").html(src);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	});
	
})
</script>
<font style="font-size: 16px">* 총  <b> ${requestScope.totalNum } </b>건</font>

	<table class="content-table" width="740" border="1" frame="void"
		rules="rows" cellpadding="0" cellspacing="0"
		style="margin-bottom: 40px">
		<tr height="40" style="background-color: #f6f6f6">
			<td id="table-td" width="60">제공 번호</td>
			<td id="table-td" class="table-line" width="270" colspan="2">물품명</td>
			<td id="table-td" class="table-line" width="120">제공 일자</td>
			<td id="table-td" class="table-line" width="80">위치</td>
			<td id="table-td" class="table-line" width="80">상태</td>
			
			
		</tr>
		
		<c:choose>
			<c:when test="${requestScope.totalNum == 0 || empty requestScope.totalNum}">
				<tr style="height: 100.67px">
				<td colspan="6">대여 기록이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach  items="${offers}" var="offer">
				<tr>
					<td align="center" style="padding-top: 10px; padding-bottom: 10px">${offer.history_no}
					</td>
					<td align="center" width="80" style="padding-left: 80px;"><img alt="" src="${offer.img }" width="80"></td>
					<td align="left" style="padding-left:50px">${offer.name }</td>
					<td align="center"><fmt:formatDate value="${offer.date }" pattern="yyyy-MM-dd" /></td>
					<td>${offer.location}</td>
					<td align="center">
					<c:if test="${offer.state==0 }"><font color="blue">요청 중</font></c:if>
					<c:if test="${offer.state==1 }">제공 완료</c:if>
					</td>
					
				</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		<c:set var="thisPage" value="${requestScope.thisPage }"/>
		<c:set var="totalPageNum" value="${requestScope.totalPageNum }"/>
		
		<c:if test="${totalPageNum > 0 }">
		<table cellpadding="0" cellspacing="0" border="1" bordercolor="#e5e5e5" style="border-collapse:collapse" align="center">
		<tr height="40">
		
			<c:forEach var="idx" begin="1" end="${totalPageNum }">
				<c:choose>
					<c:when test="${idx==thisPage }">
						<td class="offerPaging" style="background-color:#f2f2f2; font-size:11px; vertical-align:middle" width="31" align="center">${idx }</td>
					</c:when>
					<c:otherwise>
						<td class="offerPaging" style="font-size:11px; vertical-align:middle; cursor:pointer" width="31" align="center">${idx }</td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tr>	
		
		</table>
		</c:if>
		
		
