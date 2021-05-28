<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 데이터를 화면에 표시 --%>
<%
	//1.요청정보(request)로부터 파라미터 값 추출
	//2.요청자의 브라우저 화면에 출력(ul 태그)
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	String[] hobbies = request.getParameterValues("hobby");
	if(hobbies == null){
		hobbies = new String[]{"선택없음"};
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 데이터</title>
</head>
<body>
	<h1>회원가입 정보</h1>
	<ul>
		<li>이름 : <%=name %></li>
		<li>아이디 : <%=id %></li>
		<li>암호 : <%=pwd %></li>
		<li>이메일 : <%=email %></li>
		<li>취미 :
		<%
		for(String hobby : hobbies){
			out.print("<li>" + hobby + "<li>");
		}
		//그냥 데이터만 출력할 때는 이게 낫고 (이 부분 다시 봐야함)
		%>
		
		<hr>
		<h2>취미 표현식 사용해서 출력</h2>
		<ul>취미 : 
<%		
		for(String hobby : hobbies){ %>
			<%=hobby + " " %>
			<li><%=hobby %></li>
		<!--html 사용할 떄는 이렇게 해주는게 훨씬 보기 좋고 의미가 명확해진다 -->
<% 
		}
%>
		</ul>	
		<!--분리해서 쓰는 게 편할 때도 있다 -->
		<
		</p>
		
		
		
		
		</li>
	</ul>
</body>
</html>