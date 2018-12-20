 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FunStay</title>
<!-- 페이지 default 링크 시작 -->
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="./css/default/login.css" rel="stylesheet">
<link href="./css/default/default.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 페이지 default 링크 끝-->
<link href="./css/mypage/QnAcheck.css" rel="stylesheet">
<!-- date picker api  -->
<link href="./dist/css/datepicker.min.css" rel="stylesheet"type="text/css">
<link href="./dist/css/datepicker.css" rel="stylesheet"type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<!-- <script src="./dist/js/caleander.js"></script> -->
<!-- <script src="./dist/js/datepicker.min.js"></script> -->
<script src="./dist/js/datepicker.js"></script>
<script src="./dist/js/i18n/datepicker.en.js"></script>

<!-- js -->
	<!-- room_info scroll박스 -->
	<script src="./js/room_info/scroll.js"></script>
<script src="./js/member/email_check.js"></script>
<script src="./js/member/id_find.js"></script>
<script src="./js/default/required_join.js"></script>

<!-- 로그인/회원가입 js -->
<script src="./js/member/email_check.js"></script>
<script src="./js/default/required_Join.js"></script>

<!-- 편의시설 아이콘 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.1/css/all.css'
	integrity='sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz' crossorigin='anonymous'>

<!-- css -->
<link href = "./css/room_info/room_info.css" rel="stylesheet">

 <script language="javascript">
  function showPopup() { 
	  window.open("room_info/room_report.jsp", "a", "width=1000, height=700, left=200, top=100"); 
	  }
 </script>
</head>
<body>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<div class="clear"></div>
<hr>

<div id="content">
<!-- 페이지내용 시작 -->

<!-- room_info -->
<jsp:include page="../room_info/room_info.jsp"></jsp:include>


<!-- 페이지내용 끝 -->
</div>
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>