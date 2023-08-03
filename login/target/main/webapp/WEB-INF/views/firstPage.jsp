<%@page import="kr.smhrd.model.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 지시자 사용해서 jstl 라이브러리 안쪽에서도 어떤 도구를 사용할 것인지 지정 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset ="UTF-8">
    <link rel="icon" type="image/png" href="assets/img/logoImg.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>SOORE</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
        name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="assets/css/light-bootstrap-dashboard.css" />
</head>

<body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="firstPage.jsp">
                        <img src="assets/img/logoImg.png" id="logoImg"/>
                        <img src="https://fontmeme.com/permalink/230419/327c0ac08b293c5fe4fa56e3406a8133.png" alt="radio-canada-font" border="0"></a>
                </div>
                <ul class="nav">
                    <li>
                        <p style="font-size: 10px; margin-left: 20px; color: gray;">USER</p>
                    </li>
                    <li>
                        <div id="userInfo">
                            회원 정보
                        </div>
                    </li>
                	<li>
                    	<p style="font-size: 10px; margin-left: 20px; color: gray;">MENU</p>
                	</li>
                    <li>
                       	<a class="nav-link">
                           	<i class="nc-icon nc-chart-pie-35"></i>
                           	<p>메인 페이지</p>
                       	</a>
                   	<li>
						<a class="nav-link" href="Gantt.html">
   	                        <i class="nc-icon nc-circle-09"></i>
    	                       <p>간트차트</p>
	                    </a>
	                 </li>
	                 <li>
	                    <a class="nav-link" href="Calendar.html">
	                          <i class="nc-icon nc-notes"></i>
	                         <p>캘린더</p>
	                    </a>
	                    </li>
	                    <li>
	                        <a class="nav-link" href="WorkList.html">
	                            <i class="nc-icon nc-paper-2"></i>
	                            <p>업무리스트</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav-link" href="Invite.html">
	                            <i class="nc-icon nc-atom"></i>
	                            <p>초대 관리</p>
	                        </a>
	                    </li>
                </ul>
                
            </div>
        </div>

        <div class="main-panel">
                <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                    <div class="container-fluid">
                        <p class="navbar-brand"></p>
                        <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                        aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                </div>
        </nav>
            <div id="container">
                <a href="Calendar.html" style="color: black;">
                <div id="Calendar">
                </div>
            </a>
            <a href="WorkList.html" style="color: black;">
                <div id="TodoList">
                </div>
            </a>
            <a href="WorkList.html" style="color: black;">
                <div id="TodoList1">
                </div>
            </a>
                <a href="Calendar.html" style="color: black;">
                <div id="Calendar1">
                </div>
            </a>
                <div id="footer">
                </div>
            </div>
        </div>


<!--   Core JS Files   -->
<script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="assets/js/light-bootstrap-dashboard.js" type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>
<script type="text/javascript">
</script>
</body>

</html>