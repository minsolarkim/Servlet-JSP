<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답</title>
</head>
<body>
	<h2>[ ex11_resp_forward.jsp ]</h2>
	<h3>ID : <%=id %></h3>
	<h3>PW : <%=pwd %></h3>
	
	
	
</body>
</html>