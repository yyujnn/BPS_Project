package kr.smhrd.frontcontroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.controller.Command;
import kr.smhrd.controller.JoinService;
import kr.smhrd.controller.LoginService;
import kr.smhrd.controller.SelectAllService;
import kr.smhrd.model.MemberDAO;
import kr.smhrd.model.MemberVO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	private HashMap<String, Command> map = null;

	@Override
	public void init() throws ServletException {
		map = new HashMap<>();
		map.put("Login.do", new LoginService());
		map.put("Join.do", new JoinService());
		map.put("SelectAll.do", new SelectAllService());

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String finaluri = uri.substring(cp.length() + 1);

		request.setCharacterEncoding("utf-8");

		String finalpath = null;
		Command com = null;

		if (finaluri.contains("Go")) {
			finalpath = finaluri.replaceAll("Go", "").toLowerCase().replaceAll(".do", ".jsp");
		} else {
			com = map.get(finaluri);
			finalpath = com.excute(request, response);
		}

		if (finalpath.contains("redirect:/")) {
			response.sendRedirect(finalpath.substring(10));

		} else {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/" + finalpath);
			rd.forward(request, response);
		}

	}

}
