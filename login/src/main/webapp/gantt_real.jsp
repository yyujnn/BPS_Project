<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    <link href="assets/css/light-bootstrap-dashboard.css " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" type="text/css" href="assets/css/gantt.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
        .icon_side {
            width: 16px;
            height: 16px;
            margin-right: 5px;
        }
    </style>
</head>

<body>
		            
            <div class="head">
                <button id="add-project-button" data-task-type="project">프로젝트 추가</button>
                <button id="add-task-button">업무 추가</button>
                <button id="gantt-update">업무 수정</button>
            </div>
            <div id="gantt_here" style='width: 100vw; height: 100vh;'></div>

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
			});
		    
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


</html>
