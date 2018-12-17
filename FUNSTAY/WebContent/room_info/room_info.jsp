<!-- http://kirinyaga.tistory.com/21 스크롤 -->
<%@page import="net.bed.db.BedBean"%>
<%@page import="net.room.db.RoomBean"%>
<%@page import="net.conv.db.ConvBean"%>
<%@page import="net.review.db.ReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="net.search.db.SearchBean"%>
<%@page import="net.member.db.QnaBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	String room_subject = sc.getRoom_subject();
	%>
			
<!-- room_wrapper -->
<!-- <marquee behavior=scroll><b>☆숙소를 소개합니다☆</b></marquee> -->

<div id="room_wrap" style="width:75%;margin:0 auto;">
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
 	<!-- 네비게이션 바 -->
 		<ul class="roomdetailNav_sg">
 			<li><a href="#room_info1">방 정보</a></li>
 			<li><a href="#room_facility1">편의시설 </a></li>
 			<li><a href="#room_area1">위치 정보 </a></li>
 			<li><a href="#room_review1">후기 </a></li>
 			<li style="height:21px;line-height:23px;"><a href="#room_qna1">문의</a></li>
 		</ul>
 	<hr style="display:block;margin:0;padding:0;">  
      
 	
 	<!-- <a href="#"><img src="./img/메일.jpg" alt="mail" align="right"></a> -->
 	<!-- <a href="#"><img src="./img/smile.png" alt="smile" align="right"></a> -->
 	
 	
<!-- room_content --> 	
 	<div id="room_content">
 	
 	
 	<!-- 숙소 정보 및 이용 규칙 -->
 	<h3 id="room_rule1">숙소 정보</h3>
	<div id="room_rule" style="padding:20px;border:1px solid #cccccc;">
	체크인 시간 - <%=sc.getIn_time() %> <br>
	체크아웃 시간 - <%=sc.getOut_time() %> <br>
	화장실 개수 : <%=sc.getRestroom() %><br> 
		<!-- 숙소 소개 내용 -->
	 <%=sc.getRoom_content() %> <br>
	</div>
	</div>

<!-- 룸정보 -->
	<h3 id="room_info1">방 정보</h3>
	<div id="room" style="padding:20px;border:1px solid #cccccc;">
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
	<h3 id="room_facility1">편의시설</h3>
	<div id="room_facility" style="padding:20px;border:1px solid #cccccc;">
			 
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
	<h3 id="room_area1">지역정보</h3>
	<div id="room_area" style="padding:20px;border:1px solid #cccccc;">
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
<h3 id="room_review1">후기 <%-- <%=count%>개 --%> </h3>
<div id="room_review" style="padding:20px;border:1px solid #cccccc;">
<%
	request.setCharacterEncoding("UTF-8");

	List ReviewList = (List) request.getAttribute("boardList");
	int count = ((Integer) request.getAttribute("count")).intValue();
	pageNum = (String) request.getAttribute("pageNum");
	int pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	sc = (SearchBean) request.getAttribute("sc");
	num = ((Integer) request.getAttribute("num")).intValue();
%>


	<button class="button_sg button1_sg"
			 onclick="location.href='ReviewWrite.bk?num=<%=num%>&pageNum=<%=pageNum%>'">후기쓰기</button>
	<div id="room_review">
	
	

	<%
			for (int i = 0; i < ReviewList.size(); i++) {
				ReviewBean re = (ReviewBean) ReviewList.get(i);
	%>
  
<table border="1" align="center">
	<tr>
	<th>평점</th> 
	<th colspan="3"> 
	<span class="star-prototype"><%=re.getStar() %></span>  
	</th>  
	</tr>
	<tr>
	<th><img src="./img/user.png" alt="img02" width="50px" height="50px"></th>
	<th> <%=re.getReview_date() %></th>
   	<th colspan="2"><%=re.getMember_email() %></th> 
    <tr><th colspan="5"><%=re.getContent() %></th></tr>
    <tr><th>만족도</th><th colspan="4"><span class="star-prototype"><%=re.getSatisfaction() %></span></th></tr>
    <tr><th>청결함</th><th colspan="4"><span class="star-prototype"><%=re.getClean() %></span></th></tr>
	<tr><th>교통접근성</th><th colspan="4"><span class="star-prototype"><%=re.getAccess()%></span></th></tr>
</table> 
		<script type="text/javascript"> 
				$.fn.generateStars = function() {
  			  return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
			};

			// 숫자 평점을 별로 변환하도록 호출하는 함수
			$('.star-prototype').generateStars();
		</script>
		<%
			}   
		%>  

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
	%><a href="./ReviewList.re?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	<%
		}
			// 1~10
			for (int i = startPage; i <= endPage; i++) {
	%><a href="./ReviewList.re?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			//다음
			if (endPage < pageCount) {
	%><a href="./ReviewList.re?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
		}

		}
	%>

</div>
</div>
<br><br>


<!-- room_qna -->
<h3 id="room_qna1">QnA <%-- <%=count1%>개 --%> </h3>
<div id="room_qna" style="padding:20px;border:1px solid #cccccc;">
	<%
	request.setCharacterEncoding("UTF-8");
	
	List QnAList = (List) request.getAttribute("QnAList");
	int count1 = ((Integer) request.getAttribute("count1")).intValue();
	pageNum = (String) request.getAttribute("pageNum");
	pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
	currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	QnaBean qa = (QnaBean) request.getAttribute("qa");
	num = ((Integer) request.getAttribute("num")).intValue();
	 %>


<button class="button_sg"
			 onclick="location.href='Qna_boardWrite.sc?num=<%=num%>&pageNum=<%=pageNum%>&room_subject=<%=room_subject %>'" style="background-color:white;color:gray;float:right;font-weight:bold;border:1px solid gray;">호스트에게 문의하기</button>
	<div id="room_qna">
	<% for (int i = 0; i < QnAList.size(); i++) {
		QnaBean qn = (QnaBean) QnAList.get(i);
	%>
		<button class="accordion_sg">
	
			<table>
				<tr>
					<td style="width:500px;"><%=qn.getSubject() %></td><td style="width:200px;"><%=qn.getMember_email() %>
					</td><td style="width:200px;"><%=qn.getQnA_date() %></td><td style="width:200px;">
					<%if(qn.getRe_seq()==1){%>
						답변완료
							<%}else{%>
						답변중
					<%}%></td>
				</tr>
			</table> 
		</button>
		<div class="panel_sg">
  			<p>
  				<img src="./img/user.png" alt="img02" width="50px" height="50px">
				<%=qn.getSubject() %>
				<hr>
				답글이 있다면 출력하기
  			</p>
		</div>

	<% } %>
		<div style="text-align: center;">
<%
		if (count1 != 0) {
			//전체 페이지수 구하기 게시판 
			//글 50개 한화면에 보여줄 글개수 10개일경우 => 전체 5 페이지
			//글 56개 한화면에 보여줄 글개수 10개일경우 => 전체 6 페이지
			int pageCount = count1 / pageSize + (count1 % pageSize == 0 ? 0 : 1);
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
	%><a href="./QnAList.qn?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	<%
		}
			// 1~10
			for (int i = startPage; i <= endPage; i++) {
	%><a href="./QnAList.qn?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			//다음
			if (endPage < pageCount) {
	%><a href="./QnAList.qn?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
		}

		}
	%>
</div>
</div>

<script>
var acc = document.getElementsByClassName("accordion_sg");
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
</div>
<br><br> 
 
 
 	</div> 
 	
 	<!-- room_box.jsp -->
 <jsp:include page="room_box.jsp"></jsp:include>
  </div>
</div>