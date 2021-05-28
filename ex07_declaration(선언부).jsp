<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부 메소드</title>
</head>
<body>
	<h2>덧셈</h2>
	<h3>100 + 200 = 300</h3>
<%
	int a = 100;
	int b = 200;
	int sum = a + b;
	//위에서 아래로 읽고 해석됨 
%>
	<h3>100 + 200 = <%=sum %></h3>
	<hr>
	
	<h1>sum = <%=sum(a,b) %></h1>
<!-- 	혹시 몰라서 int 선언 이후에 아래에 작성해봤는데 실행됨 
		- 위치가 int아래에만 있음 메소드 위에서도 가능하다  -->
	
	<h2>선언부의 메소드 사용</h2>
	<h3>sum(a, b) : <%=a %> + <%=b %> = <%=sum(a,b) %></h3>
	<%
	tot = sum(a, b);
	//tot이 전역변수라 가능 
	%>
	<h3>tot출력 : <%=tot %></h3>
<%!
	//선언부에 작성된 코드는 필드영역에 작성되는 코드다
	private int sum(int a, int b){
		return a + b;
	}
	//필드에 선언된 건 위치와 관련이 없다?
%>
<%!
	int tot = 0; //필드변수 -- 위치와 관계없이 어디서든 쓸 수 있다 
	//만약 <% 에 !가 없으면 그냥 지역변수여서 그 안에서나 그 아래에서만 사용 가능하다
%>
	

</body>
</html>



