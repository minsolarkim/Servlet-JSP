<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션에 설정된 속성 삭제 --%>
<% 
	//속성 자체를 삭제(attr_age)
	session.removeAttribute("attr_age"); //속성삭제
	//session.setAttribute("attr_age", ""); //속성은 존재하고 값을 빈문자열로 변경 != null이 아님
	
	//재요청처리(ex01_session.jsp 페이지로 이동)
	response.sendRedirect("ex01_session.jsp");
	
%>
<!-- html 필요 없어서 지움 -->