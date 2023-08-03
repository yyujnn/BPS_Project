package kr.smhrd.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.BoardDAO;
import kr.smhrd.model.BoardVO;
import kr.smhrd.model.MemberVO;

public class BoardRegisterService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String project_name = request.getParameter("project_name");
		String post_title = request.getParameter("post_title");
		String post_detail = request.getParameter("post_detail");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("userid");
		
		
		
		
		BoardVO vo = new BoardVO();
		vo.setProject_name(project_name);
		vo.setPost_title(post_title);
		vo.setPost_detail(post_detail);
		vo.setPost_writer(user_id);
		
		// dao에 메소드사용 register(vo) : vo 담아서
		BoardDAO dao = new BoardDAO();
		dao.register1(vo);

		return null;
	}
}
