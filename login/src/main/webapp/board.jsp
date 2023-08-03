<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/board.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,500,700,800,900" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Kanban Board</title>
    <style type="text/css">
        @font-face {
            font-family: 'Material Icons';
            font-style: normal;
            font-weight: 400;
            src:
                url(https://fonts.gstatic.com/s/materialicons/v140/flUhRq6tzZclQEJ-Vdg-IuiaDsNc.woff2) format('woff2');
        }

        .material-icons {
            font-family: 'Material Icons';
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
    </style>
</head>

<body>
    <div id="loadingScreen">
        <div class="loader"></div>
    </div>
    <div class="controls p-3">
        <a href="#myModal" class="btn btn-lg btn-secondary" data-toggle="modal">add</a>
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
                            </select>
                        </form> 
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger" id="add">프로젝트 생성</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="boards overflow-auto p-0" id="boardsContainer"></div>

    <script>
        if (typeof module === 'object') {
            window.module = module;
            module = undefined;
        }
    </script>
    <script src="assets/js/board.js" defer></script>

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
        
        function save(){
            localStorage.setItem('@kanban:' +${userId} + ':data', JSON.stringify(dataCards));
        }
        
        $(document).ready(()=>{
            $("#loadingScreen").addClass("d-none");
            initializeBoards();
            if(JSON.parse(localStorage.getItem('@kanban:' +${userId} + ':data'))){
                dataCards = JSON.parse(localStorage.getItem('@kanban:' +${userId} + ':data'));
                initializeComponents(dataCards);
            }
            initializeCards();
            $('#add').click(()=>{
                const company = $('#comInput').val()!==''?$('#comInput').val():null;
                const description = $('#descriptionInput').val()!==''?$('#descriptionInput').val():null;
                const start = $('#startInput').val()!==''?$('#startInput').val():null;
                const end = $('#endInput').val()!==''?$('#endInput').val():null;
                $('#comInput').val('');
                $('#descriptionInput').val('');
                $('#startInput').val('');
                $('#endInput').val('');
                if(company && description && start && end){
                    let id = dataCards.config.maxid+1;
                    const newCard = {
                        id,
                        company,
                        description,
                        start,
                        end,
                        position:"yellow",
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