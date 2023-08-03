package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.BoardDAO;
import kr.smhrd.model.BoardVO;
import kr.smhrd.model.CommVO;
import kr.smhrd.model.FileVO;
import kr.smhrd.model.KanbanVO;

public class BoardgetService implements Command{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));  

		// session에 받아온 id값 저장.  
		HttpSession session = request.getSession();
		session.setAttribute("id", id); // String id 값을 받아와서 "id" 에 담음 => /commReg 서블릿에서 받는다
		System.out.println(id);

		
		BoardDAO dao = new BoardDAO();		
		BoardVO vo = dao.get(id); // get- selectOne 해서 한 행을 가져옴=> vo
		
		
		// id값 = ${vo.post_id}를 매개변수로 getComm 메소드 사용하고 가져온 vo1객체
		List<CommVO> list = dao.getComm(id);
		 
		FileVO vo2 = dao.getFile(id);
		
		KanbanVO show = (KanbanVO)session.getAttribute("show");
		
		request.setAttribute("show", show);
		// 객체바인딩
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		request.setAttribute("vo2", vo2);
	
		return "boardpost.jsp";		
	}

}
