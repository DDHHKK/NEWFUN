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
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
    border: none;
    float: right;
    cursor: pointer;
}

.button1:hover {
	color: #cc1d1d;
}

#FAQ_wrap{
	text-align: center;
}
#FAQ_detail{
	width : 1000px;
	margin: 10px auto;
	}


#bor_num{
	text-align: center;
	margin-top:35px;
	padding-bottom: 30px;
}


#pen {
	margin: -2% 0% -1% 70%;
	cursor: pointer;
	padding : 10px;
	width: 105px;
}

#pen:hover{
	color:#cc1d1d;
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

/* .btn1:hover {
	background-color: #991515;
	color : #fff;
	} */
	
.m_over {	
	background : #cc1d1d;
	color : white;
	border:1px solid #cc1d1d;
	cursor: pointer;
    padding : 7px;
    font-weight: bolder;	}
	
.m_out {	
	background : white;	color : #cc1d1d;	
	border:1px solid #cc1d1d;
	cursor: pointer;
    padding : 7px;
    font-weight: bolder;}
	
.act {
	background : #cc1d1d;
	color : white;
	border:1px solid #cc1d1d;
	cursor: pointer;
    padding : 7px;
    font-weight: bolder;	}	
	
#btn2 {
	
    margin: 3% 0% 0% 24%;

}

#pen_a{
	
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

<div id="btn2">
<input type="button" value="전체" 
 onmouseover="over(this)" onmouseout="out(this)" onClick="clicks(this)" class="btn1" name="all" id="all">
<input type="button" value="숙소"
 onmouseover="over(this)" onmouseout="out(this)" onClick="clicks(this)" class="btn1" name="accom">
<input type="button" value="결제"
 onmouseover="over(this)" onmouseout="out(this)" onClick="clicks(this)" class="btn1" name="pay">
<input type="button" value="예약"
  onmouseover="over(this)" onmouseout="out(this)" onClick="clicks(this)"class="btn1" name="resev">
<input type="button" value="계정"
 onmouseover="over(this)" onmouseout="out(this)" onClick="clicks(this)" class="btn1" name="account">
<input type="button" value="요금/수수료"
 onmouseover="over(this)" onmouseout="out(this)" onClick="clicks(this)" class="btn1" name="money">
<input type="button" value="기타" 
 onmouseover="over(this)" onmouseout="out(this)" onClick="clicks(this)" class="btn1" name="etc">
</div>
<!-- id가 admin이면 회원목록이 보이도록 하자. -->

	<%
	String email = (String)session.getAttribute("email");
		if (email != null) {
			if (email.equals("admin")) {
	%>
	<i class='fas fa-pen-alt' style='font-size:20px' id="pen" onclick="location.href='./FAQ_boardWrite.fa'">FAQ작성</i>

	<%
			}
		}
	%>

<div id="FAQ_detail">
	 	<%
			for (int i = 0; i < FAQ_boardList.size(); i++) {
				FAQBean fb = (FAQBean) FAQ_boardList.get(i);
		%>
		<div class="panel_box">
		<button class="accordion" href="./FAQ_boardContent.fa?num=<%=fb.getFAQ_num()%>&pageNum=<%=pageNum%>"><%=fb.getFAQ_subject()%></button>
		
		<div class="panel">
		<p>
			<%=fb.getFAQ_content()%>
				<%
					String email1 = (String)session.getAttribute("email");
					if (email1 != null) {
					if (email1.equals("admin")) {
				%>
				
	
			<button class="button button1"
				onclick="location.href = './FAQ_boardDelete.fa?num=<%=fb.getFAQ_num()%>&pageNum=<%=pageNum%>'">
				<i class="fa fa-trash" style="font-size:24px"></i>
			</button>
			
			<button class="button button1"
				 onclick="location.href='FAQ_boardUpdate.fa?num=<%=fb.getFAQ_num()%>&pageNum=<%=pageNum%>'">
				 <i class="fa fa-edit" style="font-size:24px"></i>
			</button>

					<%
					}
				}
			%>
	 	</p> 
		</div> 
	
		<%
			}
		%> 
		</div>

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





/* FAQ 검색 버튼 색상 적용하는 쿼리 */

function over(obj){ 
	if(obj.className != "act") {
	obj.className = "m_over";
	}
	} 
	// 롤아웃 
	function out(obj){ 
	if(obj.className != "act") {
	obj.className = "m_out";
	}
	} 
	// 클릭 
	function clicks(obj){ 
	var divs = document.getElementById("btn2").getElementsByTagName("input"); 
	for(var i=0; i<divs.length; i++){ 
	divs[i].className = "m_out";
	}
	obj.className = "act";
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