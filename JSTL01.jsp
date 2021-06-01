<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 통상적으로 c(core) prefix 쓴다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<%-- JSTL (JSP Standard Tag Library => Taglib)
	0. 라이브러리 구하기(인터넷)
	다운로드 : https://tomcat.apache.org/download-taglibs.cgi
	다운로드 : mvnrepository > jstl
		https://mvnrepository.com/artifact/javax.servlet/jstl/1.2
	
	1. 라이브러리 등록
		WebContent > WEB-INF > lib > jar 파일 등록
	2. JSTL 디렉티브(지시어) taglib 추가
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
									주소처럼 보이지만 주소 아님
--%>
	<h2>JSTL 사용</h2>
	<h3>속성설정 : set</h3>
	<%-- set : 속성 선언 태그 setAttribute 역할 
		<c:set var="속성명" value="속성값" scope="범위" />
		scope : page | request | session | application
	--%>
<%

%>
	<c:set var="test" value="Hello JSTL!!! - page" />
<!-- 										꼭 /로 닫아줘야한다 -->
	<c:set var="test" value="Hello JSTL!!! - request" scope="request" />
	<c:set var="test" value="Hello JSTL!!! - session" scope="session" />
<%
	System.out.println("test: " + pageContext.getAttribute("test"));
%>
	<h3>속성값 출력 : out</h3>
	<p><c:out value="Hello World~~~" /></p>
	<p>page test(c:out) : <c:out value="${pageScope.test }" /> </p>
	<p>page test(EL) : ${pageScope.test }</p>
	<p>page test(EL) : ${sessionScope.test }</p>
	
	<p>application test(EL) : ${applicationScope.test }</p>
	<p>application test(c:out) :  
		<c:out value="${applicationScope.test }" default="데이터없음"></c:out>
	</p>
	
	(간단히 쓸 수 있는 EL이 있기 때문에 c:out을 쓸 일은 별로 없다
	가끔 default값 표현할 때 쓰려면 쓸 수 있긴 하다 )
	<hr>
	
	<h3>삭제 : remove</h3>
	<c:remove var="test" scope="page" />
	<p> EL : ${test }</p>
	삭제를 시키니까 page말고 그 다음 request가 나온다 
	<p>EL(page) : ${sessionScope.test }</p>
	<p>EL(request) : ${requestScope.test }</p>
	<p>EL(session) : ${sessionScope.test }</p>
	
	<%-- =========if문========= --%>
	<h2>if 태그의 test 속성</h2>
	<%-- JSTL에는 else문이 제공되지 않음 --%>
	<c:if test="${20 > 10 }">
		<p>20 &gt; 10 결과 true인 경우 실행문장</p>
	</c:if>
	<c:if test="${20 <= 10 }">
		<p>20 le 10 결과 true인 경우 실행문장</p>
	</c:if>
	
	<h3>if 태그 2</h3>
	<c:set var="n1" value="10" />
	<c:set var="n2" value="20" />
	<c:if test="${n1 > n2 }" var="result">
<!-- 		이 결과값을 나중에 쓸 수 있다는 거임 -->
		<P>if문 결과 n1이 n2보다 큽니다(result : ${result })</P>
	</c:if>
	<c:if test="${n1 <= n2 }" var="result">
		<P>if문 결과 n1이 n2보다 작거나 같습니다.(result : ${result })</P>
	</c:if>
	<hr>
	
	<%--==========choose ~ when ~ otherwise ============= --%>
	<h2>JSTL : choose ~ when ~ otherwise</h2>
	<c:set var="jumsu" value="60" />
	<c:choose>
		<c:when test="${jumsu >= 90 }">
			<p>판정결과(${jumusu }) : A</p>
		</c:when>
		<c:when test="${jumsu >= 80 }">
			<p>판정결과(${jumusu }) : B</p>
		</c:when>
		<c:when test="${jumsu >= 70 }">
			<p>판정결과(${jumsu }) : C</p>
		</c:when>
		<c:otherwise>
			<p>판정결과(${jumsu } : 노력필요)</p>
		</c:otherwise>
	</c:choose>
<!-- 	이걸 if문으로 쓰면 각각 처리된다  -->
	<hr><hr>
	
	<%-- ======JSTL 반복문 forEach====== --%>
	<h2>JSTL 반복문 : forEach문 사용</h2>
	<p>1~10까지의 숫자 출력</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }&nbsp;&nbsp;
	</c:forEach>
	<p>forEach문 종료 후 \${i }값 출력 : -${i }-</p>
<!-- 	$앞에 \해주면 문자처리 됨 -->
	<hr>
	
	<p>(실습)1~10까지의 숫자 중 짝수 출력(step="1")사용</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i % 2 ==0 }">
			${i }&nbsp;&nbsp; 
		</c:if>
	</c:forEach>
	<p>1~10까지의 숫자 중 짝수 출력(step="2")사용</p>
	<c:forEach var="i" begin="2" end="10" step="2">
		${i }&nbsp;&nbsp;
	</c:forEach>
	<hr><hr>
	
<!-- 	================ forEach문 집합객체 처리 ================= -->
	<h2>forEach문 집합객체 처리</h2>
	<h3>스크립트릿으로 배열값 출력</h3>
<%
	String[] arr = {"홍길동0", "홍길동1", "홍길동2", "홍길동3"};
	for (String name : arr) {
		out.print(name + ", ");
	}
%>
	<h3>forEach문으로 배열값 출력</h3>
	<c:set var="attr_names" value="<%=arr %>" />
<%-- 	${attr_names } --%>
<!-- 이름을 일부러 저렇게 한거다 --그래야 원래 arr이랑 안 헷갈림 -->
<!-- 	이렇게 해야 저 배열을 가져다가 쓸 수 있다 -->

	<h3>forEach문으로 배열데이터 처리</h3>
	<c:forEach var="name" items="${attr_names }"> 
<!-- 								따옴표 안에 쓸데없는 스페이스바 있으면 그대로 문자열이 되어버린다 -->
		${name },
	</c:forEach>
	<hr><hr>
	
<!-- 	============= forTokens 태그 =============== -->
	<h2>forTokens 태그 : 문자열 자르기</h2>
	<c:set var="names" value="홍길동/김유신/일지매,임꺽정/둘리,고길동" />
	<c:forTokens var="str" items="${names }" delims="/">
<!-- 	     == names 문자열에 있는 요소를 /로 잘라서 str에 넣겠다 -->
		<p>${str }</p>
	</c:forTokens>
	
	<h2>forTokens 구분자 /와 , 사용</h2>
	<c:forTokens var="str" items="${names }" delims="/,">
		<p>${str }</p>
	</c:forTokens>
<!-- 	이런 것도 있다 정도로만 알고 있기  -->
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
</body>
</html>







