<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery.min.js"></script>
<title>FunStay</title>
<!-- 페이지 default 링크 시작 -->
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="./css/default/login.css" rel="stylesheet">
<link href="./css/login1.css" rel="stylesheet">
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

<!-- 편의시설 아이콘 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.1/css/all.css'
	integrity='sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz' crossorigin='anonymous'>
	
<!-- css -->
<link href="./css/host/host.css" rel="stylesheet">



<!-- js -->
<script type="text/javascript">
$(document).ready(function(){
	
	$('#con_btn').click(function(){
		var convenience = [];
		var convenience ="";
		$('input[name="convenience"]').each(function(index){
		if ($(this).is(':checked')){
				$(this).append("<input type='hidden' value='1' name='num_conv' checked>");
			} else{
				$(this).append("<input type='hidden' value='0' name='num_conv' checked>");
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



<!-- 페이지내용 시작 -->


<script>
	







/* --------------방개수 선택하는 select box-------------- */
$(function() {
	var rooms =0;
	$('.select_btn').click(function(){
		rooms = $('.select_rooms').val();
		

		for(var j=10; j>rooms; j--){
			$('.room'+j+'_single').val('싱글침대 개수를 선택하세요');
			$('.room'+j+'_double').val('더블침대 개수를 선택하세요');
			$('.room'+j+'_bunk').val('이층침대 개수를 선택하세요');
			$('.room'+(j-1)+'').css({
				"display":"none"
			});
		}
		//alert($('.room3_single').val());
		for(var i=1; i<=rooms; i++){
			$('.room'+i+'').css({
				"display":"block"
			});
	
		}
		
	});

	
	
	
/*-----------------------------최대 침대개수 제어--------------------------  */
	  $('select').change(function(){
	for(var i=1; i<=rooms; i++)
	{
		var room1_single = $(".room"+i+"_single option:selected").val();
		if(room1_single=="싱글침대 개수를 선택하세요"){room1_single=0;}
		else{room1_single *=1;}
		
		var room1_double = $(".room"+i+"_double option:selected").val(); 
		if(room1_double=="더블침대 개수를 선택하세요"){room1_double=0;}
		else{room1_double *=1;}
		
		var room1_bunk = $(".room"+i+"_bunk option:selected").val(); 
		if(room1_bunk=="이층침대 개수를 선택하세요"){room1_bunk=0;}
		else{room1_bunk *=1;}
	
		var room_maxP = room1_single+(room1_double*2)+(room1_bunk*2);
		$(".room"+i+"_maxP").attr("value",room_maxP);
	}
		}); 	
	
});

    
  
    
    
 /*------------- 체크박스 다중으로 담아가는 코드 ------------*/   
 
/*  function fun(){
 var convenience = [];
 var convenience ="";

 $('input[name="convenience"]:checkbox:checked').each(function(index){
	 convenience += $(this).val()});
	//alert(convenience);
	
 }
  */
 

	 
 
 
 
 
 
 

</script>





<!-- ------------호스트등록 시작------------- -->
<div id="content">
<hr>









<!-- ------------숙소이름/설명------------- -->
<form action="./HostJoinAction.ho" method="post" name="fr1">
<table id="host1">
<tr><td><b>숙소 이름</b></td></tr>
<tr><td class="td"><input type="text" size="100" name="room_subject" maxlength="50"></td></tr>
<tr><td><b>숙소 설명(주의사항,규칙,기타 정보 등을 적어주세요)</b></td></tr>
<tr><td class="td"><textarea rows="10" cols="100" name="room_content" maxlength="1000"></textarea></td></tr>







<!-- ------------욕실개수------------- -->
<tr><td class="td"><b>욕실 개수</b>
<select class="sel" name="restroom">
 <option selected>욕실개수를 선택하세요</option>
 <option>1</option>
 <option>2</option>
 <option>3</option>
 <option>4</option>
</select></td></tr>









<!---------가격------- -->
<tr><td class="td"><b>가격</b>
<input type="text" name="price" class="sel" size="7"> /1박</td></tr>










<!-- -----------룸타입---------- -->

<tr><td class="td"><b>룸타입</b>
<select class="sel" name="room_type">
 <option selected>룸타입 선택하세요</option>
 <option>개인실</option>
 <option>집전체</option>
</select>

<div class="tooltip">
	<i class='far fa-lightbulb' style='font-size:12px' class="light">개인실</i>
  <span class="tooltiptext">
  	게스트에게 개인 침실이 제공됩니다.<br>
  	침실 이외의 공간은 다른 사람과 함께 쓸 수 있습니다.
  </span>
</div>

<div class="tooltip">
	<i class='far fa-lightbulb' style='font-size:12px' class="light">집전체</i>
  <span class="tooltiptext">
  	게스트가 숙소 전체를 다른 사람과 
  	공유하지 않고 단독으로 이용합니다.
  </span>
</div>

</td></tr>






<!-- ------------체크인------------- -->
<tr><td class="td"><b>체크인</b>
<select class="sel" name="in_time">
 <option selected>체크인 가능 시간을 선택하세요</option>
 <option>10:00</option>
 <option>11:00</option>
 <option>12:00</option>
 <option>13:00 이후</option> 
</select></td></tr>












<!-- ------------체크아웃------------- -->
<tr><td class="td"><b>체크아웃</b>
<select class="sel" name="out_time">
 <option selected>체크아웃 가능 시간을 선택하세요</option>
 <option>10:00</option>
 <option>11:00</option>
 <option>12:00</option>
 <option>13:00 이후</option>
</select></td></tr>










<!-- ---------in_time/out_time----------- -->
	    	
<tr><td><b>숙소 예약가능한 기간을 선택하세요.</b><br>
<h5>※실제 예약은 숙소 등록 3일 후부터 가능합니다.</h5></td></tr>	   

<tr><td class="td"><b>예약기간</b>
<select class="sel2" name="end_date">
 <option selected>기간을 선택하세요.</option>
 <option>30</option>
 <option>100</option>
 <option>180</option>
 <option>365</option>
</select> /일</td></tr>
	    		   

</table>






<!-- ---------------방개수/최대인원수/침대개수 등 선택---------------------- -->

<table id="host3">
<tr><td><b>방 개수를 선택하세요.</b></td></tr>
<tr><td><b>방개수 </b><select class="select_rooms" name="re_room">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
</select>
<input type="button" class="select_btn" value="선택"></td></tr>
</table>

<%
for ( int i =1; i<=10; i++){
%>
<table class="room<%=i %>" style="display:none;">
<tr>
	<td class="td1">
		<b>방 <%=i %></b>
	</td>
	<td class="td">
		<img src="./img/icon/single_bed-512.png" width="30px">
		<select class="room<%=i %>_single" id="<%=i %>" name="room_single">
		<option>싱글침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		</select><br>

       			
		<img src="./img/icon/icon_bed__45215.png" width="30px">
		<select class="room<%=i %>_double" id="<%=i %>" name="room_double">
		<option>더블침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		</select><br>
       			
		<img src="./img/icon/3365-200.png" width="30px">
		<select class="room<%=i %>_bunk" id="<%=i %>" name="room_bunk">
		<option>이층침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		</select>
	</td>
	<td class="max_box<%=i %>">
		<b>수용가능한 최대인원을 선택하세요</b><br><br>
	 	<input type="number" value="2" class="room<%=i %>_maxP" name="room_maxP"> 
	</td>
</tr>
</table>
<%
}
%>





<!-- ---------편의시설---------- -->

<table id="host2">
<tr><td colspan="2"><b>편의시설</b></td></tr>


<tr><td><input type="checkbox" name="convenience" value="필수품목" class="conv"><i class='far fa-lightbulb' style='font-size:20px'></i> 필수품목<br><span>수건,침대시트,베개,비누,휴지 등<span></td>

<td><input type="checkbox" name="convenience" value="와이파이" class="conv" > <i class="fa fa-wifi"></i> 와이파이</td></tr>

<tr><td><input type="checkbox" name="convenience" value="주차가능" class="conv"> <i class='fas fa-parking' style='font-size:20px'></i> 주차가능</td>
<td><input type="checkbox" name="convenience" value="샴푸" class="conv"> <img src="./img/icon/shampoo.png" width="15px" height="25px"> 샴푸</td></tr>

<tr><td><input type="checkbox" name="convenience" value="에어컨" class="conv" > <i class='fas fa-thermometer-empty' style='font-size:20px'></i> 에어컨</td>
<td><input type="checkbox" name="convenience" value="난방" class="conv"> <i class='fas fa-thermometer-full' style='font-size:20px'></i> 난방</td></tr>

<tr><td><input type="checkbox" name="convenience" value="반려동물" class="conv" > <i class='fas fa-paw'></i> 반려동물</td>
<td><input type="checkbox" name="convenience" value="장애인시설" class="conv" > <i class='fab fa-accessible-icon' style='font-size:20px'></i> 장애인시설</td></tr>

<tr><td ><input type="checkbox" name="convenience" value="파티가능" class="conv" > <i class='fas fa-birthday-cake' style='font-size:20px'></i> 파티가능</td>
<td><input type="checkbox" name="convenience" value="픽업가능" class="conv" > <i class="fa fa-car" style="font-size:20px"></i> 픽업가능</td></tr>

<tr><td><input type="checkbox" name="convenience" value="엘리베이터" class="conv" > <i class='fas fa-sort' style='font-size:20px'></i> 엘리베이터</td>
<td><input type="checkbox" name="convenience" value="조식제공" class="conv" > <i class='fas fa-utensils'></i> 조식제공</td></tr>

<tr><td><input type="checkbox" name="convenience" value="흡연가능" class="conv" > <i class='fas fa-smoking'></i> 흡연가능</td>
<td><input type="checkbox" name="convenience" value="세탁기" class="conv" > <img src="./img/icon/washing.png" width="15px" height="20px"> 세탁기</td></tr>

<tr><td ><input type="checkbox" name="convenience" value="다리미" class="conv" > <img src="./img/icon/iron-512.png" width="20px" height="20px"> 다리미</td>
<td><input type="checkbox" name="convenience" value="업무가능공간/책상" class="conv" > <img src="./img/icon/table-512.png" width="20px" height="20px"> 업무가능공간/책상</td></tr>

<tr><td class="td"><input type="checkbox" name="convenience" value="간이침대" class="conv" > <i class='fas fa-bed' style='font-size:15px'></i> 간이침대</td>
<td class="td"><input type="checkbox" name="convenience" value="헤어드라이기" class="conv" > <img src="./img/icon/hair_dryer-512.png" width="20px" height="20px"> 헤어드라이기
</td></tr>








<!-- ------------주소------------- -->
<tr><td colspan="2"><b>주소</b></td></tr>
<tr><td colspan="2" class="td"><input type ="text" size="75" id="address" placeholder="주소를 입력해주세요" name="address">
<input type="button" value="주소찾기" onclick="daumPostcode()" class="add_btn"></td></tr>









<!-- ------------지도------------- -->
<tr><td colspan="2"><b>위치가 정확한지 확인해주세요</b></td></tr>
<tr><td colspan="2"><div id="map" style="width:600px;height:500px;"></div>
</td></tr>






<!-- ------------다음페이지 버튼------------- -->
<tr><td colspan="2"><input type="submit" value="다음페이지>>" class="next_btn" id="con_btn"></td></tr>
</table>
</form>








<!-- 주소와 지도가 보여지는 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
</script>


</div>

<!-- 페이지내용 끝 -->

</body>
</html>