<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 보여지는 화면을 구성하지는 않을거임!!! -->
	<% // 스크립트릿 ---> jsp 안쪽에서 java 코드를 쓸 때 사용하는 기호!
	   // jsp 내장객체 ---> java 파일로 변환되는 순간 자동으로 생성되는 객체
	   // 내장객체
	   // 1) page 2) request 3)session 4)application 5)response
	   // 1. session을 무효화시키기
	   session.removeAttribute("member");
	   // ---> session에 저장되어 있는 데이터들 중 ! 특정 데이터를 삭제하는 방법
	   session.invalidate();
	   // ---> session에 저장되어 있는 데이터들을 전부 무효화 시키는 방법
	   
	   
	   // 2. main.jsp로 redirect 방식으로 이동하기
	   response.sendRedirect("main.jsp");
	   
	   
	   
	   
	   
	   
	%>

</body>
</html>