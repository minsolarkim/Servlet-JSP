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

//@WebServlet("/sungjuk")
public class Ex05_2 extends HttpServlet{
	
	//doGet() 오버라이드
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//여기서 할 일 : 전달받은 데이터를 연산처리 후 결과를 응답
		//1. 전달받은 파라미터 값 추출
		//2. 연산처리(총점, 평균 구하기)
		//3. 응답처리(브라우저=클라이언트 쪽으로 출력)
		
		//1. 전달받은 파라미터 값 추출
		String name =  req.getParameter("name");
		System.out.println("name : -" + name + "-");
		String kor = req.getParameter("kor");
		int iKor = Integer.parseInt(kor);
		String eng = req.getParameter("eng");
		int iEng = Integer.parseInt(eng);
		String math = req.getParameter("math");
		int iMath = Integer.parseInt(math);
		System.out.println("kor : -" + kor + "-");
		System.out.println("eng : -" + eng + "-");
		System.out.println("math : -" + math + "-");
		
		//2. 연산처리(총점, 평균 구하기)
		int total = iKor + iEng + iMath;
		double avg =  total/3.0;
		double avg2 = avg*100/100.0;
		System.out.println("total : -" + total + "-");
		System.out.println("avg : -" + avg2 + "-");
		
		//3. 응답처리(브라우저=클라이언트 쪽으로 출력)

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out =  resp.getWriter();
		out.println("<h3>성적처리 결과</h3>\r\n"
				+ "	<table border style='border-collapse:collapse'>\r\n"
				+ "		<tr>\r\n"
				+ "			<th>이름</th>\r\n"
				+ "			<td>"+name+"</td>\r\n"
				+ "		</tr>\r\n"
				+ "		<tr>\r\n"
				+ "			<th>국어</th>\r\n"
				+ "			<td>"+kor+"</td>\r\n"
				+ "		</tr>\r\n"
				+ "		<tr>\r\n"
				+ "			<th>영어</th>\r\n"
				+ "			<td>"+eng+"</td>\r\n"
				+ "		</tr>\r\n"
				+ "		<tr>\r\n"
				+ "			<th>수학</th>\r\n"
				+ "			<td>"+math+"</td>\r\n"
				+ "		</tr>\r\n"
				+ "		<tr>\r\n"
				+ "			<th>총점</th>\r\n"
				+ "			<td>"+total+"</td>\r\n"
				+ "		</tr>\r\n"
				+ "		<tr>\r\n"
				+ "			<th>평균</th>\r\n"
				+ "			<td>"+avg2+"</td>\r\n"
				+ "		</tr>\r\n"
				+ "		\r\n"
				+ "	</table>");
		
		out.println("<h3>성적처리 결과</h3>");
		
	}

	
}
