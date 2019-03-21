<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery UI Datepicker - Default functionality</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style>
.ui-datepicker{width:231px; height:242px; padding:2px; font-family:'나눔고딕'}
.ui-widget-header{border:white; background:white; font-weight:100}
.ui-datepicker .ui-datepicker-prev {width:1.5em; height:1.5em}
.ui-datepicker table {font-size:0.8em; font-family:'나눔고딕'}
.ui-datepicker th {font-weight:100; border:0}
.ui-datepicker td {width:31px}
.ui-state-default, .ui-widget-content .ui-state-default {border:1px solid #f9e3e3; background:#f9e3e3}
</style>
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
$(function() {
	$( "#datepicker" ).datepicker(
		{
			dateFormat:    'yy-mm-dd'
		}
	);
});
</script>
</head>
<body>
<p>Date: <input type="text" id="datepicker"></p>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
  <style>
    *,span {
      box-sizing: border-box;
      font-family: '나눔고딕', 'NanumGothic', 'sans-serif';
    }
    body {
      margin: 0;
    }
    /* placeholder color */
    input:-ms-input-placeholder {
      color: #000;
    }
    input::-webkit-input-placeholder {
      color: #000;
    }
    input::-moz-placeholder {
      color: #000;
    }
    input::-moz-placeholder {
      color: #000;
    }
    .wrapper {
      position: relative;
      width: 445px;
      height: 45px;
      margin: 10px;
    }
    .ion-calendar {
      position: absolute;
      right: 20px;
      top: 14px;
    }
    /* input */
    #datepicker {
      border: 1px solid #c6e2f7;
      border-radius: 5px;
      width: 100%;
      height: 100%;
      font-size: 16px;
      text-align: center;
      cursor: pointer;
    }
    #datepicker:hover {
      background-color: #eaf7ff;
    }
    #datepicker:focus {
      outline: none;
    }
    /* calendar table */
    .ui-datepicker {
      display: none;
      background-color: #fff;
      border-radius: 5px;
      margin-top: 10px;
      margin-left: 42.5px;
      margin-right: 42.5px;
      padding: 20px;
      width: 360px;
    }
    #datepicker:focus>.ui-datepicker {
      display: block;
    }
    .ui-datepicker-prev,
    .ui-datepicker-next {
      cursor: pointer;
    }
    .ui-datepicker-next {
      float: right;
    }
    .ui-state-disabled {
      cursor: auto;
      color: hsla(0, 0%, 80%, 1);
    }
    .ui-datepicker-title {
      text-align: center;
      padding: 10px;
      font-weight: 100;
      font-size: 20px;
    }
    .ui-datepicker-calendar {
      width: 100%;
    }
    /* day of week cell */
    .ui-datepicker-calendar>thead>tr>th {
      padding: 5px;
      font-size: 20px;
      font-weight: 400;
    }
    /* day cell */
    .ui-datepicker-calendar>tbody>tr>td {
      border-radius: 100%;
      width: 44px;
      height: 44px;
      cursor: pointer;
      padding: 5px;
      font-weight: 100;
      text-align: center;
    }
    .ui-datepicker-calendar>tbody>tr>td:hover {
      background-color: #c6e2f7;
    }
    .ui-datepicker-calendar>tbody>tr>td>a {
      color: #000;
      font-size: 18px;
      font-weight: 400;
      text-decoration: none;
    }
    /* past days */
    .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover {
      cursor: auto;
      background-color: #fff;
    }
    /* media */
    @media(max-width: 445px) {
      .wrapper {
        width: calc(100vw - 20px);
      }
      .ui-datepicker {
        margin-right: 0;
        margin-left: 0;
        padding: 10px;
        width: calc(100vw - 20px);
        margin: 10px auto;
      }
      .ui-datepicker-calendar>tbody>tr>td {
        width: 38px;
        height: 38px;
      }
    }
  </style>
</head>

<body>
  <div class="wrapper">
    <input type="text" id="datepicker" placeholder="날짜를 선택하세요." readonly="true" />
    <i class="ion-calendar"></i>
  </div>
  <script>
    $.datepicker.setDefaults({
      closeText: "닫기",
      prevText: "이전달",
      nextText: "다음달",
      currentText: "오늘",
      monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
        "7월", "8월", "9월", "10월", "11월", "12월"
      ],
      monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
        "7월", "8월", "9월", "10월", "11월", "12월"
      ],
      dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
      dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
      weekHeader: "주",
      dateFormat: "yy년 m월 d일",
      firstDay: 0,
      isRTL: false,
      showMonthAfterYear: true,
      yearSuffix: "년"
    })
    $("#datepicker").datepicker({
      minDate: 0,
      /* to use in wix */
      onSelect: function (selected, event) {
        console.log(selected);
        /* 
         * wix-send-messages from html component
         * https://support.wix.com/en/article/working-with-the-html-component-in-wix-code
         */
        window.parent.postMessage(selected, "*");
      }
    })
  </script>
</body>

</html>