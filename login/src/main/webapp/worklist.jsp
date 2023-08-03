<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    <link rel="stylesheet" href="assets/css/board.css">
    <script src="assets/js/board.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,500,700,800,900" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
    @font-face {
            font-family: 'Material Icons';
            font-style: normal;
            font-weight: 400;
            src:
                url(https://fonts.gstatic.com/s/materialicons/v140/flUhRq6tzZclQEJ-Vdg-IuiaDsNc.woff2) format('woff2');
        }

        .material-icons {
            font-family: 'Material Icons' !important;
            font-weight: normal;
            font-style: normal;
            font-size: 24px;
            line-height: 1;
            letter-spacing: normal;
            text-transform: none;
            display: inline-block;
            white-space: nowrap;
            word-wrap: normal;
            direction: ltr;
            -webkit-font-feature-settings: 'liga';
            -webkit-font-smoothing: antialiased;
        }
        .icon_side {
            width: 16px;
            height: 16px;
            margin-right: 5px;
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
		                    	<a href="#myModal" class="btn btn-lg btn-secondary" data-toggle="modal" style="border: 1px solid #bb2649; background-color: #bb2649; color: white; width: 70%; margin-left: 40px; margin-bottom: 30px; font-size: 16px; height: 38px; padding: 6px 12px;">
		                    		새 프로젝트
		                   		</a>
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
                <div id="loadingScreen">
                    <div class="loader"></div>
                </div>
        <div id="myModal" class="modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        새 프로젝트
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form class="form-row" onsubmit="return false" id="sendData">
                            <input class="form-control form-control-sm" type="text" name="company" id="comInput" autocomplete="off" placeholder="회사명을 입력하세요">
                            <br>
                            <input class="form-control form-control-sm" type="text" name="description" id="descriptionInput" autocomplete="off" placeholder="프로젝트명을 입력하세요">
                            <label for="descriptionInput">시작 날짜</label>
                            <input class="form-control form-control-sm" type="date" name="start" id="startInput" autocomplete="off">
                            <label for="descriptionInput">마감 날짜</label>
                            <input class="form-control form-control-sm" type="date" name="end" id="endInput" autocomplete="off">
                        </form> 
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger" id="add">프로젝트 생성</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
                <div class="boards overflow-auto p-0" id="boardsContainer"></div>
			</div>
                <script> if (typeof module === 'object') {window.module = module;module = undefined;} </script>
                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
                <script>
                    if (window.module) module = window.module;
                </script>
               <script type="text/javascript">
                    var _gaq = _gaq || [];
                    _gaq.push(['_setAccount', 'UA-36251023-1']);
                    _gaq.push(['_setDomainName', 'jqueryscript.net']);
                    _gaq.push(['_trackPageview']);

                    (function() {
                        var ga = document.createElement('script');
                        ga.type = 'text/javascript';
                        ga.async = true;
                        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                        var s = document.getElementsByTagName('script')[0];
                        s.parentNode.insertBefore(ga, s);
                    })();

                    function save() {
                        localStorage.setItem('@kanban:' + "${userId}" + ':data', JSON.stringify(dataCards));
                    }

                    $(document).ready(() => {
                        $("#loadingScreen").addClass("d-none");
                        initializeBoards();
                        if (JSON.parse(localStorage.getItem('@kanban:' + "${userId}" + ':data'))) {
                            dataCards = JSON.parse(localStorage.getItem('@kanban:' + "${userId}" + ':data'));
                            initializeComponents(dataCards);
                        }
                        initializeCards();
                        $('#add').click(() => {
                            const company = $('#comInput').val() !== '' ? $('#comInput').val() : null;
                            const description = $('#descriptionInput').val() !== '' ? $('#descriptionInput').val() : null;
                            const start = $('#startInput').val() !== '' ? $('#startInput').val() : null;
                            const end = $('#endInput').val() !== '' ? $('#endInput').val() : null;
                            $('#comInput').val('');
                            $('#descriptionInput').val('');
                            $('#startInput').val('');
                            $('#endInput').val('');
                            if (company && description && start && end) {
                                let id = dataCards.config.maxid + 1;
                                const newCard = {
                                    id,
                                    company,
                                    description,
                                    start,
                                    end,
                                    position: "yellow",
                                    priority: false
                                }
                                dataCards.cards.push(newCard);
                                dataCards.config.maxid = id;
                                save();
                                appendComponents(newCard);
                                initializeCards();
                            }
                        });
                    });

                    function deleteCard(id) {
                        dataCards.cards.forEach((card, index) => {
                            if (card.id === id) {
                                dataCards.cards.splice(index, 1);
                                console.log(dataCards.cards);
                                save();
                            }
                        })
                    }


                    $('#add').on('click', () => {
                        var sendData = $('#sendData').serialize();

                        $.ajax({
                            url: 'kanban.do',
                            data: sendData,
                            success: function(data) {
                                console.log("데이터 보내기 성공");
                            }
                        })
                    })
                </script>
</body>

</html>