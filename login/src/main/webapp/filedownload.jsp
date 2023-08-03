<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="kr.smhrd.model.FileVO" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드</title>
</head>
<body>


		<%
		    String directory = application.getRealPath("/upload/");
		    FileVO vo2 = (FileVO) request.getAttribute("vo2");
		    String downloadLink = "";
		    String filename = "";
		    if(vo2 != null){
		        filename = vo2.getReal_file_name();
		        String encodedFilename = java.net.URLEncoder.encode(filename, "UTF-8");
		        downloadLink = request.getContextPath() + "/downloadAction.do?file=" + encodedFilename;
		    }
		    out.write("<a href=\"" + downloadLink + "\">" + filename + "</a><br>");
		%>

		

        
</body>
</html>