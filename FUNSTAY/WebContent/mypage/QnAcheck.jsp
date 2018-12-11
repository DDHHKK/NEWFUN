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
<link href="./css/default/subpage_content.css" rel="stylesheet">
<link href="./css/default/subpage.css" rel="stylesheet">
<script src="./js/default/jquery-3.3.1.js"></script>
<!-- 페이지 default 링크 끝-->

<link href="./css/mypage/message_list.css" rel="stylesheet">

</head>
<body>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>
<!-- 회원 관리 페이지 왼쪽메뉴바 시작 -->
<jsp:include page="../include/subpage.jsp"></jsp:include>
<!-- 회원 관리 페이지 왼쪽메뉴바 끝 -->

<div id="content">
<!-- 페이지내용 시작 -->


<h1>메세지함</h1>
<div id="content_wrap">
<ul id="messagelist">
<li>
	<div id="message_list">
	<div class="member_check">
		<div class="member_img">
		<a href="#">
			<img src="./img/no_profile.png" class="member_symbol">
			<!-- <img src="../img/mypage/profile_image.JPG" class="member_symbol"> -->
			<!-- <img src="https://a0.muscache.com/defaults/user_pic-50x50.png?v=3" class="member_symbol"> -->
		</a>
		</div>
		<br>
		<a href="#">사용자이름</a>
	</div>
	<div class="message_preview">
	<span>2018.03.23</span>
		<a href="message.jsp">
			호스트에게 전달할 메세지를 적어주세요.
			호스트에게 전달할 메세지를 적어주세요.
			호스트에게 전달할 메세지를 적어주세요.
		</a>
	</div>
	</div>
</li>
<li>
	<div id="message_list">
	<div class="member_check">
		<div class="member_img">
		<a href="#">
			<img src="./img/mypage/profile_image.JPG" class="member_symbol">
<!-- 			<img src="https://a0.muscache.com/defaults/user_pic-50x50.png?v=3" class="member_symbol"> -->
		</a>
		</div>
		<br>
		<a href="#">사용자이름</a>
	</div>
	<div class="message_preview">
		<span>2018.03.23</span>
		<a href="message.jsp">
			https://a0.muscache.com/defaults/user_pic-50x50.png?v=3
		</a>
	</div>
	</div>
</li>
</ul>
</div>

<div class="QnAcheckList_sg">
	<table border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>등록일</td>
		<td>답변여부</td>
	</tr>
	</table>
</div>




<!-- 페이지내용 끝 -->
</div>
</div><!-- 회원 관리 페이지 'subpage' include된 페이지의 div끝 !!지우지마세요!!-->
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>