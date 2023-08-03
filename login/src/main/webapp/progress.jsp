<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <title>Document</title>
    <style>
      
        li {
            list-style: none;
        }

        .wrap {
            width: 200px;
             margin: 0;
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
    </style>
</head>

<body>
    <div class="wrap">
        <div class="progress" data-percent="65">
            <span id="percent"></span>
        </div>
    </div>


    <script>
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
</body>

</html>