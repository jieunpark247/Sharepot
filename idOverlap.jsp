<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	response.setContentType("text/xml; charset=utf-8");
	String mem_id=request.getParameter("mem_id");
	MemberDAO mdao = new MemberDAO();
	boolean check = false;
	
	int id = 0;
	if(mem_id != null) {
		id = Integer.parseInt(mem_id);
		check = mdao.idOverlap(Integer.parseInt(mem_id));
	}
	String msg=null;
	
	//동일 아이디 존재
	if(check){
		msg="<font color='red'>동일한 아이디가 존재합니다</font>"; 
	}else{
		msg="<font color='green'>사용 가능한 아이디입니다</font>"; 	
	}
	out.println(msg);
%>