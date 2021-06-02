<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터 사용해서 DB 데이터 수정처리 
	수정성공 : list.jsp
	예외발생 : 예외메시지 표시 후 이전화면(수정페이지) 이동
--%>
<%
	//0. 한글처리
	request.setCharacterEncoding("utf-8");

	//1. 파라미터 값 추출해서 VO에 저장
%>
	<jsp:useBean id="vo" class="com.bc.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="vo" />
	
<%
	System.out.println("> local vo : " + vo);
	System.out.println("> pageContext vo : " + pageContext.getAttributesScope("vo"));

	//2. SqlSession 객체생성
	SqlSession ss = DBService.getFactory().openSession(true); //이렇게 하면 자동커밋 상태!!! (실행시 자동 커밋됨)
	
	//3. 매퍼의 insert SQL 실행
	//순서 그때 그때 다르다
	try {
		ss.insert("guestbook.update", vo); //두 개짜리로 선택! (id명, 전달할데이터)
		//4. 페이지 이동 처리 (정상처리)
		response.sendRedirect("list.jsp");
	} catch (Exception e) {
		e.printStackTrace();
		//4. 페이지 이동 처리 (예외발생)
%>	
		<script>
			alert("[예외발생] 수정 중 예외가 발생했습니다.\n"
					+ "담당자(8282)에게 연락하세요.\n"
					+ "상세 페이지로 이동합니다.");
			history.back();
			
		</script>
<%	
	}
	ss.close();
%>	
