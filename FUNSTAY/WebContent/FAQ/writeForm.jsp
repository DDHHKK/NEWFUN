<%@page import="net.FAQ.db.FAQBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
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
    background-color: #cc1d1d;
    color: #ffffff;
    /* border: 2px solid #e7e7e7; */
    border:none;
}

.button1:hover {background-color: #991515;}


/* 김다현 수정 */


h2{
	
    border-left: 5px solid #666;
    padding-left: 7px;
    color: #666;
    margin-bottom: 70px;
    /* padding: 0px 0; */
    box-sizing: border-box;
    height: 46px;
 }
 
.w3-input {

	padding-left: 10px; 
	padding : 7px;
}

table textarea {
	padding: 10px; 

}

.btn1 {
	background-color: #fff;
	border:1px solid #cc1d1d;
    color: #cc1d1d;
    /* border: 2px solid #e7e7e7; */
    cursor: pointer;
    padding : 7px;
    font-weight: bolder;
  

}

.btn1:hover {
	background-color: #991515;
	color : #fff;
	}

#btn2 {
	margin:0% 0% 0% 69%;

}
 

</style>


<title>Funstay</title>
<!-- 페이지 default 링크 시작 -->
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="./css/default/login.css" rel="stylesheet">
<link href="./css/login1.css" rel="stylesheet">
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
String pageNum = (String) request.getAttribute("pageNum");
%>


<form class="w3-container" action="./FAQ_boardWriteAction.fa" method="post" name="fr">
<table align="center">


<tr><td><h2>FAQ 글쓰기</h2></td></tr>

<tr><td colspan="3">
<div id="btn2">
<input type="button" value="숙소" onclick="fun1()" class="btn1">
<input type="button" value="결제" onclick="fun2()" class="btn1">
<input type="button" value="예약" onclick="fun3()" class="btn1">
<input type="button" value="계정" onclick="fun4()" class="btn1">
<input type="button" value="요금/수수료" onclick="fun5()" class="btn1">
</div>
</td></tr>



<!-- <tr><td><h3>번호</h3></td><td><input type="text" name="FAQ_num"></td></tr> -->
<tr><td><h3>제목</h3></td><td><input class="w3-input" name="FAQ_subject" size="100" id="subject"></td></tr>
<tr><td><h3>내용</h3></td><td><textarea name="FAQ_content" rows="30" cols="100"></textarea></td></tr>
<tr><td colspan="3" align="right">
<br>
<button class="button button1">등록</button>
<button class="button button1" type="reset">다시쓰기</button> 

</td></tr>
</table>
</form>


<script type="text/javascript">

function fun1() {
	document.getElementById("subject").value="[숙소]";
}

function fun2() {
	document.getElementById("subject").value="[결제]";
}

function fun3() {
	document.getElementById("subject").value="[예약]";
}

function fun4() {
	document.getElementById("subject").value="[계정]";
}

function fun5() {
	document.getElementById("subject").value="[요금/수수료]";
}


</script>


</div>
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>








