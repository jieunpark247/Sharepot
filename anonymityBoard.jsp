<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String pageNumStr = request.getParameter("pageNum");
	if(pageNumStr == null) pageNumStr = "1";
	int pageNum = Integer.parseInt(pageNumStr);
	
	String search = request.getParameter("boardSearch");
	
	List<BoardDTO> allCustomerBoards = new ArrayList<BoardDTO>();
	
	BoardDAO bdao = new BoardDAO();
	allCustomerBoards = bdao.getBoard("board", search);
	
	//페이징 처리
	Hashtable<String, Integer> pgList = new Hashtable<String, Integer>();
	int rowSize = 10;
	int blockSize = 10;
	int blockNum = (pageNum - 1) / blockSize + 1;
	int rowCount = allCustomerBoards.size();
	int pageCount = (rowCount % rowSize) > 0 ? (rowCount / rowSize) + 1 : rowCount / rowSize;
	int startRow = (pageNum - 1) * rowSize + 1;
	int endRow = (startRow + rowSize) > rowCount ? rowCount : (startRow + rowSize) - 1;
	int startBlock = (blockNum - 1) * blockSize + 1;
	int endBlock = (startBlock + blockSize) > pageCount ? pageCount : (startBlock + blockSize);
	
	pgList.put("pageNum", pageNum);
	pgList.put("blockNum", blockNum);
	pgList.put("rowSize", rowSize);
	pgList.put("blockSize", blockSize);
	pgList.put("rowCount", rowCount);
	pgList.put("pageCount", pageCount);
	pgList.put("startRow", startRow);
	pgList.put("endRow", endRow);
	pgList.put("startBlock", startBlock);
	pgList.put("endBlock", endBlock);
	
	int rows2 = pgList.get("endRow") - pgList.get("startRow") + 1;
	request.setAttribute("rows2", rows2);
	request.setAttribute("allCustomerBoards", allCustomerBoards);
	request.setAttribute("pgList", pgList);
	request.setAttribute("search", search);
%>
<input type="hidden" name="boardDtlType2" id="boardDtlType2" value="board">
<div>
	<div style="padding-right: 7px;">
		<table width="188" class="table_basic" cellpadding="0" cellspacing="0" style="margin-top:20px; background:url('images/main/searchbar3.png'); background-size:100%; height:38px; background-repeat:no-repeat" align="right">
			<tr height="38">
				<td width="158" align="right" style="vertical-align:top">
					<input type="text" id="boardSearch" name="boardSearch" placeholder="제목 검색" style="font-family:'나눔고딕'; font-size:13px; padding-top:2px; padding-left:14px; width:144px; height:27px; background-color:transparent; outline:0; border:0; color:#808080" value="${search}">
				</td>
				<td width="30" style="vertical-align:top"><a id="boardBtn"><img src="images/main/searchbtn.png" width="16" style="margin-left:4px; margin-top:5px; cursor:pointer"></a></td>
			</tr>
		</table>
	</div>
	<div style="height:${40*(rows2+1) + 58}">
		<table class="content-table" width="800" border="1" frame="void" rules="rows" cellpadding="0" cellspacing="0" style="margin-top:0px">
			<tr height="40" style="background-color:#f6f6f6">
				<td id="table-td" width="50">번호</td>
				<td id="table-td" class="table-line" width="470">제목</td>
				<td id="table-td" class="table-line" width="100">작성자</td>
				<td id="table-td" class="table-line" width="70">조회수</td>
				<td id="table-td" class="table-line" width="110">작성일</td>
			</tr>
			<c:set value="${pgList.startRow - 1}" var="no" />
			<c:if test="${pgList.rowCount != 0}">
				<c:forEach var="allCustomerBoard" items="${allCustomerBoards}" begin="${pgList.startRow - 1}" end="${pgList.endRow - 1}">
					<c:set value="${no + 1}" var="no" />
					<tr height="40">
						<td id="table-td">${no}</td>
						<td id="table-td" class="table-line" align="left" style="padding-left:20px">
							<table style="padding:0px">
								<tr>
									<td style="padding-right:0px">
										<a class="boardDtlBtn2" style="cursor:pointer"><input type="hidden" name="customerQnaHidden" id="customerQnaHidden" value="${allCustomerBoard.getNo()}">${allCustomerBoard.getTitle()}<c:if test="${allCustomerBoard.getReplyCnt() != 0}"><font style="font-weight:bold"> (${allCustomerBoard.getReplyCnt()})</font></c:if></a>
									</td>
								</tr>
							</table>
						</td>
						<td id="table-td" class="table-line">${allCustomerBoard.getName()}</td>
						<td id="table-td" class="table-line">${allCustomerBoard.getHits()}</td>
						<td id="table-td" class="table-line"><fmt:formatDate value="${allCustomerBoard.getDate()}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${pgList.rowCount == 0}">
				<tr style="height:100.67px">
					<td colspan="6">등록된 글이 없습니다</td>
				</tr>
			</c:if>
		</table>
	</div>
	<div align="right" style="margin-top:10px; margin-bottom:-40px">
		<input class="writeBoard2" type="button" value="글쓰기" style="width:80px;height:30px;background-color: #ababab;border:0;border-radius: 5px;font-size: 13px;color:#ffffff;font-family:'나눔고딕';cursor:pointer;margin-right: 7px;margin-top: 1px;">
		<input type="hidden" id="hiddenType" name="hiddenType" value="qna"><input type="hidden" id="sessionHidden" name="sessionHidden" value="${sessionScope.idKey}" />
	</div>
	<div class="paging-list" style="margin-top:50px; margin-bottom:50px"><input type="hidden" id="movePage">
		<table cellpadding="0" cellspacing="0" border="1" bordercolor="#e5e5e5" style="border-collapse:collapse">
			<tr height="30">
				<c:forEach var="page" begin="1" end="${pgList.pageCount}" step="1">
					<c:if test="${pgList.pageNum==page}">
						<td class="boardPaging" style="background-color:#f2f2f2; font-size:11px; vertical-align:middle" width="31" align="center">${page}</td>
					</c:if>
					<c:if test="${pgList.pageNum!=page}">
						<td class="boardPaging" style="font-size:11px; vertical-align:middle; cursor:pointer" width="31" align="center">${page}</td>
					</c:if>
				</c:forEach>
			</tr>
		</table>
	</div>
</div>
