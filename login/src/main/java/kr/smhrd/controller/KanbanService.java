package kr.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.KanbanDAO;
import kr.smhrd.model.KanbanVO;

public class KanbanService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String company = request.getParameter("company");
	    String description = request.getParameter("description");
	    String start = request.getParameter("start");
	    String end = request.getParameter("end");
	    
	    HttpSession httpSession = request.getSession();
		String userId = (String) httpSession.getAttribute("userid");
		
	    
	    KanbanVO vo = new KanbanVO();
	    vo.setUser_id(userId);
	    vo.setProject_com(company);
	    vo.setProject_name(description);
	    vo.setProject_start(start);
	    vo.setProject_end(end);
	    
	    
	    
	    KanbanDAO dao = new KanbanDAO();
	    dao.Project(vo);
	    
	    return null;
	}
}