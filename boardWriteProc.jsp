<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%
	String type = request.getParameter("type");
	String title = request.getParameter("title");
	String mem_id = request.getParameter("id");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String passwd = request.getParameter("passwd");
	String option = request.getParameter("option");
	
	System.out.println("title: " + title);
	System.out.println("id: " + mem_id);
	
	int id = 0;
	if(mem_id != null) {
		id = Integer.parseInt(mem_id);
	}
	BoardDTO bdto = new BoardDTO();
	bdto.setTitle(title);
	bdto.setMember_id(id);
	bdto.setName(name);
	bdto.setContent(content);
	bdto.setPasswd(passwd);
	bdto.setOption(option);
	BoardDAO bdao = new BoardDAO();
	boolean flag = bdao.insertBoard(type, bdto);
	if(flag) {
		out.println("성공");
	} else {
		out.println("실패");
	}
%>