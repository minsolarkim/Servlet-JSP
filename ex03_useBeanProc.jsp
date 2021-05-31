<%@page import="com.mystudy.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터값 표시</title>
</head>
<body>
	<h1> [ ex03_useBeanProc.jsp ]</h1>
<%
	//한글처리를 위한 설정
	request.setCharacterEncoding("UTF-8");

	//파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
	<h2>일반적인 파라미터 처리 방식</h2>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>
	<hr>
	
	<h2>속성(attribute)을 이용(request scope)</h2>
<%
	request.setAttribute("attr_name", name + "(attr)");
	request.setAttribute("attr_age", name + "(attr)");
%>
	<h2>이름 : <%=request.getAttribute("attr_name") %></h2>
	<h2>나이 : <%=request.getAttribute("attr_age") %></h2>
	<hr><hr>
	<!-- 	useBean 액션태그 -->
	<!-- 자바빈(Bean)을 이용해서 파라미터 값 저장 사용 -->
	
<%-- 
	//아래의 useBean 태그가 구현된 방식 -- 이런 형태다 
	PersonVO person = (PersonVO) request.getAttribute("person");
	if (person == null ) {
		person = new PersonVO();
		request.setAttribute("person", person);
	}
--%>	

	<jsp:useBean id="person" class="com.mystudy.PersonVO" scope="request"/>
	<jsp:setProperty property="*" name="person"/>
	
<%
	System.out.println("person : " + person);
	System.out.println("request person : " + request.getAttribute("person"));
%> 
	<h2>빈(Bean) 저장값 표시 (사실 이건 많이 안 씀)</h2>
	<h2>이름(표현식) : <%=person.getName() %></h2>
	<h2>나이(표현식) : <%=person.getAge() %></h2>
	
	<hr><hr>
	
	<h2>데이터읽기 : getProperty 액션태그</h2>
	<h2>이름(액션태그) : <jsp:getProperty property="name" name="person"/></h2>
	<h2>나이(액션태그) : <jsp:getProperty property="age" name="person"/></h2>
	<hr>
	
	<h2>EL getter 이용 (request scope 값 사용)(이걸 더 많이 씀)</h2>
	<h2>이름(EL) : ${person.name }</h2>
	<h2>나이(EL) : ${person.age }</h2>
	로컬변수가 아닌 scope상에 저장된 값을 가져다 쓴다?
	<p>---------</p>
	<h2>이름(EL) : ${person.getName() }</h2>
	<h2>나이(EL) : ${person.getAge() }</h2>
</body>
</html>











