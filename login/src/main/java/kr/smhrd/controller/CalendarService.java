package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.CalendarDAO;
import kr.smhrd.model.CalendarVO;

public class CalendarService implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("userid");
		
		CalendarVO vo = new CalendarVO();
		vo.setUser_id(user_id);
		
		System.out.println(user_id);
		
		CalendarDAO dao = new CalendarDAO();
		List<CalendarVO> calendar = dao.calendarList(vo);
		

		request.setAttribute("calendarList", calendar);

		return "calendar.jsp";
	}
}
