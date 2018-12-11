
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
<title>FunStay</title>
<!-- 페이지 default 링크 시작 -->
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="./css/default/login.css" rel="stylesheet">
<link href="./css/default/default.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 페이지 default 링크 끝-->


<!-- 
	css파일 연결할때 예시 
	<link href="../css/jsp파일이 있는 폴더와 동일한 폴더를 css폴더 안에 만들고 폴더의 이름을 이곳에 써주세요/css파일 이름.css" rel="stylesheet"> 
	[예시] : message폴더에 message_list.jsp파일을 만들었을 경우
		css>message>message_list.css 파일이있어야합니다. 아래는 적용 link코드 입니다.
		<link href="../css/message/message_list.css" rel="stylesheet">	
	** js파일 적용방법도 동일합니다.
	 	<script src="../js/mypage/message_list.js"></script>
	** 해당 페이지의 연결링크와 스크립트를 head에 넣을때 default링크와 섞이지 않도록 주석으로 구분해서 넣어주세요
-->
<link href="./css/QnA/QnA.css" rel="stylesheet">


</head>
<body>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>

<div id="content">
<!-- 페이지내용 시작 -->


	<%
		int num = ((Integer)request.getAttribute("num")).intValue();
		String pageNum = (String)request.getAttribute("pageNum");
		FAQBean fb = (FAQBean)request.getAttribute("fb");
		
	%>
	
	
<form class="w3-container" action="./FAQ_boardUpdateAction.fa?pageNum=<%=pageNum %>" method="post" name="fr">
<table border="0" align="center">
<tr><td><h3>번호</h3></td><td><input class="w3-input" name="FAQ_num" value="<%=fb.getFAQ_num()%>"></td></tr>
<tr><td><h3>제목</h3></td><td><input class="w3-input" name="FAQ_subject" value="<%=fb.getFAQ_subject()%>" placeholder="제목을 입력해주세요..."></td></tr>
<tr><td><h3>내용</h3></td><td><textarea rows="30" cols="50" name="FAQ_content" placeholder="내용을 입력해주세요..."><%=fb.getFAQ_content()%></textarea></td></tr>
<tr><td colspan="3" align="right">
<button class="button button1">글수정</button>
</td></tr>
</table>
</form>
	


			 
<!-- 페이지내용 끝 -->
</div>
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>


