<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식(expression)</title>
</head>
<body>
	<p>HTML문을 사용해서 클라이언트에게 전달</p>
	<hr>
	<%out.print("<h2>out객체를 이용해서 클라이언트에게 전달(Java)</h2>"); %>
	<h2><%out.print("out객체를 이용해서 클라이언트에게 전달(Java)"); %></h2>
	<!-- 위 아래 똑같다 -->
	
	<h2>표현식(expression) 사용해서 클라이언트에게 전달</h2>
	<h3><%="표현식 사용해서 클라이언트에게 전달" %></h3>
<%-- 	<%= %> 안에는 끝에 ; 안써줘도 된다 이미 내장중 --%>
	<hr><hr>
	
	<h2>int 변수 2개(num1, mum2)의 값을 표현식 사용해서 합계(sum) 출력</h2>
<%
	int num1 = 100;
	int num2 = 200;
	int sum = num1 + num2;
%>
	<h3>출력형태 : 100 + 200 = 300</h3>
	<h3>out : <%out.print(num1 + " + " + num2 + " = " + sum); %></h3>
	<h3>표현식 1 :  <%=num1%> + <%=num2%> = <%=sum%></h3>
	<h3>표현식 2 :  <%=num1 + " + " + num2 + " = " + sum %></h3>
	<!-- 이것도 똑같다  -->




</body>
</html>