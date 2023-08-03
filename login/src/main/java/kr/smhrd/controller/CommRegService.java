package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.BoardDAO;
import kr.smhrd.model.CommVO;

public class CommRegService implements Command{

	public String execute(HttpServletRequest request, HttpServletResponse response)
									throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int post_id = (int)session.getAttribute("id"); // 여기서 "id" 값 받아오기
		String cm_detail = request.getParameter("cm_detail");
		String user_id = (String) session.getAttribute("userid");
		
		
		// 어차피 다 넣을 거니까 매개변수 전부 있는 생성자
		CommVO vo = new CommVO();
		vo.setPost_id(post_id);
		vo.setCm_detail(cm_detail);
		vo.setCm_writer(user_id);
		
		// dao에 메소드사용 register(vo) : vo 담아서
		BoardDAO dao = new BoardDAO();
		dao.CommReg(vo);
		
		
		return null;
	}

}
