package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.CalendarDAO;
import kr.smhrd.model.CalendarVO;

public class CalendarDetailService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cd_title = request.getParameter("cd_title");

		CalendarVO vo = new CalendarVO();
		vo.setCd_title(cd_title);

		System.out.println(cd_title);

		CalendarDAO dao = new CalendarDAO();
		List<CalendarVO> calendar2 = dao.calendarDetail(vo);

		HttpSession session = request.getSession();

		session.setAttribute("calendar2", calendar2);
		for (CalendarVO vo2 : calendar2) {
			System.out.println(vo2.getCd_title());
			System.out.println(vo2.getCd_start_date());
			System.out.println(vo2.getCd_end_date());
			System.out.println(vo2.getCd_place());
			System.out.println(vo2.getCd_content());
		}

		return "calendar.jsp";
	}

}
