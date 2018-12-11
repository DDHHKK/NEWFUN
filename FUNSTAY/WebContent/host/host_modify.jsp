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
HostBean hb=(HostBean)request.getAttribute("hb");


%>


<!-- 각 페이지 내용을  content 영역 안에 배치 해주세요.-->
<div id="content">







<!-- 여기서부터 페이지 내용을 적어주세요. -->

<h1>숙소 정보 수정</h1>
 
<form action="./HostModifyAction.ho" method="post">


<%-- <input type="hidden" name="bed_type" value="<%= bed_type%>">
<input type="hidden" name="re_room" value="<%= re_room%>"> --%>

<input type="hidden" name="home_num" value="<%=hb.getHome_num()%>">

<table id="info_check">

<tr><td class="td1"><b>숙소이름</b>  </td><td class="td2"><input type="text" name="room_subject" size="70" value="<%=hb.getRoom_subject() %>"></td></tr>
<tr><td class="td1"><b>숙소설명 </b> </td><td class="td2"><textarea name="room_content" cols="75" rows="10" id="cc"><%=hb.getRoom_content() %></textarea></td></tr>



<tr><td class="td"><b>룸타입</b></td><td>
<select class="sel" name="room_type">
 <option value="개인실" <% if(hb.getRoom_type().equals("개인실")) { %> selected <%}%> > 개인실</option>
 <option value="집전체" <% if(hb.getRoom_type().equals("집전체")) { %> selected <%}%> > 집전체</option>
</select></td></tr>



<tr><td class="td"><b>욕실 개수</b></td><td>
<select class="sel" name="restroom">
 <option value="1" <% if(hb.getRestroom()==1) { %> selected <%}%> > 1</option>
 <option value="2" <% if(hb.getRestroom()==2) { %> selected <%}%> > 2</option>
 <option value="3" <% if(hb.getRestroom()==3) { %> selected <%}%> > 3</option>
 <option value="4" <% if(hb.getRestroom()==4) { %> selected <%}%> > 4</option>
</select></td></tr>


<tr><td class="td"><b>가격 </b></td>
<td class="td2"><input type="text" name="price" value="<%=hb.getPrice() %>" size="8"> /1박 </td></tr>



<tr><td class="td"><b>체크인 가능 시간</b></td><td>
<select class="sel" name="in_time">
  <option value="10:00" <% if(hb.getIn_time().equals("10:00")) { %> selected <%}%> > 10:00</option>
  <option value="11:00" <% if(hb.getIn_time().equals("11:00")) { %> selected <%}%> > 11:00</option>
  <option value="12:00" <% if(hb.getIn_time().equals("12:00")) { %> selected <%}%> > 12:00</option>
  <option value="13:00이후" <% if(hb.getIn_time().equals("13:00이후")) { %> selected <%}%> > 13:00이후</option>
</select></td></tr>



<tr><td class="td"><b>체크아웃 가능 시간</b></td><td>
<select class="sel" name="out_time">
  <option value="10:00" <% if(hb.getOut_time().equals("10:00")) { %> selected <%}%> > 10:00</option>
  <option value="11:00" <% if(hb.getOut_time().equals("11:00")) { %> selected <%}%> > 11:00</option>
  <option value="12:00" <% if(hb.getOut_time().equals("12:00")) { %> selected <%}%> > 12:00</option>
  <option value="13:00이후" <% if(hb.getOut_time().equals("13:00이후")) { %> selected <%}%> > 13:00이후</option>
</select></td></tr>




<%-- <tr><td class="td1">편의시설 </td><td class="td2">
<%for(int i=0; i<convenience.length; i++){%>
<%
if(i == (convenience.length-1)){
	out.print(convenience[i]);
			%>
			<input type="hidden" name="<%=i %>" value="<%=convenience[i]%>">
	<%}

else{
	out.print(convenience[i]+",");
%>
	<input type="hidden" name="<%=i %>" value="<%=convenience[i]%>">
<%}
}%>


</td></tr> --%>
<%-- <tr><td class="td1">총 방개수</td><td class="td2"><input type="text" name="re_room" value="<%=re_room %>"></td></tr> --%>
<tr><td class="td1"><b>주소 </b> </td><td class="td2"><input type="text" name="address" id="address" size="70" value="<%=hb.getAddress() %>">
 <i class="fa fa-search" onclick="daumPostcode()" style='font-size:30px'></i></td></tr>


<%-- <tr><td><input type="file"name="photo1"><img src="<%=hb.getPhoto().split(",")[0]%>"><br>
<input type="file"name="photo2"><br>
<input type="file"name="photo3"><br>
<input type="file" name="photo4"><br>
<input type="file" name="photo5"></td></tr> --%>



<tr><td colspan="2"><input type="submit" value="수정완료" id="sub_btn"></td></tr>
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