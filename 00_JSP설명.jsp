<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP설명</title>
</head>
<body>
	<!-- HTML 주석 : 소스보기를 하면 보이는 HTML 주석문 -->
	<%-- JSP주석 : 소스보기에서 볼 수 없는 JSP주석(자바코드 주석임)--%>
	
	<%-- JSP 구성요소 :  디렉티브(지시어), 선언부, 스크립트릿, 표현식
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    1.디렉티브(<%@ %>) : JSP 페이지에 대한 설정정보 지정
	    - page : JSP 페이지에 대한 설정정보 지정
	    - include : 특정 영역에 다른 문서를 포함할 때 사용 (import)
	    - taglib : 태그립 - 사용할 태그 라이브러리 지정 ( JSTL : jsp standard tag library)
	2. 스크립트릿(<% %>) : 자바코드를 작성하는 영역(service 메소드 로컬 영역)
		- service() 메소드 영역에 추가되는 자바 코드(로컬영역)
	**제일 많이 씀**
	3. 표현식(<%= %>) : 값을 출력(변수값 또는 메소드 리턴값 등 표시할 때 사용)
		- out 객체 사용 출력 (out.println 역할인가)! -->맞다! 완전 간편
		<%out.print("sum : "+sum);%>--------> <%="sum : " + sum%> 이렇게 가능
	4. 선언부(<%! %> : 필드 영역에 작성되는 코드(변수, 메소드 선언)

	--%>
	<h1>Hello~ JSP!!!</h1>
	<hr>
	<h3>만나서 반갑다~~ㅎㅎㅎㅎ</h3>
</body>
</html>