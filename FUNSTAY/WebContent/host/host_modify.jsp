<%@page import="net.room.db.RoomBean"%>
<%@page import="net.conv.db.ConvBean"%>
<%@page import="net.host.db.HostDAO"%>
<%@page import="net.bed.db.BedBean"%>
<%@page import="java.util.List"%>
<%@page import="net.host.db.HostBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FunStay</title>
<!-- 페이지 default 링크 시작 -->
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="./css/default/login.css" rel="stylesheet">
<link href="./css/default/default.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="./css/default/subpage_content.css" rel="stylesheet">
<link href="./css/default/subpage.css" rel="stylesheet">
<script src="./js/default/jquery-3.3.1.js"></script>
<!-- 페이지 default 링크 끝-->




<link href="./css/host/host_page.css" rel="stylesheet"> 

<!-- 편의시설 아이콘 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.1/css/all.css'
	integrity='sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz' crossorigin='anonymous'>

<!-- css -->

<style>
/* * {
  box-sizing: border-box;
} */

/* body {
  background-color: #f1f1f1;
} */

/* #regForm {
  background-color: #ffffff;
  margin: 100px auto;
  font-family: Raleway;
  padding: 40px;
  width: 70%;
  min-width: 300px;
} */

/* input {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  border: 1px solid #aaaaaa;
} */

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
  display: none;
  min-height: 500px;
}

button {
  background-color: #cc1d1d;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}

#prevBtn {
  background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;  
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #cc1d1d;
}

#convenience td{width: 400px;}
</style>

<!-- js -->
<script type="text/javascript">
$(document).ready(function(){
		
		// DB에서 가져온 convenience 정보 체크박스에 체크해주는 코드
		$('input[name="convenience"]').each(function(index){
			if ($(this).val()==1){ this.checked = true; }//checked 처리
		});
	
		$('#con_btn').click(function(){
			$('.num_conv').remove();
			var convenience = [];
			var convenience ="";
			$('input[name="convenience"]').each(function(index){
			if ($(this).is(':checked')){
					$(this).append("<input type='hidden' value='1' name='num_conv' class='num_conv' checked>");
				} else{
					$(this).append("<input type='hidden' value='0' name='num_conv' class='num_conv' checked>");
				}
			});
		});
	
	});
</script>
</head>

<body>

<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->

<hr>


<!-- 회원 관리 페이지 왼쪽메뉴바 시작 -->
<jsp:include page="../include/subpage.jsp"></jsp:include>
<!-- 회원 관리 페이지 왼쪽메뉴바 끝 -->

<%
int home_num=Integer.parseInt(request.getParameter("home_num"));
HostBean hb=(HostBean)request.getAttribute("hb");
ConvBean cb=(ConvBean)request.getAttribute("cb");
List<RoomBean> rooms = (List)request.getAttribute("rooms");
List<BedBean> bed_list = (List)request.getAttribute("bed_list");
/* System.out.println(rooms.get(0).getHome_num()); */
%>


<!-- 각 페이지 내용을  content 영역 안에 배치 해주세요.-->
<div id="content">

<h1>숙소 정보 수정</h1>

