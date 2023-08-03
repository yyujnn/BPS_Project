package kr.smhrd.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class downloadAction implements Command {
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fileName = request.getParameter("file");
        String directory = request.getServletContext().getRealPath("/upload/");
        File file = new File(directory, fileName);

        if (!file.exists()) {
            throw new RuntimeException("File not found");
        }

        String mimeType = request.getServletContext().getMimeType(file.toString());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }

        response.setContentType(mimeType);
        response.setContentLength((int)file.length());

        String downloadName = null;
        if (request.getHeader("user-agent").indexOf("MSIE") == -1) {
            downloadName = new String(fileName.getBytes("UTF-8"), "8859_1");
        } else {
            downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
        }
        
        response.setHeader("Content-Disposition", "attachment; filename=\"" + downloadName + "\"");

        FileInputStream in = new FileInputStream(file);
        ServletOutputStream out = response.getOutputStream();

        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = in.read(buffer)) != -1) {
            out.write(buffer, 0, bytesRead);
        }

        in.close();
        out.close();
		return null;
    }
}
