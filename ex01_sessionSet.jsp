<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request 객체를 통해 전달받은 파라미터
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	System.out.println(">>param name : " + name + ", param age: " + age);
	
	//session scope에 데이터 저장
	session.setAttribute("attr_name", name);//session scope에 전달받은 파라미터값 저장
	session.setAttribute("attr_age", age);//session scope에 전달받은 파라미터값 저장
	
// 	session.getAttribute("attr_name");--->String으로 받아준다 (형변환 해서)
	String attr_name = (String)session.getAttribute("attr_name");
	String attr_age = (String)session.getAttribute("attr_age");
	System.out.println(">> session attr_name : " + attr_name);
	System.out.println(">> session attr_age : " + attr_age);
	
	//----------------------------
	//request scope에 저장
	request.setAttribute("req_name", name);
	request.setAttribute("req_age", age);
	String req_name = (String)request.getAttribute("req_name");
	String req_age = (String)request.getAttribute("req_age");
	System.out.println(">> session req_name : " + req_name);
	System.out.println(">> session req_age : " + req_age);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01_sessionSet.jsp</title>
</head>
<body>
	<h1>[ ex01_sessionSet.jsp ]</h1>
	<h2>이름(parameter) : <%=name %></h2>
	<h2>나이(parameter) : <%=age %></h2>
	<hr>
	
	<h2>이름(session) : <%=attr_name %></h2>
	<h2>나이(session) : <%=attr_age %></h2>
	<hr>
	
	<h2>이름(request req_name) : <%=req_name %></h2>
	<h2>나이(request req_age) : <%=req_age %></h2>
<%
	response.sendRedirect("ex01_session.jsp");
%>
</body>
</html>