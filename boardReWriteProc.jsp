<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%
	BoardDAO bdao = new BoardDAO();
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String no = request.getParameter("no");
	String passwd = request.getParameter("passwd");
	int num = 0;
	System.out.println("num-> " + num);
	if(no != null) {
		num = Integer.parseInt(no);
	}
	BoardDTO bdto = new BoardDTO();
	bdto.setName(name);
	bdto.setContent(content);
	bdto.setNo(num);
	bdto.setPasswd(passwd);
	if(bdao.insertBoard("re_board", bdto)) {
		out.println(true);
	} else {
		out.println(false);
	}
%>