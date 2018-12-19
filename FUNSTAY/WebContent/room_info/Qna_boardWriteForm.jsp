<%@page import="net.member.db.QnaBean"%>
<%@page import="net.FAQ.db.FAQBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.button1 {
    background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
    border-radius: 50%;
}

.button1:hover {background-color: #e7e7e7;}

</style>
<title>Funstay</title>
<!-- 페이지 default 링크 시작 -->
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="./css/default/login.css" rel="stylesheet">
<link href="./css/default/default.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="./css/default/subpage_content.css" rel="stylesheet">
<link href="./css/default/subpage.css" rel="stylesheet">
<script src="./js/default/jquery-3.3.1.js"></script>
<!-- 페이지 default 링크 끝-->
<link href="./css/QnA/QnA.css" rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">


<!--my_reserve.css  -->
<link href="./css/myinfo/my_reserve.css" rel="stylesheet">
<!--revewWrite.css  -->
<link href="./css/myinfo/reviewWrite.css" rel="stylesheet">
</head>

<body>
<%
request.setCharacterEncoding("UTF-8");

QnaBean qb = (QnaBean) request.getAttribute("qb");
String pageNum = (String) request.getAttribute("pageNum");
int num = ((Integer) request.getAttribute("num")).intValue();
String room_subject = (String)request.getAttribute("room_subject");
String Member_email = (String)request.getAttribute("Member_email");
%>

<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>
<!-- 회원 관리 페이지 왼쪽메뉴바 시작 -->
<jsp:include page="../include/subpage.jsp"></jsp:include>
<!-- 회원 관리 페이지 왼쪽메뉴바 끝 -->


<!-- 각 페이지 내용을  content 영역 안에 배치 해주세요.-->
<div id="content_DY">

<!-- 여기서부터 페이지 내용을 적어주세요. -->


<form class="w3-container" action="./Qna_boardWriteAction.sc?num=<%=qb.getHome_num()%>&pageNum=<%=pageNum%>" method="post">
<table border="0" align="center">
<tr><td><p class="letter">QnA 문의하기</p></td></tr>
<tr><td><h3>방 이름</h3></td><td><h3><input class="w3-input" type="hidden" name="home_num" value=<%=qb.getHome_num() %>>
<input class="w3-input" value="<%=room_subject %>" readonly></h3></td></tr>
<tr><td><h3>Email</h3></td><td><input class="w3-input" name="member_email" value="<%=Member_email %>" readonly></td></tr> 
<tr><td><h3>제목</h3></td><td><h3><input class="w3-input" name="subject" placeholder="제목을 입력해주세요..."></h3></td></tr>  
<tr><td><h3>내용</h3></td><td colspan="3"><textarea name="content" rows="30" cols="100" placeholder="내용을 입력해주세요..."></textarea></td></tr>
<tr><td colspan="3" align="right">
<button class="button button1">문의하기</button>
<button class="button button1" type="reset">다시쓰기</button> 
</td></tr> 
</table>
</form> 

<!-- 페이지내용 끝 -->
</div>
</div><!-- 회원 관리 페이지 'subpage' include된 페이지의 div끝 !!지우지마세요!!-->
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
<!--body끝  -->



</html>







