<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//한글처리를 위한 설정
	request.setCharacterEncoding("UTF-8");

	//파라미터 값 추출(name, age)
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
	<h1>[ 여기는 ex01_incluee2_param.jsp 입니다 ]</h1>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>