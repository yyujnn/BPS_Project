<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="assets/img/logoImg.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>SOORE</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<!-- CSS Files -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/light-bootstrap-dashboard.css "
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="assets/css/demo.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="assets/css/gantt.css">
<style type="text/css">
	body{
		background-color: #fafafa !important;
	}
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
                    <li class="nav-item active">
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
			<div class="head" style="margin-top: 20px; margin-left: 20px;" >
                <button id="add-project-button" data-task-type="project">프로젝트 추가</button>
                <button id="add-task-button">업무 추가</button>
            </div>
            <div id="gantt_here" style='width: 100%; height: 100vh; padding : 10px;'></div>

<script src="assets/js/gantt.js"></script>
</body>
<script>

		
		// 주말에만 색 입히기
				window.addEventListener("DOMContentLoaded", function () {
				    gantt.templates.task_cell_class = function (item, date) {
				        if (!gantt.isWorkTime(date)) {
				            return "weekend";
				        }
				        return "";
				    };
				
				    gantt.templates.timeline_cell_class = function (date) {
				        if (!gantt.isWorkTime(date)) {
				            return "weekend";
				        }
				        return "";
				    };
				
				    gantt.templates.scale_cell_class = function (date) {
				        if (!gantt.isWorkTime(date)) {
				            return "weekend";
				        }
				        return "";
				    };
				
				    
				    
		
			        gantt.init("gantt_here");
			        gantt.parse({
			          data: [
			            <c:forEach var="gantt" items="${ganttList}">
			              {
			                id:  "${gantt.GANTT_ID}",
			                text: "${gantt.TITLE}",
			                start_date: new Date("${gantt.START_DATE}"),
			                duration: "${gantt.DUR}",
			                
			                <c:if test="${gantt.GT_TYPE == 'task'}">
			                	type : "${gantt.GT_TYPE}",
			                	parent:"${gantt.GT_PARENT}",
			                	open : false,
			                </c:if>
			                <c:if test="${gantt.GT_TYPE != 'task'}">
			                	type : "${gantt.GT_TYPE}",
			                	open : true,
			                </c:if>
			                
			                progress: "${gantt.PROGRESS}",
			               
			              },
			            </c:forEach>
			          ]
			        });
				})
			        
			        gantt.templates.progress_text = function (start, end, task) {
			            return "<span style='text-align:center'>" + (task.progress * 100).toFixed(0) + "%</span>";
			        };
			
		        
		    	
		        // 월, 년도 추가
		        gantt.config.scale_offset_minimal = false;
		        gantt.config.inherit_scale_class = true;
		        gantt.config.scales.push({
		            unit: 'month',
		            step: 1,
		            format: '%Y년 %M',
		            css: function (date) {
		                return 'gantt_custom_month_scale';
		            }
		        });
		
		        // 이벤트 리스너 추가
		        gantt.attachEvent("onMouseMove", function (id, e) {
		            // 마우스 왼쪽 버튼이 눌린 상태에서만 그래프 이동 가능
		            if (e.buttons === 1) {
		                // 마우스 이동 거리 계산
		                var dx = e.movementX;
		
		                // 그래프 이동
		                gantt.scrollTo(gantt.getScrollState().x - dx, null);
		
		                // 배경 cell 이동 막기
		                var target = e.target || e.srcElement;
		                if (
		                    target.className.indexOf("gantt_task_content") > -1 ||
		                    target.className.indexOf("gantt_row") > -1
		                ) {
		                    e.preventDefault();
		                }
		            }
		            return true;
		        });
		
		        
		
		        const addProjectButton = document.getElementById('add-project-button');
		        
		        addProjectButton.addEventListener('click', function () {
		            const project = {
		                text: 'New Project',
		                start_date: new Date(),
		                type: gantt.config.types.project,
		                $open: true
		            };
		            const newProjectId = gantt.uid();
		            const newProject = gantt.addTask({
		                ...project,
		                id: newProjectId
		            });
		            const task = {
		                text: 'New Task',
		                start_date: new Date(),
		                duration: 2,
		                parent: newProjectId,
		                type: gantt.config.types.task
		            };
		
		            const newTaskId = gantt.uid();
		            gantt.addTask({
		                ...task,
		                id: newTaskId
		            });
		            
		            gantt.showLightbox(newProjectId)
		            
		            $.ajax({
		                    url: 'GanttInsert.do',
		                    type: 'GET',
		                    dataType: "json",
		                    data: {
		                      id: newProjectId,
		                      title: project.text,
		                      start_date: project.start_date,
		                      duration: 0,
		                      type: project.type,
		                      parent: parseInt(project.parent),
		                      progress: '0.5'
		                    },
		                    success: function (data) {
		                      console.log('New project saved:', data);
		                    },
		                    error: function (xhr, status, error) {
		                      console.error('Error saving new project:', error);
		                    }
		                  });
		            
		        });
		
		        const addTaskButton = document.getElementById('add-task-button');
		
		        addTaskButton.addEventListener('click', function () {
		            const selectedTask = gantt.getSelectedId();
		            if (selectedTask !== null) {
		                const task = {
		                    text: 'New Task',
		                    start_date: new Date(),
		                    duration: 2,
		                    parent: selectedTask,
		                    type: gantt.config.types.task
		                };
		                const newTaskId = gantt.uid();
		                gantt.addTask({
		                    ...task,
		                    id: newTaskId
		                });
		                
		                $.ajax({
		                    url: 'GanttInsert.do',
		                    type: 'GET',
		                    dataType: "json",
		                    data: {
		                      id: newTaskId,
		                      title: task.text,
		                      start_date: task.start_date,
		                      duration: task.duration,
		                      type: task.type,
		                      parent: parseInt(task.parent),
		                      progress: '0.5'
		                    },
		                    success: function (data) {
		                      console.log('New project saved:', data);
		                    },
		                    error: function (xhr, status, error) {
		                      console.error('Error saving new project:', error);
		                    }
		                  });
		                
		            } else {
		                alert('프로젝트를 선택해주세요.');
		            }
		            
		        });
		        
		        const updateButton = document.getElementById('gantt-update');
		
		        updateButton.addEventListener('click', function () {
		          const selectedTaskId = gantt.getSelectedId();
		
		          if (selectedTaskId != null) {
		            const selectedTask = gantt.getTask(selectedTaskId);
		            gantt.showLightbox(selectedTaskId);
		
		            $.ajax({
		              url: 'GanttUpdate.do',
		              type: 'POST',
		              dataType: 'json',
		              contentType: 'application/json',
		              data: JSON.stringify({
		                id: selectedTask.id,
		                title: selectedTask.text,
		                start_date: selectedTask.start_date,
		                duration: selectedTask.duration,
		                type: selectedTask.type,
		                parent: parseInt(selectedTask.parent),
		                progress: selectedTask.progress
		              }),
		              success: function (data) {
		                console.log('Task updated:', data);
		              },
		              error: function (xhr, status, error) {
		                console.error('Error updating task:', error);
		              }
		            });
		          } else {
		            alert('수정할 task를 선택하세요.');
		          }
		        });
		



</script>


<!--   Core JS Files   -->
<script src="assets/js/core/jquery.3.2.1.min.js"
	type="text/javascript"></script>
<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="assets/js/light-bootstrap-dashboard.js"
	type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/gantt.js"></script>


</html>
