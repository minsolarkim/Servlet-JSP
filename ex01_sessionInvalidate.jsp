<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션 초기화(무효화) --%>
<% 

	//세션 초기화(무효화)
	session.invalidate();

	//ex01_session.jsp로 돌아오기
	response.sendRedirect("ex01_session.jsp");
	
	
%>