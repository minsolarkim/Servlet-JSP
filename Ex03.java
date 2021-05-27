package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> doGet() 실행~~");
		//한글 깨짐 방지를 위한 문자타입 처리(UTF-8)
		response.setContentType("text/html;charset=UTF-8");
		
		//클라이언트가 전달한 데이터를 받아서 HTML 문서를 만들어 되돌려줌
		//파라미터 값 : 요청시 서버쪽으로 전달한 값
		//파라미터 형식 : ?키=값&키=값&....
		//작성예) test03?name=kim&age=29
		//------------------------------
		//응답처리 형식
		//이름 : hong
		//나이 : 27
		//------------------------------
		//request 객체(인스턴스)로부터 파라미터 값 추출
		//1. getParameter(파라미터명) : 하나의 파라미터 값 추출
		//2. getParameterValues(파라미터명) : 배열형태 값 추출(체크박스 등)
//				배구, 야구 , 축구 같이 '같은 파라미터명'으로 넘어온 것은 것은 배열로 넘겨받음 
		//3. getParameterMap() : 값을 String 배열이 아닌 Map형태로 받겠다 ( 잘 안씀)(이런것도 있다)
		//4. getParameterNames() : 파라미터명 확인시 사용
		
		//요청처리
		String name = request.getParameter("name");
		String age = request.getParameter("age"); 
		//==> request.getParameter(); 엄청 많이 쓰게 될 것
		System.out.println("name: " + name + ", age: " + age);
		
		//응답처리
		PrintWriter out = response.getWriter();
		out.println("<h1>전달받은 데이터 (이름, 나이)</h1>"); //원래는 형식 다 짜서 하는 게 맞지만 이거는 그냥 약식
		out.println("<h2>이름 : "+name+"</h2>"); //원래는 형식 다 짜서 하는 게 맞지만 이거는 그냥 약식
		out.println("<h2>나이 : "+age+"</h2>"); //원래는 형식 다 짜서 하는 게 맞지만 이거는 그냥 약식
		//변수값으로 출력해줌 
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> doPost() 실행~~");
		request.setCharacterEncoding("UTF-8"); //전달받은 데이터 한글처리
		//post일때는 무조건 해줘야하고 위에처럼?
		//get? set일때도 해줘야한다!--response.setContentType("text/html;charset=UTF-8"); 이렇게
		
		doGet(request, response);
	}

}
