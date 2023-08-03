package kr.smhrd.model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {

	// mybatis 파일을 읽어서 connection 객체 빌려오기 위해서 작성해야하는 코드
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

	public int join(MemberVO vo) {
		// 데이터베이스 연결 ~ 추가
		SqlSession session = null;
		int row = 0;
		try {
			session = sqlSessionFactory.openSession(true);
			row = session.insert("join", vo);
		} finally {
			session.close();
		}

		return row;

	}

	public MemberVO login(MemberVO vo) {
		SqlSession session = null;
		MemberVO mvo = null;
		try {
			// 1. session 빌려오기
			session = sqlSessionFactory.openSession(true);
			mvo = session.selectOne("login", vo);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		// 4. 결과값 LoginService로 반환하기

		return mvo;

	}

	public List<ProjectVO> project(String USER_ID) {

		SqlSession session = null;
		List<ProjectVO> list = null;

		try {
			session = sqlSessionFactory.openSession();
			list = session.selectList("test", USER_ID);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}

	public List<GanttVO> gantt(String USER_ID) {

		SqlSession session = null;
		List<GanttVO> list = null;

		try {
			session = sqlSessionFactory.openSession(true);
			list = session.selectList("gantt", USER_ID);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}

	public int gtlist(GanttVO vo) {

		SqlSession session = null;
		int row = 0;
		try {
			session = sqlSessionFactory.openSession(true);
			row = session.insert("gtlist", vo);
		} finally {
			session.close();
		}

		return row;
 
	}
	
	public int gtupdate(GanttVO vo) {

		SqlSession session = null;
		int row = 0;
		try {
			session = sqlSessionFactory.openSession(true);
			row = session.update("gtupdate", vo);
		} finally {
			session.close();
		}

		System.out.println(row);
		return row;

	}

}
