package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.BoardDAO;

public class BoardRemoveService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		   HttpSession session = request.getSession();
		      int post_id = (int) session.getAttribute("id");
		      String pj_name = (String)session.getAttribute("project_name");
		      BoardDAO dao = new BoardDAO();
		      dao.remove(post_id);
		      
		      // 삭제 성공후 다시 리스트 페이지로 돌아가기 (redirect)
//		      return "redirect:/BoardRemove.do";
		      return "BoardList.do?projectName="+pj_name;
		   

	}

}
