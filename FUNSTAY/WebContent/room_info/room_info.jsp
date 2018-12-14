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

<!-- 편의시설 아이콘 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.1/css/all.css'
	integrity='sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz' crossorigin='anonymous'>

</head>
<!-- <meta charset="UTF-8">
<title>Insert title here</title> -->


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
 	 화장실 개수 : <%=sc.getRestroom() %><br>
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
<a id="convenience"><h1>편의시설</h1></a><br><br> 
<%if(cb.getEssential()==1){%>
	<i class='far fa-lightbulb' style='font-size:20px;color:#cc1d1d;margin-left:20px;'></i> 필수품목
<%}%>
<%if(cb.getWifi()==1){%>
	<i class="fa fa-wifi" style='font-size:20px;color:#cc1d1d;margin-left:20px;'></i> 와이파이
<%}%>
<%if(cb.getParking()==1){%>
	<i class='fas fa-parking' style='font-size:20px;color:#cc1d1d;margin-left:20px;'></i> 주차가능
<%}%>
<%if(cb.getShampoo()==1){%>
	<img src="./img/icon/shampoo.png" width="15px" height="25px" style='color:#cc1d1d;margin-left:20px;'> 샴푸
<%}%>
<%if(cb.getAir_conditioner()==1){%>
	<i class='fas fa-thermometer-empty' style='font-size:20px;color:#cc1d1d;margin-left:20px;'></i> 에어컨
<%}%>
<%if(cb.getHeat()==1){%>
	<i class='fas fa-thermometer-full' style='font-size:20px;color:#cc1d1d;margin-left:20px;'></i> 난방
<%}%>
<%if(cb.getAnimal()==1){%>
	<i class='fas fa-paw' style='color:#cc1d1d;margin-left:20px;'></i> 반려동물<br>
<%}%>
<%if(cb.getDisabled()==1){%>
	<i class='fab fa-accessible-icon' style='font-size:20px;color:#cc1d1d;margin-left:20px;'></i> 장애인시설
<%}%>
<%if(cb.getParty()==1){%>
	<i class='fas fa-birthday-cake' style='font-size:20px;color:#cc1d1d;margin-left:20px;'></i> 파티가능
<%}%>
<%if(cb.getPickup()==1){%>
	<i class="fa fa-car" style='font-size:20px;color:#cc1d1d;margin-left:20px;'></i> 픽업가능
<%}%>
<%if(cb.getElevator()==1){%>
	<i class='fas fa-sort' style='font-size:20px;color:#cc1d1d;margin-left:20px;'></i> 엘리베이터
<%}%>
<%if(cb.getBreakfast()==1){%>
	<i class='fas fa-utensils' style='color:#cc1d1d;margin-left:20px;'></i> 조식제공
<%}%>
<%if(cb.getSmoking()==1){%>
	<i class='fas fa-smoking' style='color:#cc1d1d;margin-left:20px;'></i> 흡연가능
<%}%>
<%if(cb.getLaundry()==1){%>
	<img src="./img/icon/washing.png" width="15px" height="20px" style='color:#cc1d1d;margin-left:20px;'> 세탁기
<%}%>
<%if(cb.getIron()==1){%>
	<img src="./img/icon/iron-512.png" width="20px" height="20px" style='color:#cc1d1d;margin-left:20px;'> 다리미
<%}%>
<%if(cb.getDesk()==1){%>
	<img src="./img/icon/table-512.png" width="20px" height="20px" style='color:#cc1d1d;margin-left:20px;'> 업무가능공간/책상
<%}%>
<%if(cb.getExtra_bed()==1){%>
	<i class='fas fa-bed' style='font-size:20px;color:#cc1d1d;margin-left:20px;'></i> 간이침대
<%}%>
<%if(cb.getHair_dryer()==1){%>
	<img src="./img/icon/hair_dryer-512.png" width="20px" height="20px" style="color:#cc1d1d;margin-left:20px;"> 헤어드라이기
<%}%>

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