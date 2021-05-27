<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptlet sum</title>
</head>
<body>
	<h1>ex02_scriptlet_sum.jsp</h1>
	<h1>1부터 10까지의 합계 구하기</h1>
	<h3>출력형태(ex) : 1+2+3+...+9+10=55</h3>
	<% 
	int sum=0;
	for(int i=1; i<=10; i++){
		sum += i;
	}
	System.out.println("sum: " + sum); //이건 콘솔에 출력
	%> 
	<h3>출력형태 : <% for(int j=1; j<10; j++){ out.print(j + "+ ");} out.print("10"); %> = <%out.print(sum); %></h3>
<%-- 	<% %> 안에는 자바 코드가 들어와야 되기 때문에 ;으로 마무리 해주기 --%>
<%-- 	out.print 쓰기 너무 귀찮다 해서 나타난 게 <%= %>!! --%>
	<h2><%="sum : " + sum %></h2>
	<% %>
</body>
</html>