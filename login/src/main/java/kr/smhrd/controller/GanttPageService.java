package kr.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.GanttVO;
import kr.smhrd.model.MemberDAO;
import kr.smhrd.model.MemberVO;

public class GanttPageService implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		String USER_ID = (String) session.getAttribute("userid"); // 세션에서 사용자 아이디 가져오기

		MemberDAO dao = new MemberDAO();
		List<GanttVO> ganttList = dao.gantt(USER_ID);
		request.setAttribute("ganttList", ganttList);
		System.out.println(USER_ID);
		
		return "ganttpage.jsp";

	}

}
