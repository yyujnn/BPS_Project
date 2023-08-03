package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.CalendarDAO;
import kr.smhrd.model.CalendarVO;

public class RegisterService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {
		
		
		String cd_title = request.getParameter("calendar_title");
		String cd_place = request.getParameter("calendar_place");
		String cd_start_date = request.getParameter("calendar_start_date");
		String cd_end_date = request.getParameter("calendar_end_date");
		String cd_content = request.getParameter("cd_content");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("userid");
		
		CalendarVO vo = new CalendarVO();
		vo.setUser_id(user_id);
		vo.setCd_title(cd_title);
		vo.setCd_start_date(cd_start_date);
		vo.setCd_end_date(cd_end_date);
		vo.setCd_place(cd_place);
		vo.setCd_content(cd_content);
		

		
		CalendarDAO dao = new CalendarDAO();
		int row = dao.register(vo);
		
		
		if(row>0) {
			return null;
			
		}
		else {
			return "redirect:/GoMain.do";
		}
		
		
	}

}
