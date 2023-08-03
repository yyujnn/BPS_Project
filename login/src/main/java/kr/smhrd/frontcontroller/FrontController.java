package kr.smhrd.frontcontroller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.controller.BoardListService;
import kr.smhrd.controller.BoardRegisterService;
import kr.smhrd.controller.BoardRemoveService;
import kr.smhrd.controller.BoardUpdateFormService;
import kr.smhrd.controller.BoardUpdateService;
import kr.smhrd.controller.BoardgetService;
import kr.smhrd.controller.CalendarDetailService;
import kr.smhrd.controller.CalendarService;
import kr.smhrd.controller.CommRegService;
import kr.smhrd.controller.Command;
import kr.smhrd.controller.FileUploadService;
import kr.smhrd.controller.GanttInsertService;
import kr.smhrd.controller.GanttPageService;
import kr.smhrd.controller.GanttUpdateService;
import kr.smhrd.controller.JoinService;
import kr.smhrd.controller.KanbanService;
import kr.smhrd.controller.LoginService;
import kr.smhrd.controller.ProjectService;
import kr.smhrd.controller.RegisterService;
import kr.smhrd.controller.downloadAction;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HashMap<String, Command> map = null;

	@Override
	public void init() throws ServletException {
		map = new HashMap<>();
		map.put("Login.do", new LoginService());
		map.put("Join.do", new JoinService());
		map.put("Project.do", new ProjectService());
		map.put("GanttPage.do", new GanttPageService());
		map.put("GanttInsert.do", new GanttInsertService());
		map.put("GanttUpdate.do", new GanttUpdateService());
		map.put("kanban.do", new KanbanService());
		map.put("Calendar.do", new CalendarService());
		map.put("CalendarDetail.do", new CalendarDetailService());
		map.put("Register.do", new RegisterService());
		map.put("BoardList.do", new BoardListService());		
	    map.put("Boardget.do", new BoardgetService());
	    map.put("CommReg.do", new CommRegService());
	    map.put("downloadAction.do", new downloadAction());
	    map.put("BoardRegister.do", new BoardRegisterService());
	    map.put("BoardUpdateForm.do", new BoardUpdateFormService());
	    map.put("BoardUpdate.do", new BoardUpdateService());
	    map.put("BoardRemove.do", new BoardRemoveService());
	    map.put("FileUpload.do", new FileUploadService());

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
			finalpath = com.execute(request, response);
		}

		if (finalpath == null) {

		} else if (finalpath.contains("redirect:/")) {
			response.sendRedirect(finalpath.substring(10));

		} else {
			RequestDispatcher rd = request.getRequestDispatcher(finalpath);
			rd.forward(request, response);
		}

	}

}
