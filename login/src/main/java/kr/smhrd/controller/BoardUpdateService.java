package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.BoardDAO;
import kr.smhrd.model.BoardVO;

public class BoardUpdateService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 HttpSession session = request.getSession();
	      int post_id = (int)session.getAttribute("id");
	      String userid = (String)session.getAttribute("userid");
	      
	      String project_name = request.getParameter("project_name");
	      String post_title = request.getParameter("post_title");
	      String post_detail = request.getParameter("post_detail");
	      
	      
	      BoardVO vo = new BoardVO();
	      vo.setPost_id(post_id);
	      vo.setProject_name(project_name);
	      vo.setPost_title(post_title);
	      vo.setPost_detail(post_detail);
	      vo.setPost_writer(userid);
	      
	      
	      BoardDAO dao = new BoardDAO();
	      dao.update(vo);
	      // ✔ mapper - update 에서 where 절 조건으로 쓰이는 값이 set 절에 포함되면 
	      // 안된다고 해서 post_id는 set 절 (수정할 대상) 에 포함 시킬 수 없었음 
	      
	      //수정이 성공된 후 
//	      response.sendRedirect("/workspace/get?id="+post_id);  ==> 원래 이동하던 페이지, 어떻게 형식을 바꿔야 할지..
	      
	      return "Boardget.do?id="+post_id;  
	   


	}

}
