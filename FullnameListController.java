package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/fullnameList")
public class FullnameListController extends HttpServlet {
	//이것도 ListController.java랑 비슷한 데 다른 점 ------> post
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); //post는 꼭 한글깨짐 확인해주자!!!!!
		
		//1. 파라미터 값 확인(추출)
		String fullname = req.getParameter("fullname");
		
		//2. DB에서 데이터 가져오기
		List<EmployeeVO> list = DAO.fullnameList(fullname);
		
		//3. DB 데이터 request scope에 저장
		req.setAttribute("list", list);
		
		//4. fullnameList.jsp 페이지로 위임(전가) 처리
		req.getRequestDispatcher("fullnameList.jsp").forward(req, resp);
		
	}
	
}
