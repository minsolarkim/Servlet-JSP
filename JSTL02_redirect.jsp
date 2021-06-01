<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--     이걸 해줘야 c: 실행됨 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL redirect</title>
</head>
<body>
	<h1>[ JSTL02_redirect.jsp ]</h1>
	<p>페이지 전환 : redirect - 파라미터 값 전달</p>
	<c:redirect url="JSTL02_resp.jsp">
		<c:param name="name" value="hong" />
		<c:param name="age">27</c:param>
<!-- 		두 가지 형태 다 가능 -->
		<c:param name="address">서울시 서초구</c:param>
	</c:redirect>
	
</body>
</html>