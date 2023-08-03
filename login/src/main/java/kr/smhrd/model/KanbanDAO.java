package kr.smhrd.model;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class KanbanDAO {

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

	SqlSession session = null;

	public void Project(KanbanVO vo) {
		try {
			session = sqlSessionFactory.openSession(true);
			session.insert("Project", vo);
		} finally {
			session.close();
		}

	}

	public KanbanVO selectKan(KanbanVO vo) {
		KanbanVO kan = null;
		try {
			session = sqlSessionFactory.openSession();
			kan = session.selectOne("selectKan", vo);
		} finally {
			session.close();
		}
		return kan;
	}

}