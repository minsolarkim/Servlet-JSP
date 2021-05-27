<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%--JSP 요청페이지에서 응답페이지로 전달 --%>
	<h2>(요청)ID, PW 값 서버측으로 전달</h2>
	<form action="ex04_resp.jsp"> 
	<!-- action을 이걸로 바꿔줌 -->
		<h2>ID: <input type="text" name="id" value="min"></h2>
		<h2>PW: <input type="password" name="pw" value="sol"></h2>
		<input type="submit" value="서버로 전송">
		
	</form>
</body>
</html>