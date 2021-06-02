<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일 업로드 처리하고 파일 정보 화면 표시--%>

<%
	//한글처리 위한 UTF-8 설정
	request.setCharacterEncoding("utf-8");

	//(주의) form 태그에 enctype="multipart/form-data" 설정하면
	//request 객체를 통한 파라미터값 조회 안 됨(MultipartRequest 사용할 것)
	String name = request.getParameter("name");
	System.out.println("> name : " + name);

	//파일을 저장할 위치
	// 	String path = "c:/MyStudy/temp"; //특정 위치를 직접 지정해 줄 수도 있고 
	String path = this.getServletContext().getRealPath("/upload");
	System.out.println("path : " + path);
	
	MultipartRequest mr = new MultipartRequest(
			request, //요청객체
			path, //실제 파일을 저장할 경로
			10 * 1024 * 1024, //업로드 파일의 최대크기 지정(byte 단위)
			"UTF-8", //인코딩 형식
			new DefaultFileRenamePolicy());
			
%>

	<h1>파일업로드 결과 보기</h1>
	<h2>올린사람(name) : <%=mr.getParameter("name") %></h2>
	<h2>제목(title) : <%=mr.getParameter("title") %></h2>
	<h2>파일(f_name) : <%=mr.getParameter("f_name") %></h2>
	<h2>원본 파일명(getOriginalFileName) : <%=mr.getOriginalFileName("f_name") %></h2>
	<h2>저장 파일명(getFilesystemName)--실제 파일명(물리적 저장) : <%=mr.getFilesystemName("f_name") %></h2>
	<h2>파일 타입 (getContentType) : <%=mr.getContentType("f_name") %></h2>
	<hr><hr>
<%
	File file = mr.getFile("f_name");
	out.println("<h2>파일이름 : " + file.getName() + "</h2>");
	out.println("<h2>파일크기 : " + file.length() + "</h2>");
%>

<h2>파일 다운로드</h2>
<a href = "download.jsp?path=upload&name=<%=mr.getFilesystemName("f_name")%>">
다운로드할 파일(<%=mr.getOriginalFileName("f_name") %>)
</a>