<!-- 멀티스텝  폼-->
<form action="./HostModifyAction.ho" method="post" id="regForm">
  <!-- 1단계 -->
  <div class="tab">
				<table id="info_check">
					<tr>
						<td class="td1"><b>숙소이름</b></td>
						<td class="td2" colspan="3"><input type="text" name="room_subject"
							size="70" value="<%=hb.getRoom_subject()%>">
							<input type="hidden" value="<%=home_num%>" name="home_num">
						</td>
					</tr>
					<tr>
						<td class="td1"><b>숙소 위치</b></td>
						<td class="td2" colspan="3"><input type="text" name="address" id="address" size="70" value="<%=hb.getAddress() %>">
 							<i class="fa fa-search" onclick="daumPostcode()" style='font-size:30px'></i></td>
					</tr>
					<tr>
						<td class="td1"><b>숙소설명 </b></td>
						<td class="td2" colspan="3"><textarea name="room_content" cols="75"
								rows="10" id="cc"><%=hb.getRoom_content() %></textarea></td>
					</tr>
					<tr>
						<td class="td"><b>룸타입</b></td>
						<td><select class="sel" name="room_type">
								<option value="개인실" <%if (hb.getRoom_type().equals("개인실")) {%>
									selected <%}%>>개인실</option>
								<option value="집전체" <%if (hb.getRoom_type().equals("집전체")) {%>
									selected <%}%>>집전체</option>
						</select></td>
						<td class="td"><b>가격 </b></td>
						<td class="td2"><input type="text" name="price" value="<%=hb.getPrice() %>" size="8"> /1박 </td>
					</tr>
				</table>
  </div>
  <!-- 2단계 -->
  <div class="tab">
    <table>
    	<tr>
    		<td class="td"><b>욕실 개수</b></td>
    		<td colspan="3"><select class="sel" name="restroom">
				<option value="1" <% if(hb.getRestroom()==1) { %> selected <%}%> > 1</option>
 				<option value="2" <% if(hb.getRestroom()==2) { %> selected <%}%> > 2</option>
 				<option value="3" <% if(hb.getRestroom()==3) { %> selected <%}%> > 3</option>
 				<option value="4" <% if(hb.getRestroom()==4) { %> selected <%}%> > 4</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="td"><b>체크인 가능 시간</b></td><td>
				<select class="sel" name="in_time">
 				<option value="10:00" <% if(hb.getIn_time().equals("10:00")) { %> selected <%}%> > 10:00</option>
  				<option value="11:00" <% if(hb.getIn_time().equals("11:00")) { %> selected <%}%> > 11:00</option>
  				<option value="12:00" <% if(hb.getIn_time().equals("12:00")) { %> selected <%}%> > 12:00</option>
  				<option value="13:00이후" <% if(hb.getIn_time().equals("13:00이후")) { %> selected <%}%> > 13:00이후</option>
				</select>
			</td>
			<td class="td"><b>체크아웃 가능 시간</b></td><td>
				<select class="sel" name="out_time">
  				<option value="10:00" <% if(hb.getOut_time().equals("10:00")) { %> selected <%}%> > 10:00</option>
  				<option value="11:00" <% if(hb.getOut_time().equals("11:00")) { %> selected <%}%> > 11:00</option>
  				<option value="12:00" <% if(hb.getOut_time().equals("12:00")) { %> selected <%}%> > 12:00</option>
  				<option value="13:00이후" <% if(hb.getOut_time().equals("13:00이후")) { %> selected <%}%> > 13:00이후</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="td"><b>방 개수</b></td>
			<td colspan="3">
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
			</td>
		</tr>
		<tr>
			<td></td>
			<td><input type="button" value="+" style="background-color:#cc1d1d;border:none;color:white;line-height:20px;border-radius:50%;width:40px;height:40px;font-size:29px;"></td>
		</tr>
    </table>
  </div>
  <!-- 3단계 -->
  <div class="tab"><b>편의시설</b>
				<table id="convenience">
					
					<tr>
						<td><input type="checkbox" name="convenience" value="<%=cb.getEssential() %>"
							class="conv"><i class='far fa-lightbulb'
							style='font-size: 20px'></i> 필수품목<br>
						<span>수건,침대시트,베개,비누,휴지 등</span></td>
						<td><input type="checkbox" name="convenience" value="<%=cb.getWifi() %>"
							class="conv"> <i class="fa fa-wifi"></i> 와이파이</td>
						<td><input type="checkbox" name="convenience" value="<%=cb.getParking() %>"
							class="conv"> <i class='fas fa-parking'
							style='font-size: 20px'></i> 주차가능</td>
					</tr>

					<tr>
						<td><input type="checkbox" name="convenience" value="<%=cb.getShampoo() %>"
							class="conv"> <img src="./img/icon/shampoo.png"
							width="15px" height="25px"> 샴푸</td>
						<td><input type="checkbox" name="convenience" value="<%=cb.getAir_conditioner() %>"
							class="conv"> <i class='fas fa-thermometer-empty'
							style='font-size: 20px'></i> 에어컨</td>
						<td><input type="checkbox" name="convenience" value="<%=cb.getHeat() %>"
							class="conv"> <i class='fas fa-thermometer-full'
							style='font-size: 20px'></i> 난방</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="convenience" value="<%=cb.getAnimal() %>"
							class="conv"> <i class='fas fa-paw'></i> 반려동물</td>
						<td><input type="checkbox" name="convenience" value="<%=cb.getDisabled() %>"
							class="conv"> <i class='fab fa-accessible-icon'
							style='font-size: 20px'></i> 장애인시설</td>
						<td><input type="checkbox" name="convenience" value="<%=cb.getParty() %>"
							class="conv"> <i class='fas fa-birthday-cake'
							style='font-size: 20px'></i> 파티가능</td>
					</tr>

					<tr>
						<td><input type="checkbox" name="convenience" value="<%=cb.getPickup() %>"
							class="conv"> <i class="fa fa-car"
							style="font-size: 20px"></i> 픽업가능</td>
						<td><input type="checkbox" name="convenience" value="<%=cb.getElevator() %>"
							class="conv"> <i class='fas fa-sort'
							style='font-size: 20px'></i> 엘리베이터</td>
						<td><input type="checkbox" name="convenience" value="<%=cb.getBreakfast() %>"
							class="conv"> <i class='fas fa-utensils'></i> 조식제공</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="convenience" value="<%=cb.getSmoking() %>"
							class="conv"> <i class='fas fa-smoking'></i> 흡연가능</td>
						<td><input type="checkbox" name="convenience" value="<%=cb.getLaundry() %>"
							class="conv"> <img src="./img/icon/washing.png"
							width="15px" height="20px"> 세탁기</td>
						<td><input type="checkbox" name="convenience" value="<%=cb.getIron() %>"
							class="conv"> <img src="./img/icon/iron-512.png"
							width="20px" height="20px"> 다리미</td>
					</tr>

					<tr>
						<td><input type="checkbox" name="convenience"
							value="<%=cb.getDesk() %>" class="conv"> <img
							src="./img/icon/table-512.png" width="20px" height="20px">
							업무가능공간/책상</td>
						<td class="td"><input type="checkbox" name="convenience"
							value="<%=cb.getExtra_bed() %>" class="conv"> <i class='fas fa-bed'
							style='font-size: 15px'></i> 간이침대</td>
						<td class="td"><input type="checkbox" name="convenience"
							value="<%=cb.getHair_dryer() %>" class="conv"> <img
							src="./img/icon/hair_dryer-512.png" width="20px" height="20px">
							헤어드라이기<!--  <input type="button" id="con_btn"> --></td>
					</tr>
				</table>
			</div>
			
  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">이전</button>
      <button type="button" class="con_btn" id="nextBtn" onclick="nextPrev(1)">다음</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
<!--     <span class="step"></span> -->
  </div>
</form>

<!-- js -->
<script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the crurrent tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  // 이전, 다음 버튼 수정
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "수정하기";
  } else {
    document.getElementById("nextBtn").innerHTML = "다음";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  //if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    	$('.num_conv').remove();
			var convenience = [];
			var convenience ="";
			$('input[name="convenience"]').each(function(index){
			if ($(this).is(':checked')){
					$(this).append("<input type='hidden' value='1' name='num_conv' class='num_conv' checked>");
				} else{
					$(this).append("<input type='hidden' value='0' name='num_conv' class='num_conv' checked>");
				}
			});
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

/* function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
} */

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
</script>



<!-- 여기서부터 페이지 내용을 적어주세요. -->


 





<!-- 주소와 지도가 보여지는 API -->
<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5bd0699811ddfc0b8ef260a07e7c9163&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = fullAddr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script> -->



</div>





  
  
  
  

<!-- content 영역 끝 -->  





<script>


</script> 



<!-- 페이지내용 끝 -->
</div>
</div><!-- 회원 관리 페이지 'subpage' include된 페이지의 div끝 !!지우지마세요!!-->
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>