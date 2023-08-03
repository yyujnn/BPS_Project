<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	</head>
	<style>
		#Update > ul.actions {
			margin-top:10%;
		}
	</style>
	<body style="text-align: center;">

		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<ul class="actions vertical">
							<li><h1>환영합니다!</h1></li>
							<li>회원가입을 축하합니다.</li>
							<!-- request영역에 저장된 회원정보 중 이메일을 출력하시오. -->
							<li>메세지시스템의 새로운 이메일은 ${email}입니다.</li>
							<li><button onclick='location.href="main.jsp"'>시작하기</button></li>
						</ul>
					</nav>			
			</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
	</body>
</html>




<!-- 
 jsp : java server page
 jsp ==> 실행 ==> .java ==> .class ==> .html
 
 * jsp 파일에서 .java 파일로 변환
 ==> 내부적으로 생성되는 객체들이 존재
 
 : 내장객체(implicit object) ==> scope들은 전부 내장객체!
 ==> 따로 선언하지 않아도 바로 사용할 수 있는 객체
 
 < % % > : 스크립트릿(java 코드를 쓸 수 있는 공간) 
 < % = % > :표현식(java 코드 안에 선언해 놓은 변수, 메소드들을 화면에 출력하고 싶을 때 사용)
 < % @ % > : 지시자(jsp파일 내부에서 어떤 한글 인코딩, 어떤 라이브러리 사용 등등 선언하는 공간)
 -->


