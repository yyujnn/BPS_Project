<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/logoImg.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>SOORE</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<!-- CSS Files -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="./assets/css/light-bootstrap-dashboard.css " rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link rel="stylesheet" type="text/css" href="./assets/css/gantt.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="assets/js/gantt.js"></script>
<style type="text/css">
	.gantt_layout_cell{
	background-color : #fff !important;
	}
	
	.gantt_task_scale,
	.gantt_task_vscroll {
	    background-color: #fff !important;
	} 
	.gantt_grid_scale, .gantt_task_scale, .gantt_task_vscroll {
    background-color: #fff;
}
</style>
</head>

<body>
<div id="gantt_here" style='width: 100vw; height: 100vh;'></div>


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
	        })
		});
        
        
    	
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

        gantt.templates.progress_text = function (start, end, task) {
            return "<span style='text-align:center'>" + (task.progress * 100).toFixed(0) + "%</span>";
        };







</script>


</html>
