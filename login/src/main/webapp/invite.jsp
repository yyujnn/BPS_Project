<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/logoImg.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>SOORE</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <style>
		 .icon_side{
		    	width : 16px;
		 		height : 16px;
		 		margin-right : 5px;
		    }
	</style>
</head>

<body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="first.jsp">
                        <img src="assets/img/logoImg.png" id="logoImg" />
                        <img src="https://fontmeme.com/permalink/230419/234f3f0f39dbad0f4907a4e9073178d0.png"
                            alt="radio-canada-font" border="0" id="logo"></a>
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
                    <li >
	                    <a class="nav-link" href="main.jsp">
	                        <img alt="" src="assets/img/main.png" class="icon_side">
	                        <p>Main</p>
	                    </a>
                    </li>
                    <li>
                        <a class="nav-link" href="GanttPage.do">
                            <img alt="" src="assets/img/gantt.png" class="icon_side">
                            <p>Gantt Chart</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="Calendar.do">
                            <img alt="" src="assets/img/calendar2.png" class="icon_side">
                            <p>Calendar</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="worklist.jsp">
                            <img alt="" src="assets/img/list2.png" class="icon_side">
                            <p>Work List</p>
                        </a>
                    </li>
                    <li  class="nav-item active">
                        <a class="nav-link" href="workspace.jsp">
                            <img alt="" src="assets/img/invite2.png" class="icon_side">
                            <p>Invite</p>
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
</body>
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
<script src="assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

</html>
