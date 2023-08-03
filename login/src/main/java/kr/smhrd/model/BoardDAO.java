package kr.smhrd.model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDAO {

	private static SqlSessionFactory sqlSessionFactory;

	static {
		try {
			String resource = "kr/smhrd/db/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			System.out.println("세션 연결 성공!");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<BoardVO> getList(BoardVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		List<BoardVO> list = session.selectList("getList", vo);
		session.close();
		return list;
	}

	public BoardVO get(int id) {
		SqlSession session = sqlSessionFactory.openSession();
		BoardVO vo = session.selectOne("get", id);
		session.close();
		return vo;
	}

	public List<CommVO> getComm(int id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<CommVO> vo = session.selectList("getComm", id);
		session.close();
		return vo;
	}

	// 게시글 등록 메소드
	SqlSession session = null;
	int row;

	public int register1(BoardVO vo) {
		try {
			session = sqlSessionFactory.openSession(true); // commit 자동
			row = session.insert("register1", vo); // "register" 라는 이름으로 mapper등록 하겠습니다 + 받아온 매개변수 vo 전달보낸다.

		} finally {
			session.close();
		}

		return row; // return 값은 검토용

	}

	// 첨부파일 getFile 메소드 - selectOne
	public FileVO getFile(int id) {
		session = sqlSessionFactory.openSession(true); // commit 자동
		FileVO vo = session.selectOne("getFile", id);
		session.close();
		return vo;
		
	}
	// 댓글 등록
	public void CommReg(CommVO vo) {
		try {
			session = sqlSessionFactory.openSession(true); // commit 자동
			row = session.insert("commReg", vo); // 받아온 매개변수 vo 전달보낸다.
			
		} finally {
			session.close();
		}
		
	}
	
	   // 게시글 수정
	   public void update(BoardVO vo) {
	      try {
	         session = sqlSessionFactory.openSession(true); // commit 자동
	         session.delete("update", vo);
	         
	      } finally {
	         session.close();      
	      }
	   
	   }
	   

	   // 게시글 삭제
	   public void remove(int post_id) {
	      try {
	         
	         session = sqlSessionFactory.openSession(); // commit 자동
	         
	         List<CommVO> vo = session.selectList("getComm", post_id);
	         int mentCount = vo.size();
	         
	         session = sqlSessionFactory.openSession(true); // commit 자동
	         List<FileVO> vo1 = session.selectList("getFileL", post_id);
	         int fileCount = vo1.size();
	         
	         if (mentCount>0 & fileCount>0) {
	            session.delete("mentRemove", post_id);
	            session.delete("fileRemove", post_id);
	            session.delete("remove", post_id);
	            
	         } else if (mentCount>0 & fileCount==0) {
	            session.delete("mentRemove", post_id);
	            session.delete("remove", post_id);
	            
	         } else if (mentCount==0 & fileCount>0) {
	            session.delete("fileRemove", post_id);
	            session.delete("remove", post_id);
	            
	         } else {
	            session.delete("remove", post_id);
	         }
	            session.commit();
	            
	      } catch(Exception e) {
	         session.rollback();
	      }

	         finally {
	         session.close();      
	      }
	   
	   }


}
