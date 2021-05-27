package com.mystudy.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
// /hello라는 요청이 들어오면 아래가 실행된다
public class Ex01_Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Ex01_Hello() {
        /*생성자
         * WAS(Web Application Sever - 웹어플리케이션서버)
         * = Servlet 컨테이너, JSP 컨테이너 라고도 한다.)
         * -에서 서블릿이 최초 등록될때(최초요청시)
         * !한 번만 실행된다!
         * 두 번째 URL 요청부터는 service() 메소드 실행됨
         */ 
        System.out.println(">> 생성자 실행");
       
    }
	public void init(ServletConfig config) throws ServletException {
		//서블릿 객체가 처음 생성된 후 최초로 한 번! 실행됨
		//초기와 작업 등을 처리할 때 사용
        System.out.println(">> init() 실행");

	}

	public void destroy() {
		// 서블릿 객체가 내려갈 때 (소멸될 때) destroy() 호출되고 삭제됨 딱 한 번!
		//사용된 자원 반납 등의 작업 처리
        System.out.println(">> destroy ()실행");

	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> service() 실행================");
		//요청정보를 확인해서 get, post 여부에 따라 분기 처리
		System.out.println("request.getMethod() : " + request.getMethod());
		if(request.getMethod().equalsIgnoreCase("get")) { //IgnoreCase --> 대소문자 구별 안함
			doGet(request, response);
		}else if( request.getMethod().equalsIgnoreCase("post")) {
			doPost(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get 방식 요청이 있을 때 호출되는 메소드 
		//request : 요청정보(클라이언트에서 보내온 정보, 데이터)
		//response : 응답정보(요청에 따른 결과를 전달할 정보, 데이터)
		//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("<h1>Hello</h1>");
		System.out.println(">> doGet() 실행");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
        System.out.println(">> doPost() 실행");

	}

}
