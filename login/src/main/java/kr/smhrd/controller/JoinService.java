package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.MemberDAO;
import kr.smhrd.model.MemberVO;

public class JoinService implements Command {
	
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 2. 요청받은 데이터들을 꺼내오기
		// --> 4개를 전부 꺼내오기
		String USER_ID = request.getParameter("USER_ID");
		String USER_PW = request.getParameter("USER_PW");
		String USER_NAME = request.getParameter("USER_NAME");
		

		// 3. 데이터들을 하나로 묶어주기
		MemberVO vo = new MemberVO(USER_ID, USER_PW, USER_NAME);

		// 4. 데이터베이스에 데이터를 추가하기
		// --> 데이터베이스에 접근해야한다!!! >> DAO 사용
		// 4-1) DAO 도구 불러오기
		MemberDAO dao = new MemberDAO();
		// 4-2) 회원가입 기능 사용하기
		int row = dao.join(vo);

		// 5) 흐름 제어
		if (row > 0) {
			// 성공했다면 join_success.jsp로 forward 방식으로 이동
			// 5-1) request scope에 email데이터 저장해서 보내기
			request.setAttribute("USER_NAME", USER_NAME);
			return "redirect:/Gologin.do";


		} else {
			// 실패했다면 main.jsp로 redirect 방식으로 이동
			return "redirect:/Gologin.do";
		}
		
	}

}

