<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <title>Document</title>
    <style>
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

        .btn {
            display: inline-block;
            padding: 0 30px;
            font-size: 15px;
            font-weight: 400;
            background: transparent;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            text-transform: uppercase;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            -ms-transition: all 0.3s;
            -o-transition: all 0.3s;
            transition: all 0.3s;
        }

        .btn-dark {
            background: #555;
            color: #fff;
        }

        .btn-dark:hover,
        .btn-dark:focus {
            background: #373737;
            border-color: #373737;
            color: #fff;
        }

        .btn-dark {
            background: #555;
            color: #fff;
        }

        .btn-dark:hover,
        .btn-dark:focus {
            background: #373737;
            border-color: #373737;
            color: #fff;
        }

        /* reset */

        * {
            list-style: none;
            text-decoration: none;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .clearfix:after {
            content: '';
            display: block;
            clear: both;
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

        img {
            position: absolute;
            width: 17px;
            top: 10px;
            right: 12px;
            margin: 0;
        }

        input:focus {
            outline: none;
        }
        
    </style>
</head>

<body>

    <div class="bd_container" style="overflow: visible;">
        <!-- board list area -->
        <div class="search">
            <input type="text" placeholder="Search">
            <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
        </div>

        <div id="board-list">
            <div class="container">
                <table class="board-table">

                    <tbody>
                        
                        <tr>
                            <td style="width: 100px;">1</td>
                            <th>
                                <a href="boardpost.jsp">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                                <p>테스트</p>
                            </th>
                            <td>2021.03.13</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.13</td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.15</td>
                        </tr>
                        <tr>
                            <td style="width: 100px;">1</td>
                            <th>
                                <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                                <p>테스트</p>
                            </th>
                            <td>2021.03.13</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.13</td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.15</td>
                        </tr>
                        </tr>
                        <tr>
                            <td style="width: 100px;">1</td>
                            <th>
                                <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                                <p>테스트</p>
                            </th>
                            <td>2021.03.13</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.13</td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.15</td>
                        </tr>
                        </tr>
                        <tr>
                            <td style="width: 100px;">1</td>
                            <th>
                                <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                                <p>테스트</p>
                            </th>
                            <td>2021.03.13</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.13</td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.15</td>
                        </tr>
                        </tr>
                        <tr>
                            <td style="width: 100px;">1</td>
                            <th>
                                <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                                <p>테스트</p>
                            </th>
                            <td>2021.03.13</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.13</td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.15</td>
                        </tr>
                        </tr>
                        <tr>
                            <td style="width: 100px;">1</td>
                            <th>
                                <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                                <p>테스트</p>
                            </th>
                            <td>2021.03.13</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.13</td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2023.04.15</td>
                        </tr>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- <button style="float: right; margin: 10px; position: fixed; top: 0; right: 0;">글쓰기</button> -->
        </div>



    </div>



</body>

</html>