package com.bc.model.command;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//1. DB 연결하고 데이터 가져오기
		List<EmployeeVO> list = DAO.getList();
		
		//2. 응답페이지(list.jsp)에 전달(request 객체에 속성값으로 전달)
		request.setAttribute("list", list);
		
		//3. 응답페이지 전환(list.jsp 에게)
//		request.getRequestDispatcher("list.jsp").forward(request, response);
		//위에서 하는 게 아니라 return 으로 함
		
		//응답페이지 정보만 리턴
		return "list.jsp";
	}

}
