<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<%-- <%@page import="com.bc.mybatis.GuestbookVO"%> --%>
<%-- <%@page import="java.util.List"%> --%>
<%-- <%@page import="org.apache.ibatis.session.SqlSession"%> --%>
<%-- <%@page import="com.bc.mybatis.DBService"%> --%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- DB에서 전체 데이터 조회 후 화면에 출력 --%>
<%
	//DB에서 전체데이터 조회 후 화면에 출력
	//1. SqlSessin 객체 생성
	//openSession(), openSession(false) : 오토커밋 해제 상태 (트랜잭션 처리 필요)
	//			-inset, update, delete 작업 후 명시적으로 commit 처리 필요
	//openSession(true) : 자동커밋 상태로 세션객체 생성
	
	//1. SqlSession 객체 생성
// 	DBService.getFactory().openSession(); //빨간줄 뜨면 Ctrl + SpaceBar 눌러서 고르면 import 된다
	SqlSession ss = DBService.getFactory().openSession(); //SqlSession으로 받아준다
	
	//2. 매퍼의 SQL 실행
	//SqlSession selectList(매퍼id) : select 결과를 List형태로 받기
	//SqlSession selectOne(매퍼id) : select 결과를 하나(1,0)
	List<GuestbookVO> list = ss.selectList("guestbook.all"); //List로 받아준다.(GuestbookVO)타입으로
	//String arg0 하나인 거엔 id 넣어주기 // Object arg1에는 파라미터값?
	//mapper 태그의 namespace => guestbook
	//select 태그의 id => all
	ss.close();
// 	System.out.println("> list : " + list); //콘솔창 확인용
	
	//3. 화면출력(EL, JSTL 사용 - scope 등록)
	pageContext.setAttribute("attr_list", list);
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 목록</title>
<style>
	#container {
		width: 512px; margin: auto;
		border: 1px solid gray;
	}
	
	#container h2 { text-align: center;}
	#container p { text-align: center;}
	#container table {
		width: 500px;
		padding : 0 5px;
		border : 1px solid pink;
		border-collapse : collapse;
		text-align : center;
	}
	
	#container table th, td { border : 1px solid pink; }
	
	#container table th {
		background-color : lightgray;
	}
	
	#container table tr { border-top : 1px solid pink; }
	
	#container .center { text-align : center; }
	
	#container table th:nth-child(3), td:nth-child(3) { width: 200px; }
</style>
</head>
<body>
	<div id="container">
		<h2>방명록</h2>
		<hr>
		<p><a href="write.jsp">[방명록쓰기]</a></p>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
<!-- 				<tr> -->
<!-- 					<td>1</td> -->
<!-- 					<td>홍일동</td> -->
<!-- 					<td>제목1</td> -->
<!-- 					<td>2021-06-02</td> -->
<!-- 				</tr> -->
				<%-- SQL 실핼 후 결과 List 사용 tr태그 만들기(EL, JSTL)
				 jstl은 library 가져와서 lib에 넣고 또 taglib해줘야 가능
				 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				 --%>
<!-- 				 데이터 없을 경우를 위해 if문 안에 forEach문 작성해준다. -->
				<c:if test="${not empty attr_list }">
					<c:forEach var="vo" items="${attr_list }">
					<tr>
						<td class="center">${vo.getIdx() }</td>
						<td class="center">${vo.name }</td>
						<td class="center">
							<a href="onelist.jsp?idx=${vo.idx }">${vo.subject }</a>
						</td>
						<td class="center">${vo.regdate }</td>
<!-- 						getName()일땐 ()붙이고 그냥 이름일 땐 ()없이!! -->
					</tr>
				</c:forEach>
				</c:if>
<%-- 			<c:if test="${empty attr_list }"> --%>
<!-- 						위 아래 둘 다 가능하지만
							null값으로 나오느냐? 그게 다르다..?		-->			
				<c:if test="${attr_list.size() <= 0 }">
					<tr>
						<td colspan="4">검색된 데이터가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>








