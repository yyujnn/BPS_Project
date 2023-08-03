package kr.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.GanttVO;
import kr.smhrd.model.MemberDAO;
import kr.smhrd.model.MemberVO;

public class GanttUpdateService implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String startDate = request.getParameter("start_date");

		int duration = 0;
		if (request.getParameter("duration") != null) {
			duration = Integer.parseInt(request.getParameter("duration"));

		}

		String type = request.getParameter("type");
		String parent = null;
		if (request.getParameter("parent") == null) {
			parent = "0";
		} else {
			parent = request.getParameter("parent");
		}

		BigDecimal progress = BigDecimal.ZERO;
		if (request.getParameter("progress") != null) {
			progress = new BigDecimal(request.getParameter("progress"));
		}

		// USER_ID 부분
		HttpSession session = request.getSession();
		String USER_ID = (String) session.getAttribute("USER_ID");

		// 받아온 값들을 GanttVO 객체에 담기
		GanttVO vo = new GanttVO();
		vo.setGANTT_ID(id);
		vo.setTITLE(title);
		vo.setSTART_DATE(startDate);
		vo.setDUR(duration);
		vo.setGT_TYPE(type);
		vo.setGT_PARENT(parent);
		vo.setPROGRESS(progress);
		vo.setUSER_ID(USER_ID);

		System.out.println("id = " + id);
		System.out.println("title = " + title);
		System.out.println("startDate = " + startDate);
		System.out.println("duration = " + duration);
		System.out.println("type = " + type);
		System.out.println("parent = " + parent);
		System.out.println("progress = " + progress);
		System.out.println(USER_ID);

		// DAO를 이용해서 데이터베이스에 추가
		MemberDAO dao = new MemberDAO();
		dao.gtupdate(vo);

		return "ganttreal.jsp";

	}

}
