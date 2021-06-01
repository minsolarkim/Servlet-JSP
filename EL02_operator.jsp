<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연산자</title>
</head>
<body>
	<h1>EL : 문자열연산자, 비교연산자, 논리연산자</h1>
	<h2>문자열 붙이기</h2>
	<p> "Hello" + "World!!!"  ---> "Hello World!!!"</p>
	<p> 표현식 : "Hello" + "World!!!" --> <%= "Hello" + " World!!!" %>
<%-- 	<p> EL : "Hello" + " World!!!" -> ${"Hello" + " World!!!"} ==>이렇게 하니까 안됨--%>
	<h3>EL의 문자열 붙이기: += 기호 사용</h3>
	<p>EL : "Hello " += " World!!!" -> ${"Hello" +=  " World!!!"}
	<hr><hr>
	
	<h2>EL 비교연산자</h2>
	<p>비교연산자(부호) : ==, !-, <, >, <=, >= 사용가능</p>
	<p>비교연산자(영문) : eq, ne, lt, gt, le, ge 추가로 사용 가능</p>
	<p>100 > 50 : ${100 > 50 }</p>
	<p>100 gt 50 : ${100 gt 50 }</p>
	
	<p>100 >= 50 : ${100 >= 50 }</p>
	<p>100 ge 50 : ${100 ge 50 }</p>
	
	<p>100 == 50 : ${100 == 50 }</p>
	<p>100 eq 50 : ${100 eq 50 }</p>
	<hr>
	
	<h2>EL 논리 연산자 : &&, ||, !, and, or, not</h2>
	<p>100 > 50 && 200 > 100 : ${100 > 50 && 200 > 100 }</p>
	<p>100 > 50 and 200 > 100 : ${100 > 50 and 200 > 100 }</p>
	<p>원래 쓰던 &&, || 이게 편하겠지만 다른사람들이 and, or, not을 썼을 때 알아볼 수 있어야 한다</p>
	
	<p>!(100 > 50 && 200 > 100) : ${!(100 > 50 && 200 > 100) }</p>
	<p>not(100 > 50 && 200 > 100) : ${not(100 > 50 && 200 > 100) }</p>
	<p> !잘 안보일 수 있기 때문에 not 쓰면 잘 보인다 -- 이럴 때 좋음 </p>
	
</body>
</html>








