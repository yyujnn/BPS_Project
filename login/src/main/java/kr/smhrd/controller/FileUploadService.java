package kr.smhrd.controller;

import java.io.IOException;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.model.FileDAO;

public class FileUploadService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			HttpSession session1 = request.getSession();
			HttpSession session = request.getSession();
		 
	      int post_id = (int) session1.getAttribute("id");
	      String pj_name = (String)session.getAttribute("project_name");
	      ServletContext application = request.getServletContext();
	      String directory = application.getRealPath("/upload/");
	      int maxSize = 1024 * 1024 * 100;
	      String encoding = "UTF-8";
	      
	      System.out.println("프로젝트 이름" + pj_name);
	      
	      MultipartRequest multipartRequest
	      = new MultipartRequest(request, directory, maxSize, encoding,
	            new DefaultFileRenamePolicy());
	      
	      String filename = multipartRequest.getOriginalFileName("file");
	      String realfilename = multipartRequest.getFilesystemName("file");
	      
	      new FileDAO().upload(filename, realfilename, post_id);
	      
	      
	      request.setAttribute("pj_name", pj_name);
	      
//	      return "redirect:/BoardWrite.do"; 
//	      return null;
	      return "BoardList.do?projectName="+pj_name;

	}

}
