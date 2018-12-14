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
<!-- 페이지 default 링크 끝-->
<link href="./css/QnA/QnA.css" rel="stylesheet">
</head>
<body>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>
<%
request.setCharacterEncoding("UTF-8");

QnaBean qb = (QnaBean) request.getAttribute("qb");
String pageNum = (String) request.getAttribute("pageNum");
int num = ((Integer) request.getAttribute("num")).intValue();
%>


<form class="w3-container" action="./Qna_boardWriteAction.sc" method="post">
<table border="0" align="center">
<tr><td><h2>QnA 글쓰기</h2></tr></td>
<!-- <tr><td><h3>번호</h3></td><td><input class="w3-input" name="QnA_num" placeholder="QnA_num을 입력해주세요..."></td></tr>  -->
<tr><td><h3>Email</h3></td><td><input class="w3-input" name="member_email" placeholder="member_email을 입력해주세요..."></td></tr> 
<tr><td><h3>Home_num</h3></td><td><h3></h3><input class="w3-input" name="home_num" placeholder="Home_num을 입력해주세요..."><%=qb.getHome_num() %></h3></td></tr> 
<tr><td><h3>제목</h3></td><td><input class="w3-input" name="subject" placeholder="제목을 입력해주세요..."></td>
<td><h3>비밀번호</h3></td><td><input class="w3-input" name="QnA_pass" placeholder="비밀번호를입력해주세요..."></td></tr>
<tr><td><h3>내용</h3></td><td colspan="3"><textarea name="content" rows="30" cols="100" placeholder="내용을 입력해주세요..."></textarea></td></tr>
<tr><td colspan="3" align="right">
<button class="button button1">글쓰기</button>
<button class="button button1" type="reset">다시쓰기</button> 
</td></tr>
</table>
</form>

</div>
<div class="clear"></div>
<hr> 
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>
</body>
</html>







