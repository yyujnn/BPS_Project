<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/logoImg.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>SOORE</title>
    <style>
        body {
            background-color: #fafafa !important;
        }
        
 .icon_side{
    	width : 16px;
 		height : 16px;
 		margin-right : 5px;
    }

    </style>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
        name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->

    <link rel="stylesheet" href="assets/css/calendar.css">
    <script src="assets/js/calendar.js"></script>

    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">

    </script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            // new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})

            var calendar = new FullCalendar.Calendar(calendarEl, {
                
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,addEventButton'
                },
                initialDate: '2023-05-01', // 초기 로딩 날짜.
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
                // 버튼 클릭 시 이벤트 

                customButtons: {
                    addEventButton: {
                        text: "일정 추가",
                        click: function () {
                            $("#calendarModal").modal("show");
                            function clearInput() {
                                $("#calendar_title").val("");
                                $("#calendar_start_date").val("");
                                $("#calendar_end_date").val("");
                                $("#calendar_1_title").val("");
                                $("#calendar_1_start_date").val("");
                            }
                            // modal 창 닫힐 때 이벤트 처리
                            $("#calendarModal").on("hidden.bs.modal", function () {
                                clearInput();
                                events = []; // 이전에 등록한 이벤트 정보 삭제
                            });

                            $(document).on("click", "#addCalendar", function () {
                                // 등록 버튼이 눌렸을 때의 처리
                                var title = "";
                                var start_date = "";
                                var end_date = "";

                                // 현재 보여지는 화면이 구간인 경우
                                if ($("#segment-body").is(":visible")) {
                                    title = $("#calendar_title").val();
                                    start_date = $("#calendar_start_date").val();
                                    end_date = $("#calendar_end_date").val();
                                }
                                // 현재 보여지는 화면이 일정인 경우
                                else if ($("#schedule-body").is(":visible")) {
                                    title = $("#calendar_1_title").val();
                                    start_date = $("#calendar_1_start_date").val();
                                }
                                console.log(end_date);

                                if (title == null || title == "") {
                                    alert("제목을 입력하세요.");
                                } else if (start_date == "") {
                                    alert("날짜를 입력하세요.");
                                } else if ($("#segment-body").is(":visible") && new Date(end_date) - new Date(start_date) < 0) {
                                    alert("종료일이 시작일보다 먼저입니다.");
                                } else {
                                    calendar.addEvent({
                                        "title": title,
                                        "start": start_date,
                                        "end": end_date
                                    });

                                    var allEvent = calendar.getEvents();
                                    console.log(allEvent);
                                    //events.push(list);
                                    var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                          
                                    for (var i = 0; i < allEvent.length; i++) {
                                        var obj = new Object();     // Json 을 담기 위해 Object 선언
                                        // alert(allEvent[i]._def.title); // 이벤트 명칭 알람

                                        obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
                                        obj.start = allEvent[i]._instance.range.start; // 시작
                                        obj.end = allEvent[i]._instance.range.end; // 끝
                                        events.push(obj);
                                    }

                                    $("#calendarModal").modal("hide");
                                }
                            });
                        }
                    }
                },
                select: function (arg) {
                },
                
               
                eventClick: function(arg) {
                	 var calendar2 = [];
                	$.ajax({
                  	  url: 'CalendarDetail.do',
                  	  type: 'GET',
                  	  data:{
                  		  cd_title : arg.event.title.toLocaleString()
                  	  },
                  		success: function (data) {
                  			
                      },
                       error: function (xhr, status, error) {
                           console.error('Error saving new project:', error);
                       },
                  	  })
                	,
                	<c:forEach var="detail" items="${calendar2}">
	                    document.getElementById("event_title").innerText = "${detail.cd_title}"
	                    document.getElementById("event_date_start").innerText = "${detail.cd_start_date}"
	                    document.getElementById("event_date_end").innerText = "${detail.cd_end_date}"
	                    document.getElementById("event_location").innerText = "${detail.cd_place}"
	                    document.getElementById("event_memo").innerText = "${detail.cd_content}"
               		</c:forEach>
                    $("#detailModal").modal("show")
                },
                
                editable: true,
                dayMaxEvents: true, 
                events: [
              	  <c:forEach items="${calendarList}" var="vo">
              	    {
              	      title: "${vo.title}",
              	      start: "${vo.cd_start_date}",
              	      end: "${vocd_end_date}"
              	    },
              	  </c:forEach>
              	]
            });
            calendar.render();
        });

        function showSegment() {
            $("#segment-body-btn").removeClass("btn-danger").addClass("btn-danger");
            $("#schedule-body-btn").removeClass("btn-danger").addClass("btn-secondary");
            document.getElementById("segment-body").style.display = "block";
            document.getElementById("schedule-body").style.display = "none";
            $('#segment-body-btn').addClass('active');
            $('#schedule-body-btn').removeClass('active');
        }

        function showSchedule() {
            $("#segment-body-btn").removeClass("btn-danger").addClass("btn-secondary");
            $("#schedule-body-btn").removeClass("btn-secondary").addClass("btn-danger");
            document.getElementById("segment-body").style.display = "none";
            document.getElementById("schedule-body").style.display = "block";
            $('#schedule-body-btn').addClass('active');
            $('#segment-body-btn').removeClass('active');
        }

    </script>
</head>

