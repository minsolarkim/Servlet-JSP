package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class DeptListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전달받은 파라미터 값으로 DB데이터 조회 후 페이지 이동
		//1. 파라미터 값 확인(추출)
		String deptno = request.getParameter("deptno");
		if (deptno == null) {
			return "dept.jsp";
		}
		
		//1. DB 연결하고 데이터 가져오기
		List<EmployeeVO> list = DAO.deptList(deptno);
		
		//2. 응답페이지(list.jsp)에 전달(request 객체에 속성값으로 전달)
		request.setAttribute("list", list);
		
		//응답페이지 정보만 리턴
		return "deptList.jsp";
	}
	//이게 없으면 넘어가긴 하는데 데이터가 없다.

	
}
