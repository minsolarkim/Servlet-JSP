package com.bc.model;

import java.util.List;

import com.bc.model.vo.EmployeeVO;
import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;

public class DAO {

	//직원 전체 목록 조회
	public static List<EmployeeVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.list");
		ss.close();
		return list;
	}
	
	//이름으로 검색
	public static List<EmployeeVO> fullnameList(String fullname) {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.fullnameList", fullname); //전달받은 값 넣어줘야 한다
		ss.close();
		return list;
		//위에 list코드와 비슷하지만 파라미터값 있는 것과 HR.다음 값 달라졌고 전달받은 값 넣어줘야함
	}
	
	
	
}
