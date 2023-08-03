package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.MemberDAO;
import kr.smhrd.model.MemberVO;

public class LoginService implements Command {
	// FrontController의 업무를 보조하는 역할
	// POJO
	// Plain Old Java Object

	public String excute(HttpServletRequest request, HttpServletResponse response)	throws IOException {

		// 2. 요청받은 데이터 꺼내오기(email, pw 2개)
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");

		// 3. 데이터들을 하나로 묶는 작업
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		vo.setPw(pw); 

		// 4. DAO 생성
		MemberDAO dao = new MemberDAO();

		// 5. DAO안에 login 기능 수행
		MemberVO mvo = dao.login(vo);

		// 6. 로그인 성공했다면 session 영역에 로그인 정보(email, tel, address) 저장
		if (mvo != null) {
			// Servlet ==> session 내장객체일까요? --> 아니여.
			// session 반드시 꺼내요기!!!!
			HttpSession session = request.getSession();
			session.setAttribute("member", mvo);

		}
		
		// 7. main.jsp로 sendRedirect 방식으로 이동
		return "firstPage.jsp";

	}



}
