<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<%@ page import="kr.smhrd.model.KanbanVO" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
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
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="select2.min.css">
	<script src="select2.min.js"></script>
<style>
		.icon_side {
            width: 16px;
            height: 16px;
            margin-right: 5px;
        }
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

        width: 600px;
        height: 600px;

        /* padding: 40px; */

        /* text-align: center; */

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
      .m_head{
        height: 10%;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        background-color:#e7e5e5;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      .m_body{
        height: 80%;
        padding: 20px;
      }
      .m_footer{
        height: 10%;
        padding: 15px;
        background-color:#e7e5e5;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        display: flex;
        justify-content: end;
      }
      .modal_title{
        font-size: 18px;
        color: gray;
        font-weight: 500;
      }
      .close_btn{
        font-size: 20px;
        color: rgb(139, 139, 139);
        font-weight: 900;
        cursor: pointer;
      }
      .modal_label{
        padding-top: 10px;
      }
      .input_box{
        width: 100%;
        border: 1px solid rgb(189, 189, 189);
        height: 30px;
      }
      .modal_btn{
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
      .cancle{
        background-color: white;
        color: black;
      }
      .save{
        background-color: #bb2649;
        color: white;
      }
      
      #des_box {
      height: 200px;
      border-radius: 8px;
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
            border: 1px solid #bbb;
            border-radius: 8px;
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
      
	      #save_btn {
	      border : 0.3px;
	     
	      }
	      
	      #close_btn {
	      border : 0.3px;
	      }
	      
	      #des_box {
	      height: 200px;
	      border-radius: 5px;
	      font-size: 14px;
	      padding-left : 10px;
	      }
        
        
        
        
        
       li {
            list-style: none;
        }

        .wrap {
            width: 200px;
             margin-left: 35px;
             margin-top : 5px;
            padding: 0;
        }

        .progress {
            position: relative;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #dedddd;

        }

        .progress div {
            position: absolute;
            left: 20px;
            top: 0px;
            display: none;
            width: 2px;
            height: 5px;
            background:rgb(90, 197, 233);
            transform-origin: 0px 100px;
            -webkit-transform-origin: 0px 20px;
            -moz-transform-origin: 0px 20px;
            -ms-transform-origin: 0px 20px;
        }

        .progress_value {
            transform: lotate(0deg);
            -webkit-transform: lotate(0deg);
            -moz-transform: lotate(0deg);
            -ms-transform: lotate(0deg);
        }

        #percent {
            position: absolute;
            z-index: 10;
            left: 5px;
            top: 5px;
            width: 30px;
            height: 30px;
            line-height: 150px;
            text-align: center;
            background: #fcfcfc;
            border-radius: 50%;

            font-size: 10px;
            font-weight: bold;
            line-height: 2.9em;
            color: #666;

        }
        @font-face{
	src:url(../fonts/NotoSansKR-Light.otf);
	font-family: my_font;
}

*{
	font-family: my_font !important;
}
        
</style>

</head>

