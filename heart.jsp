<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.*"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%
	int item_no =  Integer.parseInt(request.getParameter("no"));
	String state = request.getParameter("state");
	
	ProductDAO pdao = new ProductDAO();
	ProductDTO pdto = pdao.getInterestState(item_no, state ,request);
	request.setAttribute("pdto", pdto);
	
	if(pdto == null){
		state = "미로그인";
	}

	System.out.println("heart.jsp 상태 = "+state);
	out.println(state);
%>