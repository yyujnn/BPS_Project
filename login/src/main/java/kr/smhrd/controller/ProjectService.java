package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.MemberDAO;
import kr.smhrd.model.ProjectVO;

@WebServlet("/project")
public class ProjectService implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		HttpSession session = request.getSession();
//		String USER_ID = request.getParameter("USER_ID"); // 로그인 폼에서 사용자가 입력한 아이디
//		session.setAttribute("USER_ID", USER_ID); // 사용자 아이디를 세션에 저장
//		
		HttpSession session = request.getSession();
		String USER_ID = (String) session.getAttribute("userid"); // 세션에서 사용자 아이디 가져오기


		MemberDAO dao = new MemberDAO();
		List<ProjectVO> projectList = dao.project(USER_ID);
		request.setAttribute("projectList", projectList);

		return "test.jsp";

	}

}
