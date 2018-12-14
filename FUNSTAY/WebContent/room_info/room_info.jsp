<!-- http://kirinyaga.tistory.com/21 스크롤 -->
<%@page import="net.bed.db.BedBean"%>
<%@page import="net.room.db.RoomBean"%>
<%@page import="net.conv.db.ConvBean"%>
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
	ConvBean cb=(ConvBean)request.getAttribute("cb");
	List<RoomBean> rooms = (List)request.getAttribute("rooms");
	List<BedBean> bed_list = (List)request.getAttribute("bed_list");
	%>
			
<!-- room_wrapper -->
<marquee behavior=scroll><b>☆숙소를 소개합니다☆</b></marquee>

<div id="room_wrap">
 <div id="room_detail">
 	<div id="room_imfomation">
 	<!-- 숙소제목 -->
 	<h1 style="color:#cc1d1d;"><%=sc.getRoom_subject() %></h1>
 	<hr>  
      
 	
 	<!-- <a href="#"><img src="./img/메일.jpg" alt="mail" align="right"></a> -->
 	<!-- <a href="#"><img src="./img/smile.png" alt="smile" align="right"></a> -->
 	
 	
<!-- room_content --> 	
 	<div id="room_content">
 	<!-- 네비게이션 바 -->
 		<ul class="roomdetailNav_sg">
 			<li><a href="#room_imfomation">개요 </a> </li>
 			<li><a href="#room">방정보</a></li>
 			<li><a href="#convenience">편의시설 </a></li>
 			<li><a href="#location">지역정보 </a></li>
 			<li><a href="#room_rule">숙소이용규칙 </a></li>
 			<li><a href="#review">후기 </a></li>
 			<li><a href="#QnA">QnA</a></li>
 		</ul>
 	<!-- <h2>
 		<a href="#">개요 </a> 
 		<a href="#편의시설">·편의시설 </a><a href="#지역정보">·지역정보 </a><a href="#숙소이용규칙">·숙소이용규칙 </a>
 		<a href="#후기">·후기  </a><a href="#QnA">·QnA </a>
 	</h2> -->
 		<!-- 룸타입 -->
 	<div>
 	 <%=sc.getRoom_type() %> <br>
 		<!-- room_rule -->
	<div id="room_rule">
	<a><h1>숙소이용규칙</h1></a>
	체크인 시간 - <%=sc.getIn_time() %> <br>
	체크아웃 시간 - <%=sc.getOut_time() %> <br> 
	</div>
		<!-- 숙소 소개 내용 -->
	 <%=sc.getRoom_content() %> <br> 
<br><br>
	</div>
	</div>

<!-- 룸정보 -->
	<div id="room">
		<table>
				<!-- <div style="border:1px solid #cccccc;border-radius:10px;width:150px;height:110px;padding:10px;">1번 방</div> -->
				<% for(int i=0; i<rooms.size(); i++) { 
					RoomBean rb = (RoomBean)rooms.get(i);
					BedBean bb = (BedBean)bed_list.get(i);
				if(i%4==0) { %>
				<tr> <%} %>
				
				<td>
					<div style="border:1px solid #cccccc;border-radius:10px;width:150px;height:110px;padding:10px;">
						<b><%=rb.getRe_room()%>번방</b><br>
						<%-- <%=rb.getRoom_num()%><br> --%>
						최대 <%=rb.getMax_people()%>명<br>
						<%for(int z=0; z<bb.getSingle_bed(); z++){ %>
							<img src="./img/host/single_bed.png" style="width:35px;height:35px;">
						<%
						}for(int z=0; z<bb.getDouble_bed(); z++){ %>
							<img src="./img/host/double_bed.png" style="width:35px;height:35px;">
						<%
						}for(int z=0; z<bb.getBunk_bed(); z++){ %>
							<img src="./img/host/bunk_bed.png" style="width:35px;height:35px;">
						<%} %>
					</div>
				</td>
				
				<% if(i%4==2){ %>
				</tr>
				<%} } %>
				</table>
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
<!---------------------- 지도 api 불러오기 ---------------------->
<br><br>

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