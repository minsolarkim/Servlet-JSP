package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjuk")
public class Ex05 extends HttpServlet{
	
	//doGet() 오버라이드
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//여기서 할 일 : 전달받은 데이터를 연산처리 후 결과를 응답
		//1. 전달받은 파라미터 값 추출
		//2. 연산처리(총점, 평균 구하기)
		//3. 응답처리(브라우저=클라이언트 쪽으로 출력)
		
		//1. 전달받은 파라미터 값 추출
		String name = req.getParameter("name");
		String sKor = req.getParameter("kor");
		int kor = Integer.parseInt(sKor);
		//String -> int 바꾸는 거 -- Integer.parseInt();
//		String sEng = req.getParameter("eng");
//		String sMath = req.getParameter("math");
		int eng = Integer.parseInt(req.getParameter("eng"));
		int math = Integer.parseInt(req.getParameter("math"));
		
		int tot = kor + eng + math;
//		System.out.println("반올림 : " + Math.round((tot * 100/3.0)/100.0));
		//이렇게 해주면 반올림 처리 된 값을 가져올 수 있다.
		double avg = Math.round((tot * 100/3.0)/100.0);
		System.out.println("tot : " + tot);
		System.out.println("avg : " + avg);
		//tot / 3 에 100을 곱하는 게 아니라 tot에 먼저 100을 곱해야하는 거구나
		
		//3. 응답처리(브라우저 쪽으로)
		resp.setContentType("text/html;charset=utf-8");
		//ㄴ이건 사실 첫 줄에 해줘도 된다
		PrintWriter out = resp.getWriter();
		String str = " ";
		str += "<h3>성적처리결과</h3>";
		str += "<p>이름 : "+ name + "</p>";
		str += "<p>국어 : "+ kor + "</p>";
		str += "<p>영어 : "+ eng + "</p>";
		str += "<p>수학 : "+ math + "</p>";
		str += "------------------------";
		str += "<p>총점 : "+ tot + "</p>";
		str += "<p>평균 : "+ avg + "</p>";
		
		
		
		
		out.println(str);
		
		
		
		
		
		
		
		
		

		
	}

	
}
