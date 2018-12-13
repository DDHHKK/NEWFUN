<!-- http://kirinyaga.tistory.com/21 스크롤 -->
<%@page import="net.review.db.ReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="net.search.db.SearchBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<!-- css -->
<link href = "./css/room_info/room_info.css" rel="stylesheet">
<link href = "./css/login1.css" rel="stylesheet">
<!-- 검색 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Kodchasan" rel="stylesheet">
<!-- 로그인 jquery -->
<script src="./js/login.js"></script>


<!-- date picker api  -->
<link href="./dist/css/datepicker.min.css" rel="stylesheet"type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>


<script src="./dist/js/caleander.js"></script>
<script src="./dist/js/datepicker.js"></script>
<script src="./dist/js/datepicker.min.js"></script>
<script src="./dist/js/i18n/datepicker.en.js"></script>
<!-- room_info scroll박스 -->
<script src="./js/room_info/scroll.js"></script>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>


<body>
<div class="room_menu">
</div>

<!-- room_border -->
<div id="room_border">

<!-- room_photo.jsp -->
 <jsp:include page="room_photo.jsp"></jsp:include>
 
 	<%
 	request.setCharacterEncoding("UTF-8");
 	
	SearchBean sc = (SearchBean) request.getAttribute("sc");
	String pageNum = (String) request.getAttribute("pageNum");
	int num = ((Integer) request.getAttribute("num")).intValue();
	%>
			
<!-- room_wrapper -->
<marquee behavior=scroll><b>☆숙소를 소개합니다☆</b></marquee>

<div id="room_wrap">
 <div id="room_detail">
 	<div id="room_imfomation">
 	<h2><a href="#">개요 </a> 
 	<a href="#편의시설">·편의시설 </a><a href="#지역정보">·지역정보 </a><a href="#숙소이용규칙">·숙소이용규칙 </a>
 	<a href="#후기">·후기  </a><a href="#QnA">·QnA  </a></h2>
 	<hr>  
      
 	
 	<a href="#"><img src="./img/메일.jpg" alt="mail" align="right"></a>
 	<a href="#"><img src="./img/smile.png" alt="smile" align="right"></a>
 	
 	
<!-- room_content --> 	
 	<div id="room_content">
 	<h1><%=sc.getRoom_subject() %></h1><br><br> 
 	 <%=sc.getRoom_type() %> <br>
	 <%=sc.getRoom_content() %> <br> 
<br><br>
	</div>


<!-- room_facility --> 
	<div id="room_facility">
<a name="편의시설"><h1>편의시설</h1></a><br><br> 
화장실 개수 : <%=sc.getRestroom() %> 
<br><br>
	</div>


<!-- room_area -->
	<div id="room_area">
	<a name="지역정보"><h1>지역정보</h1></a><br><br>
<%=sc.getAddress() %>
	</div>
<br><br>


<!-- room_rule -->
	<div id="room_rule">
	<a name="숙소이용규칙"><h1>숙소이용규칙</h1></a>
	체크인 시간 - <%=sc.getIn_time() %> <br>
	체크아웃 시간 - <%=sc.getOut_time() %> <br> 
	</div>
</div>
 <br><br>
 
 
 <!-- room_review -->
<div id="room_review">
<jsp:include page="room_review.jsp"></jsp:include>
</div>
<br><br>



<!-- room_qna -->
<div id="room_qna">
<jsp:include page="room_qna.jsp"></jsp:include>
</div>
<br><br>
 
 
 	</div> 
 	
 	<!-- room_box.jsp -->
 <jsp:include page="room_box.jsp"></jsp:include>
  </div>
</div>

  
</body>
</html>