<body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="sidebar-wrapper calendar">
                <div class="logo">
                    <a href="first.jsp"> <img src="assets/img/logoImg.png" id="logoImg" /> <img
                            src="https://fontmeme.com/permalink/230419/234f3f0f39dbad0f4907a4e9073178d0.png"
                            alt="radio-canada-font" border="0" id="logo"></a>
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
	                    <a class="nav-link" href="Main.do">
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
                    <li class="nav-item active">
                        <a class="nav-link" href="Calendar.do">
                            <img alt="" src="assets/img/calendar2.png" class="icon_side">
                            <p>Calendar</p>
                        </a>
                    </li>
                    <li>
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
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                        aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                </div>
                <nav>
                </nav>
            </nav>

            <div id="container">
  
              	  
              	  <!-- 캘린더  -->
                <div id='calendar'></div>
              
 

                

                <!-- 등록 모달 -->
                <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">


                        
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button"
                                        class="btn btn-danger d-flex align-items-center justify-content-center"
                                        style="height: 32px; width: 60px;" onclick="showSegment()"
                                        id="segment-body-btn">구간</button>
                                    <button type="button"
                                        class="btn btn-danger d-flex align-items-center justify-content-center"
                                        style="height: 32px; width: 60px; margin-left: 15px;" onclick="showSchedule()"
                                        id="schedule-body-btn">일정</button>


                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <!-- 구간 -->
                                <div class="modal-body" id="segment-body">
                                <form id="sendData" onsubmit="return false">


                                    <div class="form-group">
                                        <input type="text" class="form-control" id="calendar_title"
                                            name="calendar_title" placeholder="일정을 입력하세요">
                                        <br>
                                        <input type="text" class="form-control" id="calendar_place"
                                            name="calendar_place" placeholder="장소를 입력하세요">
                                        <label for="start_time" class="col-form-label">시작 날짜</label>
                                        <input type="date" class="form-control" id="calendar_start_date"
                                            name="calendar_start_date">
                                        <label for="end_time" class="col-form-label">종료 날짜</label>
                                        <input type="date" class="form-control" id="calendar_end_date"
                                            name="calendar_end_date">
                                        <br>
                                        <textarea name="cd_content"class="form-control" placeholder="내용을 입력하세요"></textarea>


                                    </div>
                                    
                                    </form>





                                </div>
                                <!-- 일정 -->
                                <div class="modal-body" id="schedule-body" style="display: none;">
								    <form id="sendData2" onsubmit="return false">
								        <div class="form-group">
								            <input type="text" class="form-control" id="calendar_1_title" name="calendar_title" placeholder="일정을 입력하세요">
								            <br>
								            <input type="text" class="form-control" id="calendar_1_place" name="calendar_place" placeholder="장소를 입력하세요">
								            <label for="start_time" class="col-form-label">시작 날짜</label>
								            <input type="datetime-local" class="form-control" id="calendar_1_start_date" name="calendar_start_date">
								            <br>
								            <textarea name="cd_content" class="form-control" placeholder="내용을 입력하세요"></textarea>
								        </div>
								    </form>
								</div>



                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                        id="sprintSettingModalClose">취소</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal"
                                        id="addCalendar">등록
                                    </button>
                                </div>

                            </div>

                        </form>


                    </div>
                </div>

                <!-- 상세보기 모달 -->

                <div id="detailModal" class="modal fade">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" style="height: 600px;">
                            <div class="modal-header">
                            	
							    <h4 class="modal-title" id="event_title" type="text" style="border : 1px solid white; font-size: 1.5em ;" >
							    SMHRD 정처기 특강 강의
							    </h4>
                                <button type="button" class="close" data-dismiss="modal">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-1">
                                        <img src="assets/img/calendar2.png" alt="#">
                                    </div>
                                    <div class="col-11">
                                        
                                        <span id="event_date_start" type="datetime-local" style="border : 1px solid white"></span>2023-05-23 ~
                                        <span id="event_date_end" type="datetime-local"  style="border : 1px solid white"></span>2023-05-26
                                        
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-1">
                                        <img src="assets/img/c_space.png" style="width: 20px; height: 20px;" alt="#">
                                    </div>
                                    <div class="col-11">
                                        <span id="event_location" style="border : 1px solid white" value="장소">스마트인재개발원 남구점</span>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-1">
                                        <img src="assets/img/c_memo.png" style="width: 20px; height: 20px;" alt="#">
                                    </div>
                                    <div class="col-11">
                                  <textarea id="event_memo" style="border: 1px solid white; width: 400px; height: 300px; outline: none;">JSP/Servlet
                                  </textarea>


                                    </div>
                                    
                                </div>
                                
                                
                                <button style="border-radius: 5px;float: right; margin-left: 5px;" id="detail_delete">삭제</button>
                                <button style="border-radius: 5px; float: right;" id="detail_save">저장</button>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </div>
       
    </div>




    <script>
    
    
    $("#addCalendar").click(function() {
  	  var formData;
  	  if ($('#segment-body').is(':visible')) { // 구간 화면에서 등록 버튼 클릭한 경우
  	    formData = $('#sendData').serialize();
  	  } else if($('#schedule-body').is(':visible')) { // 일정 화면에서 등록 버튼 클릭한 경우
  	    formData = $('#sendData2').serialize();
  	  }

  	  $.ajax({
  	    type: "POST",
  	    url: "Register.do",
  	    data: formData,
  	    
  	    success: function(data) {
  	      // 등록 성공 처리
  	      console.log(data);  
  	    },
  	    error: function(error) {
  	      // 등록 실패 처리
  	      console.error(error);
  	    }
  	  })
  	})
	
       
    </script>
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
</script>

</html>