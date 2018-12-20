<!-- http://kirinyaga.tistory.com/21 스크롤 -->
<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.search.db.SearchDAO"%>
<%@page import="net.bed.db.BedBean"%>
<%@page import="net.room.db.RoomBean"%>
<%@page import="net.conv.db.ConvBean"%>
<%@page import="net.review.db.ReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="net.search.db.SearchBean"%>
<%@page import="net.member.db.QnaBean"%>
<%@page import="java.util.List"%>
<%@page import="net.search.db.SearchBean"%>
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
	int R_max_people = 0;
	int basic_people =0;
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
 	
 <%for(int i=0; i<rooms.size(); i++) { 
		RoomBean rb = (RoomBean)rooms.get(i);
		BedBean bb = (BedBean)bed_list.get(i); 
		
		basic_people=basic_people+rb.getMin_people();
		R_max_people=R_max_people+rb.getMax_people();
 }
%>
<!-- room_content --> 	
 	<div id="room_content">
 	
 	
 	<!-- 숙소 정보 및 이용 규칙 -->
 	<h3 id="room_rule1">숙소 정보</h3>
	<div id="room_rule" style="padding:20px;border:1px solid #cccccc;">
	체크인 시간 - <%=sc.getIn_time() %> <br>
	체크아웃 시간 - <%=sc.getOut_time() %> <br>
	화장실 개수 : <%=sc.getRestroom() %><br>
	기본요금 적용 인원 : <%=basic_people%> 명<br>
	최대 숙박 가능 인원: <%=R_max_people %> 명<br><br>
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
					<div style="border:1px solid #cccccc;border-radius:10px;width:150px;height:130px;padding:10px;">
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
	<div id="room_facility" style="padding:20px;border:1px solid #cccccc;overflow:hidden;padding-top:40px;">
			 
			<%if(cb.getEssential()==1){%>
				<div style="width:150px;float:left;height:50px;height:30px;">
				<i class='far fa-lightbulb' style='font-size:20px;margin-left:20px;'></i> 필수품목
				</div>
			<%}%>
			<%if(cb.getWifi()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class="fa fa-wifi" style='font-size:20px;margin-left:20px;'></i> 와이파이
				</div>
			<%}%>
			<%if(cb.getParking()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class='fas fa-parking' style='font-size:20px;margin-left:20px;'></i> 주차가능
				</div>
			<%}%>
			<%if(cb.getShampoo()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<img src="./img/icon/shampoo.png" width="15px" height="25px" style='margin-left:20px;'> 샴푸
				</div>
			<%}%>
			<%if(cb.getAir_conditioner()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class='fas fa-thermometer-empty' style='font-size:20px;margin-left:20px;'></i> 에어컨
				</div>
			<%}%>
			<%if(cb.getHeat()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class='fas fa-thermometer-full' style='font-size:20px;margin-left:20px;'></i> 난방
				</div>
			<%}%>
			<%if(cb.getAnimal()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class='fas fa-paw' style='margin-left:20px;'></i> 반려동물
				</div>
			<%}%>
			<%if(cb.getDisabled()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class='fab fa-accessible-icon' style='font-size:20px;margin-left:20px;'></i> 장애인시설
				</div>
			<%}%>
			<%if(cb.getParty()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class='fas fa-birthday-cake' style='font-size:20px;margin-left:20px;'></i> 파티가능
				</div>
			<%}%>
			<%if(cb.getPickup()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class="fa fa-car" style='font-size:20px;margin-left:20px;'></i> 픽업가능
				</div>
			<%}%>
			<%if(cb.getElevator()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class='fas fa-sort' style='font-size:20px;margin-left:20px;'></i> 엘리베이터
				</div>
			<%}%>
			<%if(cb.getBreakfast()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class='fas fa-utensils' style='margin-left:20px;'></i> 조식제공
				</div>
			<%}%>
			<%if(cb.getSmoking()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class='fas fa-smoking' style='margin-left:20px;'></i> 흡연가능
				</div>
			<%}%>
			<%if(cb.getLaundry()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<img src="./img/icon/washing.png" width="15px" height="20px" style='margin-left:20px;'> 세탁기
				</div>
			<%}%>
			<%if(cb.getIron()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<img src="./img/icon/iron-512.png" width="20px" height="20px" style='margin-left:20px;'> 다리미
				</div>
			<%}%>
			<%if(cb.getDesk()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<img src="./img/icon/table-512.png" width="20px" height="20px" style='margin-left:20px;'> 업무가능공간
				</div>
			<%}%>
			<%if(cb.getExtra_bed()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<i class='fas fa-bed' style='font-size:20px;margin-left:20px;'></i> 간이침대
				</div>
			<%}%>
			<%if(cb.getHair_dryer()==1){%>
				<div style="width:150px;float:left;height:50px;">
				<img src="./img/icon/hair_dryer-512.png" width="20px" height="20px" style="margin-left:20px;"> 헤어드라이기
				</div>
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
<h3 id="room_review1">리뷰 <%-- <%=count%>개 --%> </h3>
<div id="room_review" style="padding:20px;border:1px solid #cccccc;">
<%
	request.setCharacterEncoding("UTF-8");
/* 
	SearchDAO sdao=new SearchDAO();
	
	List<ReviewBean> Rev=(List)sdao.getRevieweList(num);
	
	System.out.println(Rev.size());
  */
	List ReviewList = (List) request.getAttribute("boardList");
  System.out.println("room_reviewlist"+ReviewList.size());
	int count = ((Integer) request.getAttribute("count")).intValue();
	 System.out.println("room_count"+count);
	pageNum = (String) request.getAttribute("pageNum");
	 System.out.println("room_pageNum"+pageNum);
	int pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
	 System.out.println("room_pageSize"+pageSize);
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	 System.out.println("room_currentPage"+currentPage);
	/* sc = (SearchBean) request.getAttribute("sc"); */
	num = ((Integer) request.getAttribute("num")).intValue();
	System.out.println("room_num"+num);
	
	
	
	
%>


<%-- 	<button class="button_sg button1_sg"
			 onclick="location.href='ReviewWrite.bk?num=<%=num%>&pageNum=<%=pageNum%>'">후기쓰기</button> --%>
	<div id="room_review">
	
	
<%if(ReviewList.size()==0){
	%>
	등록된 리뷰가 없습니다.
	<%}%>
	<%
			for (int i = 0; i < ReviewList.size(); i++) {
				ReviewBean re = (ReviewBean) ReviewList.get(i);
				
				
				
				MemberDAO md = new MemberDAO();
				MemberBean mb = new MemberBean(); 
				String email = (String)session.getAttribute("email");

				mb=md.getMember(email);
	%>
  
<table border="1" align="center" id="review_table">
<%-- 	<tr>
	<th>평점</th> 
	<th colspan="3"> 
	<span class="star-prototype"><%=re.getStar() %></span>  
	</th>  
	</tr> --%>
	<tr><td class="ttd">작성일</td><td> <%=re.getReview_date() %></td></tr>
	<tr>
	
	<td><img src="./upload/<%=mb.getProfile_photo()%>" style="border-radius:50%;width:40px;height:40px;"></td>
	
   	<td colspan="2"><%=re.getMember_email() %></td> 
   	 <tr><td>만족도</td><td colspan="4"><span class="star-prototype"><%=re.getSatisfaction() %></span></td></tr>
    <tr><td>청결도</td><td colspan="4"><span class="star-prototype"><%=re.getClean() %></span></td></tr>
	<tr><td>접근성</td><td colspan="4"><span class="star-prototype"><%=re.getAccess()%></span></td></tr>
    <tr><td colspan="5"><%=re.getContent() %></td></tr>

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
	%><a href="./RoomDetail.sc?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	<%
		}
			// 1~10
			for (int i = startPage; i <= endPage; i++) {
	%><a href="./RoomDetail.sc?pageNum=<%=i%>&num=<%=num%>">[<%=i%>]
	</a>
	<%
		}
			//다음
			if (endPage < pageCount) {
	%><a href="./RoomDetail.sc?pageNum=<%=startPage + pageBlock%>">[다음]</a>
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
			 onclick="location.href='Qna_boardWrite.sc?num=<%=num%>&pageNum=<%=pageNum%>&room_subject=<%=room_subject %>'" style="background-color:white;color:gray;float:right;font-weight:bold;border:1px solid gray;    padding: 11px 19px;">호스트에게 문의하기</button>
	<div id="room_qna">
	<div class="clear"></div>
	
	<!--  -->
	<table style="width:100%;margin-bottom:20px;">
	<tr>
		<td class="qnaheadtd_sg" style="text-align: center;padding:3px;">번호</td>
		<td class="qnaheadtd_sg" style="text-align: center;padding:3px;">제목</td>
		<td class="qnaheadtd_sg" style="text-align: center;padding:3px;">등록일</td>
		<td class="qnaheadtd_sg" style="text-align: center;padding:3px;">답변여부</td>
	</tr>
<%List<QnaBean> q_list = (List)request.getAttribute("q_list");
if(q_list.size()==0){%>
<tr><td colspan="4" style="text-align: center;">등록된 문의글이 없습니다.</td></tr>
<%
}
for(int i=0;i<q_list.size();i++){
	QnaBean qb = (QnaBean)q_list.get(i);
%>
	<tr>
		<td><%=qb.getQnA_num() %></td>
		<td class="qnaopensub">
			<%-- <a href="./MemberQNAcontent.sc?QnA_num=<%=qb.getQnA_num()%>&re_ref=<%=qb.getRe_ref()%>" target="_blank">
			 --%><a href="./MemberQNAcontent.sc?QnA_num=<%=qb.getQnA_num()%>&re_ref=<%=qb.getRe_ref()%>" onClick="window.open(this.href, '', 'width=1000, height=700, menubar=no, status=no, toolbar=no, resizable=no'); return false;">
				<%if(qb.getRe_seq()%2==1){%>[답변]<%}else{%>[문의]<%}%>
				<%=qb.getSubject() %>
			</a>
		</td>
		<td><%=qb.getQnA_date() %></td>
		<td>
			<%if(qb.getRe_lev()==1){%>
			답변완료
			<%}
			else{
			%>
			답변중
			<%}%>
		</td>
	</tr>
<%} %>
	</table>
	<!--  -->

	
	<%-- <table class="accordion_sg1">
		<tr>
			<td style="width:500px;text-align:center;">문의 제목</td><td style="width:200px;text-align:center;">작성자</td><td style="width:200px;text-align:center;">등록 날짜</td><td style="width:200px;text-align:center;">답변여부</td>
		</tr>
	</table>
	<% for (int i = 0; i < QnAList.size(); i++) {
		QnaBean qn = (QnaBean) QnAList.get(i);
	%>
		<button class="accordion_sg">
			<table>
				<tr>
					<td style="width:300px;"><%=qn.getSubject() %></td><td style="width:205px;text-align:center;"><%=qn.getMember_email() %></td>
					<td style="width:153px;"><%=qn.getQnA_date() %></td>
					<td colspan="2" style="width:200px;">
						<%if(qn.getRe_lev()==1){%>
								답변완료
								<%}else{%>
								답변중
						<%}%>
					</td>
				</tr>
			</table>
		</button>
		
		<div class="panel_sg">
  			<p>
  				<img src="./img/user.png" alt="img02" width="50px" height="50px">
				 <%=qn.getContent() %>
				 
				 <%if(qn.getRe_seq()==1){%>
				<hr> 
				<%=qn.getMember_email() %>님 글의 답변 -> <%=qn.getContent() %>
				 <%}%>
			</p>	
		</div>  --%>
		
		
	<%-- <%}%> --%>
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
			%>
		<%
	if(endPage > pageCount){
		endPage=pageCount;//전체 페이지 개수
	}
	
	if(startPage>pageCount)
	{	%> <a href="./RoomDetail.sc?pageNum=<%=startPage-pageBlock%>">[이전]</a>	<%}

	for(int i = startPage; i<=endPage; i++ )
	{
		%> <a href="./RoomDetail.sc?pageNum=<%=i%>&num=<%=num%>">[<%=i%>]</a>  <%
	}

	if(endPage>pageCount)
	{	%> <a href="./RoomDetail.sc?pageNum=<%=startPage+pageBlock%>">[다음]</a>	<%	

	%><%
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
<%--  <jsp:include page="room_box.jsp"></jsp:include> --%>
<%
	sc = (SearchBean) request.getAttribute("sc");
	pageNum = (String) request.getAttribute("pageNum");
	num = ((Integer) request.getAttribute("num")).intValue();
%>

<div id="room_box">
<nav id="nav_1">
<form action="./Booking.bo" method="get" name="fff" id="form_2">
<input type="hidden" name="room_subject" value="<%=sc.getRoom_subject()%>">
<input type="hidden" name="host_email" value="<%=sc.getHost_email() %>">
<input type="hidden" name="home_num" value="<%=sc.getHome_num()%>">
<ol>
<li class="tite_text" style="margin-bottom:0;padding-bottom:0;">
	<%-- <input type="hidden" value="<%=sc.getPrice()%>" name="price11"> --%>
	<input type="hidden" value="<%=sc.getPrice()%>" name="price00">
	<input type="hidden" value="<%=sc.getPrice()%>" name="price33">
	<input type="text" value="<%=sc.getPrice()%>" name="price11" style="display:block;width:fit-content;border:none;float:left;padding:0;font-size:25px;width:120px;padding-left: 9px;padding-top:3px;" readonly>
	<input type="hidden" value="<%=sc.getPrice()%>" name="price22" style="display:block;width:fit-content;border:none;float:left;padding:0;font-size:25px;width:120px;padding-left: 9px;padding-top:3px;" readonly>
	
	 <input type="text" value="/1박" style="display:block;width:fit-content;border:none;float:left;padding:0;font-size:25px;width:50px;" readonly >
	<input type="hidden" value="1" name="select_people" class="select_people">
	<input type="hidden" value="1" class="days00" name="days00" style="display:block;width:fit-content;border:none;float:left;padding:0;font-size:25px;width:40px;" readonly>
	<!-- <input type="text" value="박" style="display:block;width:fit-content;border:none;float:left;padding:0;font-size:25px;width:25px;" readonly> -->
	<div class="clear"></div>
</li>
<li>
	<div id="mySidenav" class="sidenav" style="padding-left:0 !important;padding-right:0 !important;">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<div class="clear"></div>
	<!-- <div class="clear"></div> -->
		<span class="sum_price123"><!-- 50000x10(500000) --></span>
		<%-- +기본요금  <input type="hidden" value="<%=sc.getPrice()%>" name="price00"><br>
		+추가요금 10000<br>
		+수수료 25500<br> --%>
		<!-- <hr>
		<span style="float:right;">합계 535500</span> -->
	</div>
</li>
<!-- <li>
	★★★★★ 167(리뷰 평균 평점 보이게 하기)
</li> -->
<li>
	<span>체크인</span> <span id="checkout">체크아웃</span>
</li>
<li>
   <input type='text'  name="check_in" id="check_in" class='datepicker-here' data-language='en' data-position="bottom left" placeholder="년/월/일"/ readonly style="width:38%!important;">
   <input type="text"  name="check_out" id="check_out" class='datepicker-here'  data-language='en' placeholder="년/월/일" readonly style="width:38%!important;">
   <input type="button" id="search_price" value="가격조회" onclick="openNav()"
   	style="background-color:white;color:#cc1d1b;border:2px solid #cc1d1b;padding:9px;font-weight:bold;font-size:16px;height:52px;border-radius:10px;line-height:10px;">
</li>
<!-- <li class="tite_text">인원</li> -->
<li>
  <input type="hidden" value="<%=basic_people%>" name="basic_people" class="basic_people">
  <input type="hidden" value="<%=R_max_people%>" name="R_max_people" class="R_max_people">
  <input type="hidden" value="" name="text00" readonly>
  <input type="text" value="" placeholder="게스트 인원을 고르세요" class="textsize1" name="text1" id="textsize_1" readonly="readonly">
 
  <nav id="form_1">
  <ol>
     <li>
        <span class="font1">성&nbsp;인</span> 
        <input type="button" value="-" onclick="cid1()" class="btn_1" id="btn_11"> 
        <input type="text" value="" name="text11" id="textcss1" placeholder="0" class="text_box">
        <input type="button" value="+" onclick="add1()" class="btn_1">
     </li>
     <li>
      <span class="font1">어린이</span> 
      <input type="button" value="-" onclick="cid2()" class="btn_1" id="btn_12"> 
      <input type="text" value="" name="text12" id="textcss2" placeholder="0"class="text_box">
      <input type="button" value="+" onclick="add2()" class="btn_1">
     </li>
     <li> 
       <input type="button" value="확인" onclick="choice()" id="btn">
     </li>
     </ol>
  </nav>
</li>
<li><input type="submit" value="예약하기" id="btn1" class="reserve_btn1_sg"></li>
<div class="clear"></div>
<!-- <hr> -->
<!-- <li align="center"><b>예약 확정 전에는 요금이 청구되지 않습니다.</b></li> -->
<li align="center"><!-- 지난 주에 500회 이상 조회되었습니다. -->
<input type="button" class="btn_remove" value="숙소신고하기" onclick="showPopup();" style="color:gray;margin:0;padding:0;'"/>
</li>
	
</ol>
</form>
</nav>
 </div>
  </div>
</div>
<script>
function openNav() {
  document.getElementById("mySidenav").style.height = "180px";
  document.getElementById("mySidenav").style.padding = "20px";
  document.getElementById("mySidenav").style.border = "2px dashed #cc1d1c";
  //document.getElementById("main").style.marginbottom = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.height = "0";
  document.getElementById("mySidenav").style.padding = "0";
  document.getElementById("mySidenav").style.border = "none";
  //document.getElementById("main").style.marginbottom= "0";
}
</script>
<script>
$(document).ready(function () {
	  //your code here
	$('#minMaxExample').datepicker({
	    minDate: new Date() // Now can select only dates, which goes after today
	});
	});
</script>