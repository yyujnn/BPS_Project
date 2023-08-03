package kr.smhrd.model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CalendarDAO {

	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "kr/smhrd/db/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<CalendarVO> calendarList(CalendarVO vo) {
		SqlSession session = null;
		List<CalendarVO> calendar = null;
		try {
			session = sqlSessionFactory.openSession();
			calendar = session.selectList("calendarList", vo);
		} finally {
			session.close();
		}
		return calendar;
	}

	
	public int register(CalendarVO vo) {

		SqlSession session = null;
		int row = 0;
		
		try {
			session = sqlSessionFactory.openSession(true);
			row = session.insert("register",vo);
			
		} finally {
			session.close();
		}
		return row ;
		
		
	}
	
	public List<CalendarVO> calendarDetail(CalendarVO vo) {
		SqlSession session = null;
		List<CalendarVO> calendar2 = null;
		try {
			session = sqlSessionFactory.openSession();
			calendar2 = session.selectList("calendarDetail", vo);
		} finally {
			session.close();
		}
		return calendar2;
	}

}
