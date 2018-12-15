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
<!-- <link href = "./css/login1.css" rel="stylesheet">
검색 폰트
<link href="https://fonts.googleapis.com/css?family=Kodchasan" rel="stylesheet">
로그인 jquery
<script src="./js/login.js"></script> -->


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
<!-- <marquee behavior=scroll><b>☆숙소를 소개합니다☆</b></marquee> -->

<div id="room_wrap" style="width:80%;margin:0 auto;">
 <div id="room_detail">
 	<div id="room_imfomation" style="margin-top: 25px;">
 	<!-- 숙소제목 -->
 	<div>
 		<h1 style="color:#cc1d1d;display:block;float:left;margin-top:0;"><%=sc.getRoom_subject() %></h1>
 		<span class="home_type_sg">
 			<!-- 룸타입 -->
 			<%=sc.getRoom_type() %>
 		</span>
 		<i class="far" id="modaltrigger_shj" style="cursor:pointer;color:#cc1d1d;float:right;font-size:30px;">&#xf004;</i>
 	</div>
 	<div class="clear"></div>
 	<hr>  
      
 	
 	<!-- <a href="#"><img src="./img/메일.jpg" alt="mail" align="right"></a> -->
 	<!-- <a href="#"><img src="./img/smile.png" alt="smile" align="right"></a> -->
 	
 	
<!-- room_content --> 	
 	<div id="room_content">
 	<!-- 네비게이션 바 -->
 		<ul class="roomdetailNav_sg">
 			<li><a href="#room_imfomation">개요 </a> </li>
 			<li><a href="#room">방정보</a></li>
 			<li><a href="#room_facility">편의시설 </a></li>
 			<li><a href="#room_area">지역정보 </a></li>
 			<li><a href="#room_review">후기 </a></li>
 			<li style="height:21px;line-height:23px;"><a href="#QnA">QnA</a></li>
 		</ul>
 	<div>
 	
 	<!-- 숙소 정보 및 이용 규칙 -->
	<div id="room_rule">
	<h3>숙소 정보</h3>
	체크인 시간 - <%=sc.getIn_time() %> <br>
	체크아웃 시간 - <%=sc.getOut_time() %> <br>
	화장실 개수 : <%=sc.getRestroom() %><br> 
	</div>
		<!-- 숙소 소개 내용 -->
	 <%=sc.getRoom_content() %> <br>
	</div>
	</div>

<!-- 룸정보 -->
	<div id="room">
	<h3>방 정보</h3>
		<table>
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
				
				<% if(i%4==3){ %>
				</tr>
				<%} } %>
				</table>
	</div>

	<!-- 편의시설 --> 
	<div id="room_facility">
			<h3>편의시설</h3> 
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
				<i class='fas fa-paw' style='color:#cc1d1d;margin-left:20px;'></i> 반려동물
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
	</div>


	<!-- 숙소 위치 -->
	<div id="room_area">
	<h3>지역정보</h3>
		<input type="text" value="<%=sc.getAddress()%>" id="address" readonly style="border:none;">
		<div id="map" style="width:500px;height:350px;border-radius:20px;"></div>
	</div>
	<!---------------------- 지도 api 불러오기 ---------------------->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=115e03bc5638ee4a157bfc3449c61c9e&libraries=services"></script>
		<script>
		var geocoder = new daum.maps.services.Places();
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		var loc = $("#address").val();
		geocoder.addressSearch(loc, function(result, status, place) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		        /* place.y = result[0].y;
		        place.x = result[0].x; */
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        /* // 인포윈도우로 장소에 대한 설명을 표시합니다
		       var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+place.place_name+'</div>'
		        });
		        infowindow.open(map, marker); */
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		</script>
	<!---------------------- 지도 api 불러오기 ---------------------->
	</div>
 
 
 <!-- room_review -->
<div id="room_review">
<jsp:include page="room_review.jsp"></jsp:include>
</div>
<br><br>


<!-- room_qna -->
<div id="room_qna"">
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