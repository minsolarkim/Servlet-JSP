<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 스크립트릿 (scriptlet) (작은 조각)</title>
</head>
<body>
	<h1>스크립트릿(scriptlet)</h1>
	<h3>자바코드를 작성하는 용도로 사용</h3>
	<% 
// 	이 안에는 자바코드만 작성 가능 주석도 그냥 //
	int a = 100;
	int b = 55;
	System.out.println(">>콘솔창에 출력");
	System.out.println("a + b : " + (a + b));
	%>
	
	<%
	//JSP에서 제공하는 내장객체 out 객체
	//서블릿 작성시 PrintWriter out = response.getWriter();
	//형태로 사용했던 out  객체라고 생각하면 됨 (똑같은 건 아니지만 유사하다.)
	out.println("<hr>");
	//자바코드에서 갑자기 뜬금없이 out.println 쓰면 오류남
	//But!! JSP에서는 가능? 서블릿(Ex_05)에 이미 out이 변수로 선언되어있음 
	out.println("<p>JSP에서 제공하는 out 객체를 통학 출력</p>");
	out.println("<h2> a + b :  "+ (a + b)+"</h2>");
	%>
	
	
</body>
</html>