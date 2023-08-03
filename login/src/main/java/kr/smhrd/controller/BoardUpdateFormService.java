package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.BoardDAO;
import kr.smhrd.model.BoardVO;

public class BoardUpdateFormService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
	      int post_id = (int) session.getAttribute("id");

	      
	      BoardDAO dao = new BoardDAO();
	      BoardVO vo = dao.get(post_id); // getController에서 썼던 것 처럼 
	                              // update.jsp에다 보내줄 BoardVO 구해오는 과정

	      request.setAttribute("vo", vo);
	      
	      
	      return "update.jsp";

	}

}
