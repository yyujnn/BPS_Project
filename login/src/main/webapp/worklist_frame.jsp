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
        
        body{
        	width: 760px;
        }
        #container {
	    margin-left: 0px;
	    width: 720px;
	    padding: 0px;
	}
  		.board h3 {
		    padding: 16px!important;
		    min-width:100px !important;
		    width: 100%;
		    margin: 0;
		    background-color: #FFFF;
		    font-weight: bold;
		    font-size: 20px;
		    color: #1C1C2E;
}
  		.board{
  			width: 120px !important;
  			height: 80px !important; 
  		}
  		.boards {
			    display: inline-flex;
			    flex: 1;
			    height: 480px !important;
			    width: 740px !important;
			    border-top: 1px solid #fff;
			}
			.dropzone {
		    padding: 20px;
		    min-width: 200px;
		    min-height: 400px;
		    justify-content: center;
		    height: 460px;
		    background-color: #efefef;
		}
			.kanbanCard {
			    background-color: #FFFF;
			    padding: 16px 16px 4px 16px;
			    width: 180px;
			    margin: auto;
			    margin-bottom: 2rem;
			    border-radius: 4px;
			    font-weight: 600;
			    font-size: 16px;
			}
			p.title {
		    color: #434343;
		    margin-top: 0;
		    margin-bottom: 0.8rem;
		    font-size: 2px;
		}
		.description {
		    color: #000;
		    font-weight: bold;
		    font-size: 14px;;
		}
		p.start_end {
	    color: #434343;
	    margin-top: 0;
	    margin-bottom: 0.4rem;
	    font-size: 1px;
	}
	    </style>
</head>

<body>

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
                        localStorage.setItem('@kanban:' + "" + ':data', JSON.stringify(dataCards));
                    }

                    $(document).ready(() => {
                        $("#loadingScreen").addClass("d-none");
                        initializeBoards();
                        if (JSON.parse(localStorage.getItem('@kanban:' + "" + ':data'))) {
                            dataCards = JSON.parse(localStorage.getItem('@kanban:' + "" + ':data'));
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
                    
                $(document).on('click', 'a .description', function() {
                 var projectName = $(this).text();
                 console.log('프로젝트 이름:', projectName);
                 
                 $.ajax({
                   type: 'POST',
                   url: 'BoardList.do',
                   data: { projectName: projectName },
                   success: function(data) {
                     console.log('서버 응답:', data);
                   },
                   error: function(xhr, status, error) {
                     console.error('AJAX 오류:', status, error);
                   }
                 });
               });
                </script>
</body>

</html>