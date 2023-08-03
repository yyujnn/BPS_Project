<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        .modal {
            position: absolute;
            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            display: none;

            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal.show {
            display: block;
        }

        .modal_body {
            position: absolute;
            top: 50%;
            left: 50%;

            width: 800px;
            height: 600px;

            /* padding: 40px; */

            /* text-align: center; */

            background-color: rgb(255, 255, 255);
            border-radius: 10px;
            box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

            transform: translateX(-50%) translateY(-50%);
        }

        .m_head {
            height: 10%;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            background-color: #e7e5e5;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .m_body {
            height: 80%;
            padding: 20px;
        }

        .m_footer {
            height: 10%;
            padding: 15px;
            background-color: #e7e5e5;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            display: flex;
            justify-content: end;
        }

        .modal_title {
            font-size: 18px;
            color: gray;
            font-weight: 500;
        }

        .close_btn {
            font-size: 20px;
            color: rgb(139, 139, 139);
            font-weight: 900;
            cursor: pointer;
        }

        .modal_label {
            padding-top: 10px;
        }

        .input_box {
            width: 100%;
            border: 1px solid rgb(189, 189, 189);
            height: 30px;
        }

        .modal_btn {
            width: 80px;
            height: 30px;
            border-radius: 5px;
            text-align: center;
            font-size: 14px;
            font-weight: bolder;
            padding-top: 5px;
            margin-left: 5px;
            font-family: sans-serif;
        }

        .cancle {
            background-color: white;
            color: black;
        }

        .save {
            background-color: rgb(50, 77, 158);
            color: white;
        }








        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        section.notice {
            /* padding: 80px 0; */
            margin-left: 0px;
        }

        .page-title {
            margin-bottom: 60px;
        }

        .page-title h3 {
            font-size: 28px;
            color: #333333;
            font-weight: 400;
            text-align: center;
        }

        .board-table {
            font-size: 13px;
            width: 100%;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }

        .board-table a {
            color: #333;
            display: inline-block;
            line-height: 1.4;
            word-break: break-all;
            vertical-align: middle;
        }

        .board-table a:hover {
            text-decoration: underline;
        }

        .board-table th {
            text-align: center;
        }

        .board-table .th-num {
            width: 100px;
            text-align: center;
        }

        .board-table .th-date {
            width: 200px;
        }

        .board-table th,
        .board-table td {
            padding: 14px 0;
        }

        .board-table tbody td {
            border-top: 1px solid #e7e7e7;
            text-align: center;
        }

        .board-table tbody th {
            padding-left: 28px;
            padding-right: 14px;
            border-top: 1px solid #e7e7e7;
            text-align: left;
        }

        .board-table tbody th p {
            display: none;
        }





        .container {
            width: 720px;
            margin-left: 0px;
            margin-right: 0px;
            
        }

        .blind {
            position: absolute;
            clip: rect(0 0 0 0);
            margin: -1px;
            width: 1px;
            height: 1px;
        }

        body {
            font-family: Arial, sans-serif;
        }

        .search {
            position: relative;
            width: 300px;
            margin-bottom: 30px;
        }

        input {
            width: 100%;
            height: 40px;
            border: 1px solid #bbb;
            border-radius: 5px;
            padding: 10px 12px;
            font-size: 14px;
        }

        #s_img {
            position: absolute;
            width: 17px;
            top: 10px;
            right: 12px;
            margin-top: 3px;
        }

        input:focus {
            outline: none;
        }

        /* ---------------아래로 boardpost style css ----------------- */

        .post {
            max-width: 800px;
            margin: 0 auto;
            border: 1px solid #ddd;
        }

        .post-title {
            padding: 0px 20px 0px 20px;
            margin-top: 20px;
        }

        .post-content {
            padding: 0px 20px 0px 20px;
            margin-top: 0;
        }

        #comment-section {
            margin-top: 20px;
            padding: 10px;
            background-color: #f0f0f0;
            border-radius: 5px;
        }

        #comment-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        #comment-list li {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        #comment-list p {
            display: inline;
            margin-bottom: 5px;
            font-size: 16px;
            margin-left: 8px;
        }

        #comment-list li span {
            margin-left: 10px;
            font-size: 12px;
        }

        #comment-form {
            margin-top: 20px;
        }

        #comment-form label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
        }

        #comment-form textarea {
            margin-bottom: 30px;
            outline: none;
            width: 90%;
            height: 50px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            resize: none;
        }

        #comment-input {
            width: 650px;
        }

        #commGet {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        #commGet span {
            margin-left: 10px;
            font-size: 12px;
        }

        #commGetUl {
            padding-left: 0;
        }
        
        #up-des-box {
           height: 200px;
           border-radius: 5px;
           font-size: 14px;
           padding-left : 10px;
        }
        
        #des_box {
             height: 200px;
           border-radius: 5px;
           font-size: 14px;
           padding-left : 10px;
        }
        
        #list-btn, #update-btn, #delete-btn {
         margin-right: 10px;
       color: #fff;
       cursor: pointer;
       font-size: 13px;
       font-weight: 600;
       padding: 6px 10px;
       width: 70px;
       height: 35px;
       border: none;
       border-radius: 5px;
       background-color:rgb(143, 138, 138);} 
       
       .button-wrapper {
       display: flex;
       width: 715px;
       justify-content: right;}
       
       .icon_side {
            width: 16px;
            height: 16px;
            margin-right: 5px;
        }
       
       
    </style>

