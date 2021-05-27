package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//우리가 작성한 것은 어노테이션(@)가능하지만 외부꺼는 @못씀 --> web.xml 에 <servlet></> 작성해줘야함
@WebServlet("/today")
public class Ex02 extends HttpServlet{

	//doGet() 오버라이딩
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> Ex02.doGet() 메소드 실행");
		//한글 깨짐 방지를 위한 문자타입 처리(UTF-8)
		response.setContentType("text/html;charset=UTF-8");
		
		//오늘 날짜를 표시(년월일)
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1; //월은 n번재로 나오기 때문에 +1 해줘야함!
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		PrintWriter out = response.getWriter();
		//return이 PrintWriter 이여서 이ㅓㅀ게 해줌
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>today</title>");
		out.println("</head>"); //head 열고 head 닫고 body 열기
		out.println("<body>");
		out.println("<h1>환영합니다!!</h1>");
		out.println("<p>반갑습니다<br>서블릿 공부중</br></p>");
		out.println("<h3>오늘 날짜는?</h3>");
		out.println("<h3>오늘 날짜는? "+year+"년 "+ month+"월 "+day+"일 입니다.</h3>");
		
		out.println("</body>");
		out.println("</html>");
		
		
		
		
	}
	
	
	
	
	
	
	
	
}
