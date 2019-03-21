<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String type = request.getParameter("boardDtlType");
	String num = request.getParameter("no");
	BoardDAO bdao = new BoardDAO();
	System.out.println("type: " + type + ", num: " + num);
	int no = 0;
	if(num != null) {
		no = Integer.parseInt(num);
		System.out.println("type------------>" + type);
		BoardDTO bdto = bdao.getOriBoard(type, no);
		System.out.println("no: " + no);
		request.setAttribute("bdto", bdto);
	}
	if(type != null) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		if(type.equals("qna") || type.equals("report") || type.equals("board") || type.equals("fna")) {
			list = bdao.getReplyBoard(type, no);
			System.out.println("list------------------>" + list.size());
		}
		request.setAttribute("replys", list);
		bdao.updateHits(type, no);
	}
	request.setAttribute("type", type);
%>
<div id="boardDtlContainer" style="width:100%; display:block; height:100%; position:fixed; top:0; z-index:99; display:none">
	<div id="boardDtlBlk" style="width:100%; display:block; height:100%; background:rgba(0, 0, 0, 0.4); opacity:0.8; position:absolute" align="center"></div>
	<div id="boardDtlCttContainer" style="width:100%; height:100%; margin:auto;z-index:100;position:fixed; border-radius: 10px;padding-top: 0px;" align="center">
		<div id="boardDtlContent" style="position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); width:700px; background-color:white; border-radius:10px; padding-top:30px; padding-bottom:40px;">
			<div style="width:700px">
				<div style="width:100%; text-align:center">
					<font style="font-size:27px;  color:#d55454; font-weight:bold;">* 글보기 *</font>
				</div>
				<div style="margin-bottom:20px; margin-top:5px; text-align:center">
					<font style="font-size:16px; color:#b4b4b4">문의글은 고객센터를 이용해주시기 바랍니다.</font>
				</div>
				<input type="hidden" name="boardRe_no" id="boardRe_no" value="${bdto.getNo()}">
				<table class="content-table myQna" width="640" border="1" frame="void" rules="cols" cellpadding="0" cellspacing="0" style="margin-top:30px">
					<tr height="50" style="border-top: 1px solid #cbcbcb; border-bottom: 1px solid #cbcbcb">
						<td id="table-td" width="140" style="background-color:#f6f6f6; font-size:15px">제목</td>
						<td id="table-td" width="" align="left" style="padding-left:33px; font-size:15px" colspan="3">${bdto.getTitle()}</td>
					</tr>
					<tr height="50" style="border-top: 1px solid #cbcbcb; border-bottom: 1px solid #cbcbcb">
						<td id="table-td" width="140" style="background-color:#f6f6f6; font-size:15px">작성자</td>
						<td id="table-td" width="180" style="font-size:15px"><c:if test="${type.equals('notice')}">관리자</c:if><c:if test="${bdto.getMember_id() != 0}">${bdto.getMember_id()}</c:if><c:if test="${bdto.getName() != null}">${bdto.getName()}</c:if></td>
						<td id="table-td" width="140" style="background-color:#f6f6f6; font-size:15px">등록일</td>
						<td id="table-td" width="180" style="font-size:15px"><fmt:formatDate value="${bdto.getDate()}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr style="border-bottom: 1px solid #cbcbcb" height="150">
						<td colspan="4" align="left" style="padding-top:50px; padding-left:20px; padding-bottom:50px; padding-right:20px">
							<div style="margin-top:10px; line-height:23px; font-size:15px">${bdto.getContent()}</div>
						</td>
					</tr>
					<c:forEach var="reply" items="${replys}">
						<tr style="border-bottom: 1px solid #cbcbcb">
							<td colspan="4">
								<table width="600">
									<tr>
										<td style="vertical-align:top; padding-top:9px; padding-left:20px"><img src="images/reply.png" width="30"></td>
										<td>
											<div style="width:500px; margin-top:10px; margin-bottom:10px; line-height:23px; font-size:15px" align="left">
												${reply.getName()} 님<br>${reply.getContent()}
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${sessionScope.idKey != null }">
						<tr style="border-bottom: 1px solid #cbcbcb">
							<td colspan="4">
								<table width="600">
									<tr>
										<td width="35" style="vertical-align:top; padding-top:9px; padding-left:20px"><img src="images/reply.png" width="30"></td>
										<td>
											<div style="margin-top:10px; margin-bottom:10px; line-height:23px; font-size:15px" align="left">
												<input type="text" name="replyName" id="replyName" style="margin-top:5px; width:150px; height:32px; margin-bottom:4px; padding-left:7px" placeholder="작성자"><input type="password" name="replyPasswd" id="replyPasswd" style="margin-left:9px; margin-top:5px; width:150px; height:32px; margin-bottom:4px; padding-left:7px" placeholder="비밀번호"><br><input type="text" name="replyContent" id="replyContent" placeholder="답글" style="margin-top:4px; width:482px; height:32px; margin-bottom:4px; padding-left:7px">
											</div>
										</td>
										<td>
											<input class="goodsBtn" id="boardReWriteBtn" type="button" value="댓글달기" style="background-color:#d55454; cursor:pointer; margin-left:8px; width:93px; height:33px; margin-top:42px; border-radius:0px; font-size:15px; margin-bottom:1px" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
	</div>
</div>