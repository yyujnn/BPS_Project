package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.BoardDAO;
import kr.smhrd.model.BoardVO;
import kr.smhrd.model.KanbanDAO;
import kr.smhrd.model.KanbanVO;

public class BoardListService implements Command{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pj_name= request.getParameter("projectName");
		
		HttpSession session = request.getSession();
		session.setAttribute("project_name", pj_name);
		
		String p_name = (String)session.getAttribute("project_name");
		
		BoardVO vo = new BoardVO();
		vo.setProject_name(p_name);
		
		KanbanVO kvo = new KanbanVO();
		kvo.setProject_name(p_name);
		
		KanbanDAO kdao = new KanbanDAO();
		KanbanVO show = kdao.selectKan(kvo);
		
		session.setAttribute("show", show);
		
		request.setAttribute("show", show);
		
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.getList(vo);  //dao객체로 getlist(db에서 리스트 꺼내오기 수행)사용
		// 객체 바인딩
		request.setAttribute("list", list);  // 그 list를 request에 setattribute "list"라는 이름 붙임
		// jsp로 포워딩
		System.out.println(list);
		
		return "workspace.jsp";
	}

}
