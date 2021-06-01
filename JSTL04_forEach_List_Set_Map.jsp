<%@page import="com.mystudy.PersonVO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
	<h1>JSTL forEach : Array, List, Set, Map</h1>
	<h2>Array 출력</h2>
	<p>출력대상 : {"a", "ab", "abc", "abcd" }</p>
<%
	String[] strs = {"a", "ab", "abc", "abcd"};
	pageContext.setAttribute("arr", strs);
%>

	<c:forEach var="str" items="${arr }">
		<p>${str }</p>
	</c:forEach>
	
	<h3>배열(Array) 일부 데이터만 사용(2,3번째: 1,2번 인덱스)</h3>
	<ul>
		<c:forEach var="str" items="${arr }" begin="1" end="2">
			<li>${str }</li>
		</c:forEach>
	</ul>
	
	<h2>List 출력</h2>
<%
	List<Integer> list = new ArrayList<Integer>();
	list.add(123);
	list.add(45);
	list.add(678);
	list.add(90);
	pageContext.setAttribute("alist",list);
%>
	<ul>
	<c:forEach var="listItem" items="${alist }">
		<li>${listItem }</li>
	</c:forEach>
	</ul>
	list 는 배열이랑 같다? --> 순서가 있음 0 1 2 3 4 이런 느낌
	set (집합) --> 중복을 허용하지 않는 집합
	map (key:value) --> key 값을 알면 value값 가져올 수 있다 
	<hr><hr>
	
<!-- 	============Set 출력================ -->
	<h2>Set 출력</h2>
<%
	Set<String> set = new HashSet<>();
	set.add("노수정");
	set.add("김민주");
	set.add("이미나");
	set.add("이미나");
	set.add("김민솔");
	pageContext.setAttribute("hset", set);
	System.out.println("set.size() : " + set.size());
	System.out.println("set.contains(\"노수정\")" + set.contains("노수정"));
%>
	<p>hset.size() : ${hset.size() }</p>
	<p>hset.contains("홍길동") : ${hset.contains("홍길동") }</p>
	<ol>
	<c:forEach var="name" items="${hset }">
		<li>${name }</li>
	</c:forEach>
	</ol>
	<hr><hr>
	
	<%-- =========== Map key-value 데이터 출력 ========== --%>
	<h1>Map key=value 데이터 출력</h1>
<%
	Map<String, String> map = new HashMap<>();
	map.put("k1", "a");
	map.put("k2", "ab");
	map.put("k3", "abc");
	map.put("k4", "abcd");
	//키 값은 중복 허용 안 함XXXX // value는 가능
	pageContext.setAttribute("hmap", map);
%>
	<c:forEach var="aaa" items="${hmap }">
		<p>${aaa.key} - ${aaa.value }</p>
	</c:forEach>
	
	<%--================================================ --%>
	<h1>VO가 담긴 List 사용 </h1>
<%
	List<PersonVO> listBean = new ArrayList<>();
	listBean.add(new PersonVO("노수정", "33"));
	listBean.add(new PersonVO("김민주", "31"));
	listBean.add(new PersonVO("이미나", "29"));
	listBean.add(new PersonVO("김민솔", "29"));
	pageContext.setAttribute("persons", listBean);
%>
<!-- (실습)persons에 있는 PersonVO 객체의 이름, 나이를 화면 출력  -->
	<c:forEach var = "ps" items="${persons }">
		<p>이름 : ${ps.name } , 나이 :  ${ps.age }</p>
	</c:forEach>
	<hr>
	<c:forEach var="person" items="${persons }" >
		<p>이름 : ${person.getName() }, 나이 : ${person.getAge() }</p>
	</c:forEach>
	<!-- 		.getName()해도 되고 그냥 .name해도 된다 -->
	
	<br><br><br><br><br><br><br><br>
	
</body>
</html>








