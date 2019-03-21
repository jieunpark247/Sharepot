<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String type = request.getParameter("type");
	String id = request.getParameter("id");
	System.out.println("type99: " + type);
	System.out.println("id: " + id);
	request.setAttribute("id", id);
	request.setAttribute("type", type);
%>
<body onload="$('#qnaTitle').focus()">
<div id="writeContainer" style="width:100%; display:block; height:100%; position:fixed; top:0; z-index:99; display:none">
	<div id="writeBlk" style="width:100%; display:block; height:100%; background:rgba(0, 0, 0, 0.4); opacity:0.8; position:absolute" align="center"></div>
	<div id="writeCttContainer" style="width:100%; height:100%; margin:auto;z-index:100;position:fixed; border-radius: 10px;padding-top: 0px;" align="center">
		<div id="writeContent" style="position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); width:600px; background-color:white; border-radius:10px; padding:14px">
			<div style="width:600px">
				<form id="boardWriteForm" method="post" action="customerQna.do" style="margin-bottom:0px"><input type="hidden" name="type" value="${type}"><input type="hidden" name="id" value="${id}" />
					<div style="width:100%; text-align:center">
						<font style="font-size:27px;  color:#6bb546; font-weight:bold;">* 글쓰기 *</font>
					</div>
					<div style="margin-bottom:20px; margin-top:5px">
						<font style="font-size:16px; color:#b4b4b4">문의하려는 내용을 상세히 작성해주세요.</font>
					</div>
			
					<table class="content-table orderInfo" width="600px" border="1" frame="void" rules="rows" cellpadding="0" cellspacing="0" style="margin-bottom:10px" align="center">
						<c:if test="${type.equals('report')}">
							<tr height="50">
								<td width="100" style="background-color:#f6f6f6; font-size:16px">신고유형</td>
								<td align="left" style="padding-left:10px">
									<select name="reportOption" id="reportOption" style="width: 100px; height: 30px; border-radius: 5px; font-size: 15px;border: 1px solid #dadada;">
										<option value="1" selected>고장</option>
										<option value="2">분실</option>
										<option value="3">신고</option>
									</select>
								</td>		
							</tr>
						</c:if>
						<tr height="50" >
							<td width="100" style="background-color:#f6f6f6; font-size:16px">제목</td>
							<td align="left"><input type="text" style="border-radius:5px; padding-left:6px; margin-left:10px;width:482px;height: 30px;font-size: 15px;border: 1px solid #dadada;" id="qnaTitle" name="qnaTitle"></td>		
						</tr>
						<c:if test="${type.equals('board')}">
							<tr height="50">
								<td width="100" style="background-color:#f6f6f6; font-size:16px">이름</td>
									<td align="left"><input type="text" style="border-radius:5px; padding-left:6px; margin-left:10px;width:482px;height: 30px;font-size: 15px;border: 1px solid #dadada;"  id="qnaName" name="qnaName"></td>		
							</tr>
						</c:if>
						<tr height="330">
							<td width="100" style="background-color:#f6f6f6; font-size:16px">내용</td>
							<td  align="left">
								<textarea style="border-radius:5px; padding-left:6px; padding-right:6px; margin-left:10px; width:482px; height:309px; resize:none; padding-top:2px; padding-bottom:2px; font-size:15px; font-family:'나눔고딕'; line-height:24px; border: 1px solid #dadada;" id="qnaContent" name="qnaContent"></textarea>
							</td>
						</tr>
						<c:if test="${type.equals('board')}">
							<%-- 비회원 -> 비밀번호 입력 O / 회원 -> 비밀번호 입력 X --%>
							<tr height="50">
								<td width="100" style="background-color:#f6f6f6; font-size:16px">비밀번호</td>
								<td align="left"><input type="password" style="border-radius:5px; padding-left:6px; margin-left:10px;width:482px;height: 30px;font-size: 15px;border: 1px solid #dadada;" id="qnaPasswd" name="qnaPasswd"></td>
							</tr>
						</c:if>
					</table>
					<div style="margin-top:30px">
						<input class="goodsBtn" id="boardWriteBtn" type="button" value="글쓰기" style="background-color:#d55454; cursor:pointer; margin-left:8px" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>