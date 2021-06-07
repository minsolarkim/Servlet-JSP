package com.bc.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;


//frontcontroller는 모든 처리를 한 공간에서 한다?
@WebServlet("/controller")
public class FrontController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() 실행~~");
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		
		if ("all".equals(type)) {
			//1. DB 연결하고 데이터 가져오기
			List<EmployeeVO> list = DAO.getList();
			
			//2. 응답페이지(list.jsp)에 전달(request 객체에 속성값으로 전달)
			request.setAttribute("list", list);
			
			//3. 응답페이지 전환(list.jsp 에게)
			request.getRequestDispatcher("list.jsp").forward(request, response);
		} 
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
