<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피주문</title>
</head>
<body>
	<h1>커피주문</h1>
	<form action="ex08_resp.jsp">
<!-- 	default값을 입력 해놨기 때문에 null값 안 넘어가지만 checked 없애는 순간 null리턴된다 -->
		<input type="radio" name="coffee" value="1" checked>아메리카노(3000원)<br>
<!-- 				radio는 하나만 선택 가능 			default값 checked할 때 그냥 이렇게 -->
		<input type="radio" name="coffee" value="2" >카페모카(3500원)<br>
		<input type="radio" name="coffee" value="3" >에스프레소(2500원)<br>
		<input type="radio" name="coffee" value="4" >카페라떼(4000원)<br>
		<hr>
		수량 : <input type="number" name="su" size="3" value="1"><br>
		입금액 : <input type="number" name="money" size="10" value="0"><br>
		<input type="submit" >

	</form>
	
	
	
</body>
</html>