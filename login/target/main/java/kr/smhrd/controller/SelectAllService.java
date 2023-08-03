package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.MemberDAO;
import kr.smhrd.model.MemberVO;

public class SelectAllService implements Command {

	public String excute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		

		// 1. DAO 생성하기
		MemberDAO dao = new MemberDAO();
		// 2. dao가 가지고 있는 전체 조회하기 기능 수행
		// ----> 결과값을 받아올 수 있음!!!
		List<MemberVO> list = dao.selectAll();
		// 3. 결과값을 request scope에 저장
		request.setAttribute("list", list);
		// 4. select.jsp로 forward 방식으로 이동
		return "select.jsp";
	}

}
