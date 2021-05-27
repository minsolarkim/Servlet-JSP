package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup") //2--@WebServlet("/ ") < 안에 WebContent밑에 요청 들어오면 처리할 파일
public class Ex04 extends HttpServlet{ //1--extends먼저 하고
	
	//3--ctrl + spacebar doGet 오버라이드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//4--req -> request, resp -> reponse  변수 이름은 사실 마음대로 해도됨
		
		/*복붙
		request 객체(인스턴스)로부터 파라미터 값 추출
		1. getParameter(파라미터명) : 하나의 파라미터 값 추출
		2. getParameterValues(파라미터명) : 배열형태 값 추출(체크박스 등)
						배구, 야구 , 축구 같이 '같은 파라미터명'으로 넘어온 것은 것은 배열로 넘겨받음 
		3. getParameterMap() : 값을 String 배열이 아닌 Map형태로 받겠다 ( 잘 안씀)(이런것도 있다)
		4. getParameterNames() : 파라미터명 확인시 사용
		 * ******/
		
		//전달받은 회원가입 정보를 추출해서 회원가입 정보를 작성 후 응답처리
		//요청정보 추출
		//파라미터 명칭은 대소문자 구별함!! --- 정확하게 입력해줘야함
		String name = request.getParameter("name");//4--요청값 받아주기?
		System.out.println("name : - " + name + "-"); //5--잘 받아왔는지 확인('-'해주는 이유 : 아무것도 안 들어왔을까봐)
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		//취미(hobby) 값 추출
//		String hobby =  request.getParameter("hobby"); //--> string으로 받아짐
		//다시 해본다 getParameterValues로 
		String[] hobby = request.getParameterValues("hobby"); //--> 배열로 받아짐
		
		//서버 콘솔에 값 출력
		System.out.println("-----------------------");
		System.out.println("name : - " + name + "-"); 
		System.out.println("id : - " + id + "-"); 
		System.out.println("pwd : - " + pwd + "-"); 
		System.out.println("email : - " + email + "-");
		
//		System.out.println("hobby : - " + hobby + "-"); //문제점! 다중 선택 가능한데 하나로만 받아진다!!
		System.out.println("hobby : - " + Arrays.toString(hobby) + "-"); //이렇게 하면 값 확인은 가능하다
//		 ㄴ - [영화, 독서]- 이렇게 출력됨
//		System.out.println("hobby 첫번째 : " + hobby[0]); //이렇게 하나씩 가져올 수 도 있다 
		
		
		//=========================================
		//클라이언트(브라우저) 쪽으로 응답 처리 
		// 1-- 먼저 인코딩 설정해주기 charset으로 
//		response.getWriter(); //이렇게 하면 인코딩 안됨
		response.setContentType("text/html;charset=UTF-8"); //문자셋 지정 (한글처리) 제일 먼저 해주기
//		response.getWriter();
		PrintWriter out = response.getWriter();
		out.println("<h2>회원가입정보</h2>");
		out.println("<ul style='color:green'>");
		out.println("<li>이름 : " + name+ "</li>");
		out.println("<li>아이디 : " + id+ "</li>");
		out.println("<li>암호 : " + pwd+ "</li>");
		out.println("<li>이메일 : " + email+ "</li>");
		
		//선택된 취미 정보
		out.println("<li>취미: ");
		if(hobby == null) {
			out.write("선택사항 없음");
		}else {
			for(String str : hobby) {
				out.write(str + "&nbsp;&nbsp;");
			}
		}
		out.println("</li>");
		out.println("</ul>");
	
		
		
		
		
		} 
	

}
