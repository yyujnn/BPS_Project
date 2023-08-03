package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.CalendarDAO;
import kr.smhrd.model.CalendarVO;
import kr.smhrd.model.GanttVO;
import kr.smhrd.model.MemberDAO;
import kr.smhrd.model.MemberVO;

public class LoginService implements Command {
	// FrontController의 업무를 보조하는 역할
	// POJO
	// Plain Old Java Object

	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 2. 요청받은 데이터 꺼내오기(email, pw 2개)
		String email = request.getParameter("USER_ID");
		String pw = request.getParameter("USER_PW");

		// 3. 데이터들을 하나로 묶는 작업
		MemberVO vo = new MemberVO();
		vo.setUSER_ID(email);
		vo.setUSER_PW(pw);

		// 4. DAO 생성
		MemberDAO dao = new MemberDAO();
		CalendarDAO dao2 = new CalendarDAO();
		CalendarVO vo2 = new CalendarVO();
		vo2.setUser_id(email);

		// 5. DAO안에 login 기능 수행
		MemberVO mvo = dao.login(vo);
		String user_id = mvo.getUSER_ID();
		List<GanttVO> ganttList = dao.gantt(user_id);
		List<CalendarVO> calendar = dao2.calendarList(vo2);

		// 6. 로그인 성공했다면 session 영역에 로그인 정보(email, tel, address) 저장
		if (mvo != null) {
			request.setAttribute("member", mvo);
			request.setAttribute("ganttList", ganttList);
			request.setAttribute("calendarList", calendar);
			
			HttpSession session = request.getSession();
			session.setAttribute("member", mvo);
			session.setAttribute("userid", user_id); // userId는 로그인한 사용자의 ID 값
			session.setAttribute("ganttList", ganttList);
			session.setAttribute("calendarList", calendar);
			
			return "redirect:/Gofirst.do";
		} else {
			return "redirect:/Gologin.do";
			
		}

	}

}