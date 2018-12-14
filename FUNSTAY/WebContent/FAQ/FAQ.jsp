<%@page import="net.FAQ.db.FAQDAO"%>
<%@page import="java.util.List"%>
<%@page import="net.FAQ.db.FAQBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css'
 integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
<style>
<!-- css -->

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

#FAQ_wrap{
	text-align: center;
}
#FAQ_detail{
	width : 1000px;
	margin : 0 auto;
	}


#bor_num{
	text-align: center;
	margin-top:35px;
	padding-bottom: 30px;
}


#pen {
	margin: 0% 0% 0% 74%;
	cursor: pointer;
	padding : 10px;
}

#pen:hover{
	color:#cc1d1d;
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

<div class="panel_box"> 
  <!--FAQ시작 -->
  

  
  
  <%
		request.setCharacterEncoding("UTF-8");
	%>
	
	
	
	<%
		List FAQ_boardList = (List) request.getAttribute("boardList");
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pageNum = (String) request.getAttribute("pageNum");
		int pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
		int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	%>
<div id="FAQ_wrap">
	<h2>
		자주묻는질문 [ 전체글의 개수 : <%=count%>]
	</h2>
</div>

<!-- id가 admin이면 회원목록이 보이도록 하자. -->
	<%
	String email = (String)session.getAttribute("email");
		if (email != null) {
			if (email.equals("admin")) {
	%>
	<a href="./FAQ_boardWrite.fa"><i class='fas fa-pen-alt' style='font-size:27px' id="pen"></i></a>

	<%
			}
		}
	%>


<!-- <script src="./js/QnA/QnA.js"></script> -->
<div id="FAQ_detail">
	 	<%
			for (int i = 0; i < FAQ_boardList.size(); i++) {
				FAQBean fb = (FAQBean) FAQ_boardList.get(i);
		%>
		<button class="accordion" href="./FAQ_boardContent.fa?num=<%=fb.getFAQ_num()%>&pageNum=<%=pageNum%>"><%=fb.getFAQ_subject()%></button>
		
		<div class="panel_box">
		<p>
		<%=fb.getFAQ_content()%>
	 	</p>
	
</div> 
		<%
			}
		%> 
		

<div id="bor_num">

<%
		if (count != 0) {
			//전체 페이지수 구하기 게시판 
			//글 50개 한화면에 보여줄 글개수 10개일경우 => 전체 5 페이지
			//글 56개 한화면에 보여줄 글개수 10개일경우 => 전체 6 페이지
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			//한 화면에 보여줄 페이지 번호 개수
			int pageBlock = 10;
			//시작페이지 번호 1~10 => 1    11~20 => 11   21~30 => 21
			int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
			//		1		  = ((     2          - 1)/pageBlock)*pageBlock+1;
			//		1		  = ((     9          - 1)/pageBlock)*pageBlock+1;
			//		11		  = ((     12          - 1)/pageBlock)*pageBlock+1;
			//		11		  = ((     19          - 1)/pageBlock)*pageBlock+1;
			//끝페이지 번호
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			//이전
			if (startPage > pageBlock) {
	%><a href="./FAQ_boardList.fa?pageNum=<%=startPage - pageBlock%>">◀</a>
	<%
		}
			// 1~10
			for (int i = startPage; i <= endPage; i++) {
	%><a href="./FAQ_boardList.fa?pageNum=<%=i%>">  <%=i%>  
	</a>
	<%
		}
			//다음
			if (endPage < pageCount) {
	%><a href="./FAQ_boardList.fa?pageNum=<%=startPage + pageBlock%>">▶</a>
	<%
		}

		}
	%>
</div> 
	<!-- 	1 2 3 .....10  [다음] -->
	<!-- 	[이전] 11 12 13 ... 20 [다음] -->
	<!-- 	[이전] 21 22 23 ..27   [다음] -->





 
  </div>
  
  <script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>
  


<!-- 페이지내용 끝 -->
</div>
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>