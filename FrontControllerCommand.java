package com.bc.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.command.Command;
import com.bc.model.command.DeptCommand;
import com.bc.model.command.DeptListCommand;
import com.bc.model.command.FullnameCommand;
import com.bc.model.command.FullnameListCommand;
import com.bc.model.command.ListCommand;
import com.bc.model.vo.EmployeeVO;


//@WebServlet("/controller") //같은 명령을 처리하는 작업이 두 개면 오류 난다.
public class FrontControllerCommand extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() 실행~~");
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		//실질적으로 요청 구분할 수 있는 건 type값이다
		
		//interface 만들어 와서 
		Command command =null; //interface import해준다
		
		if ("all".equals(type)) {
			command = new ListCommand();
			
		} else if ("fullname".equals(type)) {
			command = new FullnameCommand();
			
		} else if ("fullnameList".equals(type)) {
			command = new FullnameListCommand();
		
		} else if ("dept".equals(type)) {
			command = new DeptCommand();
		
		} else if ("deptList".equals(type)) {
			command = new DeptListCommand();
		
		}
		
		//여기에 계속 추가해주면 된다
		
		String path = command.exec(request, response); //응답페이지다.
		request.getRequestDispatcher(path).forward(request, response);
		System.out.println(">> FrontController.deGet() 끝~~~");
		//이것도 한 번만 실행이 되니까 뒤로 빼준다.
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
