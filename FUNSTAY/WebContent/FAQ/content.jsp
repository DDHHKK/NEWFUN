<%@page import="java.util.List"%>
<%@page import="net.FAQ.db.FAQDAO"%>
<%@page import="net.FAQ.db.FAQBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
    /* border: 2px solid #cc1d1d; */
    border:none;
}

.button1:hover {background-color: #991515;}


#FAQ_wrap{
	width : 1000px;
	margin : 0 auto;
}


.w3-input {

	padding-left: 10px; 
	padding : 10px;
	border: #fff;
	border-bottom: 1px solid #cccccc;
}

table textarea {
	padding: 10px; 
	border : 1px solid #cccccc;

}

#btn111 {
	text-align: right;
	padding-top : 10px;
}

h3 {
	padding : 5px;

}

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
	FAQBean fb = (FAQBean) request.getAttribute("fb");
	String pageNum = (String) request.getAttribute("pageNum");
	int num = ((Integer) request.getAttribute("num")).intValue();
	%>

<div id="FAQ_wrap">		
	<table align="center">



<!-- <tr><td><h3>번호</h3></td><td><input type="text" name="FAQ_num"></td></tr> -->
<tr><td><h3>제목</h3></td><td><input class="w3-input" name="FAQ_subject" size="100" id="subject" value="<%=fb.getFAQ_subject()%>" readonly></td></tr>
<tr><td><h3>내용</h3></td><td><textarea name="FAQ_content" rows="30" cols="100" readonly><%=fb.getFAQ_content()%></textarea></td></tr>
			
			<!-- id가 admin이면 회원목록이 보이도록 하자. -->
	<%
	String email = (String)session.getAttribute("email");
		if (email != null) {
			if (email.equals("admin")) {
	%>

	<tr><td colspan="2" id="btn111"><button class="button button1"
			 onclick="location.href='FAQ_boardUpdate.fa?num=<%=num%>&pageNum=<%=pageNum%>'">글수정</button>
			 <button class="button button1"
			onclick="location.href = './FAQ_boardDelete.fa?num=<%=fb.getFAQ_num()%>&pageNum=<%=pageNum%>'">글삭제</button>
			 <button class="button button1"
			 onclick="location.href = './FAQ_boardList.fa?pageNum=<%=pageNum%>'">글목록</button></td></tr>
	

	<%
			}
		}
	%>
		
</table>
</div>		
	
<!-- 페이지내용 끝 -->
</div>
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>


