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
			// 1. connection(sqlsession) 빌려오기
			session = sqlSessionFactory.openSession(true);
			// 2. 사용하기
			// mapper 파일로 보내줘야하는 데이터가 있었을 경우에 매개변수 2개짜리 사용
			// 보내줘야하는 데이터가 없다면 매개변수 1개짜리 사용
			// insert(mapper파일에서 사용하고 싶은 sql구문 id값, 보내줘야하는 데이터)
			row = session.insert("join", vo);
		} finally {
			// TODO: handle finally clause
			// 3. 반납하기
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

			// 2. session 사용하기
			// 로그인 기능 수행 sql구문?
			// SELECT EMAIL, TEL, ADDRESS FROM WEB_MEMBER
			// WHERE EMAIL = ? AND PW = ?
			mvo = session.selectOne("login", vo);
		} finally {
			// 3. session 반납하기
			session.close();
		}
		// 4. 결과값 LoginService로 반환하기

		return mvo;

	}
	
	public List<MemberVO> selectAll() {

		SqlSession session = null;
		List<MemberVO> list = null;
		try {
			// 1. session 빌려오기
			sqlSessionFactory.openSession();
			// 2. session 사용하기
			list = session.selectList("selectAll");
		} finally {
			// 3. session 반납하기
			session.close();
		}
		// 4. 결과값 반환
		return list;

	}

}