</head>

<body>
            <form onsubmit="return false" id= "sendData">
              <div class="modal" id="modal">
                  <div class="modal_body">
                      <div class="m_head">
                          <div class="modal_title">게시물 작성</div>
                          <div class="close_btn" id="close_btn">X</div>
                      </div>
                      <div class="m_body">
                          
                          <div class="modal_label">project_id</div>
                          <input type="text" class="input_box" placeholder="project_id값..." name = "project_id" />
                          
                          <div class="modal_label">Name</div>
                          <input type="text" class="input_box" id="name_box" name="post_title"/>
                          
                          <div class="modal_label">Description</div>
                          <textarea class="input_box" id="des_box" name="post_detail"></textarea>

                          <div class="modal_label">Writer</div>
                          <input type="text" class="input_box" id="name_box" name="post_writer"/>
                          
                      </div>
                      <div class="m_footer">
                          <button type="reset" class="modal_btn cancle" id="close_btn">CANCLE</button>
                          <button type="submit" class="modal_btn save" id="save_btn">SAVE</button>
                      </div>
                  </div>
              </div>
           </form>
           
        <div class="sidebar">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="first.jsp">
                        <img src="assets/img/logoImg.png" id="logoImg" />
                        <img src="https://fontmeme.com/permalink/230419/234f3f0f39dbad0f4907a4e9073178d0.png" alt="radio-canada-font" border="0" id="logo"></a>
                </div>
                <ul class="nav">
                    <li>
                        <p style="font-size: 10px; margin-left: 20px; color: gray;">USER</p>
                    </li>
                    <li>
                        <div id="userInfo">
                        	<img src="assets/img/user_icon.png" style="width: 45px; height: 45px; margin-left: 75px;" >
                             <br><br>
                        	<span style="margin-left: 35px;"> ${member.USER_NAME}님 어서오세요.</span>		
                            <br><br>
                            ID : ${member.USER_ID}@soore.do
                        </div>
                    </li>
                    <li>
                        <p style="font-size: 10px; margin-left: 20px; color: gray;">MENU</p>
                    </li>
                    <li>
                        <a class="nav-link" href="Gomain.do">
                            <img alt="" src="assets/img/main.png" class="icon_side">
                            <p>Main</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="Gogantt.do">
                            <img alt="" src="assets/img/gantt.png" class="icon_side">
                            <p>Gantt Chart</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="Gocalendar.do">
                            <img alt="" src="assets/img/calendar2.png" class="icon_side">
                            <p>Calendar</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Goworklist.do">
                            <img alt="" src="assets/img/list2.png" class="icon_side">
                            <p>Work List</p>
                        </a>
                    </li>
                   
                </ul>
            </div>
        </div>

        <div class="main-panel">
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <p class="navbar-brand"></p>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                </div>
            </nav>

            <div id="container">
                <div id="wk_title">
                    <h3>${vo.project_name}</h3>
                </div>
                <form action="BoardUpdate.do" method ="post" style="margin-top:20px">
                   <div class="container">
                         
                          <div class="modal_label">프로젝트명</div>
                          <input type="text" class="input_box" id="up-pjid-box" name = "project_name" value = "${vo.project_name}" readonly/>
                          
                          <div class="modal_label">제목</div>
                          <input type="text" class="input_box" id="up-name-box" name="post_title" value = "${vo.post_title}"/>
                          
                          <div class="modal_label">내용</div>
                          <textarea class="input_box" id="up-des-box" name="post_detail">${vo.post_detail}</textarea>
                                                  
                          <p><br></p>
                    
                                                 <!--     <div style="width: 100%">
                                                         <p><span>첨부파일</span>
                                                             <span>
                                                                 <jsp:include page="filedownload.jsp" /></span>
                                                         </p>
                                                        </div>
                                                       -->
                      </div>
                  <div class="button-wrapper">
                     <button id="list-btn" onclick="location.href='BoardList.do'">목록</button>
                     <button id="update-btn" onclick ="location.href='BoardUpdate.do?id=${vo.post_id}'">수정</button>
                     <button id="delete-btn" onclick ="location.href='BoardRemove.do?id=${vo.post_id}'">삭제</button>
                 </div>
         </form>   
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
    <script src="assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
    <!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>



</body>

</html>