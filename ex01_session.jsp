<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request, session에 저장된 데이터 사용
	String req_name = (String)request.getAttribute("req_name");
	String req_age = (String)request.getAttribute("req_age");
	
	//세션의 id 및 상태 확인
	System.out.println(">> session id : " + session.getId() + ", new : " + session.isNew());
	
	String attr_name = (String)session.getAttribute("attr_name");
	
	String attr_age = (String)session.getAttribute("attr_age");
	if (attr_age == null) {
		attr_age = "세션에 속성 없음(attr_age)";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션(session) 범위</title>
<script>
	function sessionSet(){
		location.href = "ex01_sessionSet.jsp?name=kim&age=30";
		//여기 바꾸면 값 바뀜!!!!!!!_!!!!
		//location 위치에 href 지정?
		//파라미터값 직접 지정도 가능
	}
	//session은 request보다 더 오래 데이터를 유지할 수 있다? 그것만 알고있어도 좋다 
	function sessionRemove(){
		location.href = "ex01_sessionRemove.jsp";
	}
	function sessionInvalidate(){
		location.href = "ex01_sessionInvalidate.jsp"; //복사해서 파일 만들어주기 
	}
</script>

</head>
<body>
	<h1>세션(session) 테스트</h1>
	<input type="button" value="세션 속성에 저장" onclick = "sessionSet()">
	<input type="button" value="세션 속성 삭제" onclick = "sessionRemove()">
	<input type="button" value="세션 초기화(무효화)" onclick = "sessionInvalidate()">
	<hr>
	
	<h1>세션스코프(session)</h1>
	<h2>이름(session) : <%=attr_name %></h2>
	<h2>나이(session) : <%=attr_age %></h2>
	
	<h1>request 스코프(request)</h1>
	<h2>이름(request) : <%=req_name %></h2>
	<h2>나이(request) : <%=req_age %></h2>
	
</body>
</html>



