<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Todolist</title>
    <link rel="stylesheet" href="assets/css/ws_todo.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Koulen&display=swap"/>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">

</head>
<body>
    <div class="wrapper">
        <div style="margin-bottom : 20px;"><span style="font-size:25px; font-weight:550;">TO DO LIST</span> </div>  
        <div class="inputField">
            <input type="text" id="addValue" placeholder="할 일 추가하기" autofocus/><!--자동포커스-->
            <button type="button" id = "btn" onclick="addTodo()"><i class="xi-plus xi-2x"></i></button>
        </div>
        <div>
            <ul id="addTodo" class="Todolist"> 
                <li ><div id='result'></div></li>
                
            </ul>
        </div>
        <div class="footer">
            <button type="button" id = "allClear" onclick="allClearList()">모두 삭제</button>
        </div>
    </div>
    <script src="assets/js/ws_todo.js"></script>
</body>
</html>