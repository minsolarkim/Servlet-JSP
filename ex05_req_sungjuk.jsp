<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리 요청</title>
</head>
<body>
<h2>성적처리</h2>
	<form action="ex05_resp.jsp"> 
<!-- 	jsp로 요청하고 jsp로 응답 -->
		<p>이름 : <input type="text" name="name" value="홍길동"></p>
		<p>국어 : <input type="number" name="kor" value="100"></p> 
		<p>영어 : <input type="number" name="eng" value="90"></p> 
		<p>수학 : <input type="number" name="math" value="81"></p> 
		<input type="submit" value="결과보기">
		<input type="reset" value="초기화">
	</form>
	<hr><hr>
</body>
</html>