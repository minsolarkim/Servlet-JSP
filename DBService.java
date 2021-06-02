package com.bc.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


// MyBatis 사용해서 작업할 SqlSession을 만들어 줄 
// SqlSessionFactory 객체 생성을 위한 클래스 -- 공장 객체 하나만 있으면 됨
public class DBService {
	private static SqlSessionFactory factory; //private 처리해서 외부에서 쉽게 못 쓰게 하기
	
	//static 초기화문
	static {
		try {
			//아래꺼 뜯어보면 이렇게 된다 
//			String config = "com/bc/mybatis/config.xml";
//			Resources.getResourceAsReader(config); //text를 읽어들일 수 있는 reader 
//			Reader reader = Resources.getResourceAsReader(config); //text를 읽어들일 수 있는 reader 
			
//			SqlSessionFactoryBuilder factoryBuilder = new SqlSessionFactoryBuilder(); //객체 생성
//			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
//			SqlSessionFactory sqlSessionFactory = factoryBuilder.build(reader);
			//이렇게 세 줄이 나올 게 아니라
//			SqlSessionFactoryBuilder factoryBuilder = new SqlSessionFactoryBuilder().build(reader); 
//			factoryBuilder = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader(com/bc/mybatis/config.xml));
			
			//한 번만 만들면 돼서 한 줄로 작성해버린 것
			//---------------------------------
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/bc/mybatis/config.xml"));
				//이 메소드 중에 build(Reader) 등 받아서 쓸 수 있다
				//최종적으로 Reader 객체가 오고 저 안에는 문자열 오면 된다 ""
				//Resources 중에서 myBatis 꺼 써야함
				//config파일과 연결해줘야 DB연동 가능하다
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	//외부에서 요청하면 factory 줌 // return 형식 SqlSessionFactory 
}