<body>
    <div class="wrapper">
        <form onsubmit="return false" id="register">
            <div class="modal" id="modal">
                <div class="modal_body">
                    <div class="m_head">
                        <div class="modal_title">게시물 작성</div>
                        <div class="close_btn" id="close_btn">X</div>
                    </div>
                     <div class="m_body">
                                
                                <div class="modal_label">프로젝트명</div>
                                <input type="text" class="input_box" name = "project_name" value="${show.project_name}" readonly>
                                
                                <div class="modal_label">제목</div>
                                <input type="text" class="input_box" id="name_box" name="post_title"/>
                                
                                <div class="modal_label">내용</div>
                                <textarea class="input_box" id="des_box" name="post_detail"></textarea>
                                                                
                            </div>

                    <div class="m_footer">
						<button type="reset" class="modal_btn cancle" id="close_btn">취소</button>
                        <button type="submit" class="modal_btn save" id="save_btn">저장</button>                
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
                    <div class="btn" id="add-btn" style="border: 1px solid #bb2649; background-color: #bb2649; color: white; width: 70%; margin-left: 40px; margin-bottom: 30px;">글쓰기</div>
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
                    <h3>${show.project_name}</h3>
                </div>
                
                <%
                      
                      
                  	
                      KanbanVO show = (KanbanVO) request.getAttribute("show");
                      String startStr = show.getProject_start();
                      String endStr = show.getProject_end();
                      
                      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                      
                      LocalDate start = LocalDate.parse(startStr, formatter);
                      LocalDate end = LocalDate.parse(endStr, formatter);
                      LocalDate today = LocalDate.now();
                      
                      
                      // 상태 state
                      long days = ChronoUnit.DAYS.between(start, end);
                      long daysSinceStart = ChronoUnit.DAYS.between(start, today);
                     int daysSince = (int)daysSinceStart;
                      long priority_days = ChronoUnit.DAYS.between(today, end); // end-today
                      int daysInt = (int) priority_days; // long 타입인 days를 int로 변환 
                      
                      String state = "";
                      int progress = 0;
                      String priority = "";
                      
                      String btnColor= "";
                      
                   	// 우선순위 priority 
                      String imgSrc = "";
                      String spanColor = "";
                     

                      if (daysInt < 7) {
                    	  priority = "긴급";
                    	  imgSrc = "assets/img/a.png";
                          spanColor = "red";
                      } else if (daysInt < 30) {
                    	  priority = "높음";
                    	  imgSrc = "assets/img/b.png";
                          spanColor = "orange";
                      } else if (daysInt < 50) {
                    	  priority = "보통";
                    	  imgSrc = "assets/img/c.png";
                          spanColor = "black";
                      } else if (daysInt < 100) {
                    	  priority = "낮음";
                    	  imgSrc = "assets/img/d.png";
                          spanColor = "black";
                          
                      }
                      
                      if (daysSince < 0) {
                    	  // 시작 전
                    	    state = "요청";
                    	    btnColor = "#00b2ff";
                    	    progress = 0;
                    	} else if (daysSince < days - 7) {
                    		// 종료날짜- 7일 전
                    	    state = "진행";
                    	    btnColor = "#00b01c";
                    	    progress = 60;
                    	} else if (daysSince <= days) {
                    		// 종료 전
                    	    state = "피드백";
                    	    btnColor = "#fd7900";
                    	    progress = 80;
                    	} else {
                    	    state = "완료";
                    	    btnColor = "#402a9d";
                    	    progress = 100;
                    	    priority = "없음";
                    	    spanColor = "black";
                    	    imgSrc = "assets/img/d.png";
                    	    
                    	}
                      
                      
                      
                   
                      

                      // 진척도
                      
                      
                      
                      
                      
                      
                      
					%>
                <div id="right">
                    <div id="wk_feed" class="feed d-flex">
                        <div class="feed a">상태 <br><button style="background-color: <%=btnColor %>; width: 60px; height: 30px; border-radius: 20px; font-size: 12px; border: white; margin-top: 10px; font-weight: bold; color: white;"><%=state %></button>
                        </div>
                        <div class="feed a">우선 순위 <br>
                        <div style="margin-top: 10px;"><img src="<%= imgSrc %>" style="margin: 5px; width: 20px; height:20px"><span style="color: <%= spanColor %>; font-size: 16px;"><%=priority %></div>
                           
                        </div>
                        <div class="feed a">진척도 <div class="wrap">
											     
					        <div class="progress" data-percent="<%= progress %>">
					            <span id="percent"></span>
					        </div>
					    </div>
					     </div>

                        <div class="feed a">시작 날짜 <br>
                            <div style="margin-top: 10px;"></div><span style="font-weight: bold; font-size: 15px;">${show.project_start}</span>
                        </div>
                        <div class="feed a">마감 날짜 <br>
                            <div style="margin-top: 10px;"></div><span style="font-weight: bold; font-size: 15px;">${show.project_end}</span>
                        </div>
                    </div>
                      
            
					
                    

                    <div id="wk_board" style="margin-top:80px;">

                        <div class="bd_container" style="overflow: visible;">
                            <!-- board list area -->


                            <div id="board-list">
                                <div class="container">

                                    <table class="board-table">

                                        <tbody>
                                            <c:forEach var="vo" items="${list}">
                                                <tr>
                                                    <td style="width: 100px;">${vo.post_id}</td>
                                                    <th>
                                                        <a href="/soo/Boardget.do?id=${vo.post_id}">${vo.post_title}</a>
                                                    </th>
                                                    <td>
                                                        <fmt:formatDate value="${vo.indate}" pattern="yyyy.MM.dd" />
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>


                                </div>
                                <!-- <button style="float: right; margin: 10px; position: fixed; top: 0; right: 0;">글쓰기</button> -->
                            </div>

                        </div>

                    </div>

                    <div id="wk_todo">
                        <iframe src="todo_frame.jsp" frameborder="0" style="width: 550px; height: 650px; margin: 10px;"></iframe>
                    </div>
                </div>

            </div>

        </div>


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
<script type="text/javascript">

$('#save_btn').on('click',()=>{
	var sendData = $('#register').serialize();
	
	$.ajax({
		url: 'BoardRegister.do',
		type: 'post',
		data: sendData,
		success: function(data) {
			console.log('성공')
			$('#modal').removeClass('show'); // 모달 닫기
		},
		error: function(error) {
			console.log(error);
			}
		})
	});
	
	$("#save_btn").on("click", function(){
	// 등록 버튼 클릭 시 input 내용 초기화
	$("input[type=text]").val("");
	$("textarea").val("");
	});

    $(document).on('click', '#add-btn', function (e) {
        console.log("click event");
        $('#modal').addClass('show');

    });

    // 모달 닫기
    $(document).on('click', '#close_btn', function (e) {
        console.log("click event");
        $('#modal').removeClass('show');

    });
	
    
    $(document).ready(function() {
      $('#mySelect').select2({
        templateSelection: function(data, container) {
          if (data.element) {
            $(container).css("background-image", "url(" + $(data.element).data("icon") + ")");
          }
          return data.text;
        }
      });
    });
    
    
    
    (function () {
        var doms = '';
        var $m = $('.progress');
        var $data = $m.find('#percent');
        var data = $m.data('percent');
        var com = Math.round(data / 100 * 360);
        var dur = 2000;

        var getVendorPrefix = function () {
            var body = document.body || document.documentElement,
                style = body.style,
                transition = "Transition",
                vendor = ["Moz", "Webkit", "ms"],
                lastGage,
                i = 0;
            while (i < vendor.length) {
                if (typeof style[vendor[i] + transition] === "string") {
                    return vendor[i];
                }
                i++;
            }
            return false;
        };
        var prefix = getVendorPrefix();
        var transform = prefix + 'Transform';

        for (var i = 0; i <= com; i++) {
            doms = '<div class="gage-bar"></div>';
            $m.append(doms);
            $('.gage-bar:last').css(transform, 'rotate(' + i + 'deg)');
        }

        //$m.append(doms);

        $m.find('div').each(function (index, item) {
            $(item).stop().delay(index * 5).fadeIn(50);
        });

        for (var j = 0; j <= data; j++) {
            (function (index) {
                var time = (360 / 100 * index) * 5;
                setTimeout(function () {
                    $data.text(index + '%');
                }, time);
            })(j);
        }
    })();
  </script>

</html>