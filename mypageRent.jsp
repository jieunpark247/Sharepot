<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="dto.Rent" %>
<%@ page import="dao.mypageDAO" %>
<%@ page import="action.MypageAction" %>
<%@ page import="java.sql.Timestamp" %>
<%
int totalNum=0;
mypageDAO dao = new mypageDAO();
int member_id =  Integer.parseInt((String) session.getAttribute("idKey"));
String thisPage = request.getParameter("thisPage"); 
if(thisPage==null){
	thisPage = "1";
}
int perPage = 10;
Rent[] rents = dao.getRents(Integer.parseInt(thisPage),perPage,MypageAction.NOWRENT,member_id);

//반납 예상 날짜
Timestamp[] returnExpect = dao.getReturnExpect(Integer.parseInt(thisPage), perPage,member_id);

//연체 일수
long[] delayDay = new long[rents.length];
int idx=0;
for(Rent unit: rents) {
	delayDay[idx] = (System.currentTimeMillis() - returnExpect[idx].getTime())/(24*60*60*1000);
	idx++;
}

/*
 * boolean[] isDelay = new boolean[rents.length]; int idx1=0;
 * 
 * for(Rent temp:rents) { long dif = (System.currentTimeMillis()-
 * temp.getRent_date().getTime())/(24*60*60*1000); if(dif >=3) { isDelay[idx1] =
 * true; }else { isDelay[idx1] = false; } idx1++; }
 */

totalNum = dao.getTotalNum(MypageAction.NOWRENT,member_id);
int totalPageNum = totalNum/perPage;

if(totalNum % perPage !=0){
	totalPageNum++;
}

request.setAttribute("totalNum", totalNum);
request.setAttribute("rents", rents);
request.setAttribute("thisPage", thisPage);
request.setAttribute("totalPageNum", totalPageNum);
request.setAttribute("returnExpect", returnExpect);
request.setAttribute("delayDay", delayDay);

%>
<script>
$(function(){
	$('.rentPaging').click(function(){
		$.ajax({
			url: "mypageRent.jsp",
			data:{thisPage:$(this).text()},
			success: function(src){
	  	  		$("#rentContent").html(src);
	  	    },
	  	    error : function(error) {
	  	    	alert(error)
	  	    }
		})
	});
	
})

</script>
<font style="font-size:18px; color:#414141; font-weight:bold; color: #d55454">* 대여 현황 ( * 총 <b> ${requestScope.totalNum }</b> 건)</font><br>
<div style="padding-left: 10px; padding-top:10px ">
<font style="font-size:12px; color:#acacac">현재<b> 대여 중</b>인 물품 목록입니다.<br><br></font>
</div>
<table class="content-table" width="740" border="1" frame="void"
	rules="rows" cellpadding="0" cellspacing="0"
	style="margin-bottom: 40px">
<tr height="40" style="background-color: #f6f6f6">
	<td id="table-td" width="60">대여번호</td>
	<td id="table-td" class="table-line" width="300" colspan="2">물품명</td>
	<td id="table-td" class="table-line" width="100">대여 일자</td>
	<td id="table-td" class="table-line" width="100">반납 예정일</td>
	<td id="table-td" class="table-line" width="70">연체료</td>
	<td id="table-td" class="table-line" width="60">위치</td>
	<!-- <td id="table-td" class="table-line" width="50">상태</td> -->
</tr>
<c:choose>
<c:when test="${requestScope.totalNum == 0 || empty requestScope.totalNum}">
	<tr style="height: 100.67px">
		<td colspan="6">대여 기록이 없습니다.</td>
	</tr>
</c:when>
<c:otherwise>
	<c:forEach  var="rent" items="${rents}" varStatus="status" >
		<tr>
			<td align="center" style="padding-top: 10px; padding-bottom: 10px">${rent.rent_id }</td>
			<td align="center" width="80" style="padding-left: 70px;"><img alt="" src="${rent.img }" width="80"></td>
			<td align="left" style="padding-left:15px">${rent.item_name }</td>
			<td align="center"><fmt:formatDate value="${rent.rent_date }" pattern="yyyy-MM-dd" /></td>
			<td align="center">
				<c:if test="${delayDay[status.index] > 0}">
					<font color="red">
						<fmt:formatDate value="${returnExpect[status.index] }" pattern="yyyy-MM-dd" />
						(연체)
					</font>
				</c:if>
				<c:if test="${delayDay[status.index] <= 0}">
					<fmt:formatDate value="${returnExpect[status.index] }" pattern="yyyy-MM-dd" />
				</c:if>
			</td>
			<td align="center" style="padding-top: 10px; padding-bottom: 10px">
				<c:if test="${delayDay[status.index] >0 }">
					${delayDay[status.index] * rent.item_cost }원
				</c:if>
				<c:if test="${delayDay[status.index] <= 0 }">
					-
				</c:if>
			</td>
			<td align="center" >${rent.location }</td>
			<%-- <td align="center">
				<c:if test="${rent.state==0 }">
					<font color="blue">대여중</font>
				</c:if>
			</td> --%>
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
					<td  class="rentPaging" style="background-color:#f2f2f2; font-size:11px; vertical-align:middle" width="31" align="center">${idx }</td>
				</c:when>
				<c:otherwise>
					<td class="rentPaging" style="font-size:11px; vertical-align:middle; cursor:pointer" width="31" align="center">${idx }</td>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</tr>
	
	</table>
	</c:if>