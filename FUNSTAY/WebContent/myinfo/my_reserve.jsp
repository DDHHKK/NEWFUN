<%@page import="net.host.db.HostBean"%>
<%@page import="net.booking.db.PaymentBean"%>
<%@page import="net.booking.db.BookingBean"%>
<%@page import="java.util.List"%>
<%@page import="net.host.action.BookingList"%>
<%@page import="net.booking.action.Booking"%>
<%@page import="net.book.db.BookBean"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="./css/default/subpage_content.css" rel="stylesheet">
<link href="./css/default/subpage.css" rel="stylesheet">
<script src="./js/default/jquery-3.3.1.js"></script>
<!-- 페이지 default 링크 끝-->




<!--혜진씨 검색목록 컨텐츠 부분  -->
<link href="./css/myinfo/mywish_wishlist_shj.css" rel="stylesheet"> 

<!--영수증 모달  -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--my_reserve.css  -->
<link href="./css/myinfo/my_reserve.css" rel="stylesheet">
</head>

<body>

<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->

<hr>


<!-- 회원 관리 페이지 왼쪽메뉴바 시작 -->
<jsp:include page="../include/subpage.jsp"></jsp:include>
<!-- 회원 관리 페이지 왼쪽메뉴바 끝 -->



<!-- 각 페이지 내용을  content 영역 안에 배치 해주세요.-->
<div id="content_DY">

<!-- 여기서부터 페이지 내용을 적어주세요. -->

<p class="letter">내 예약정보</p>
 
<div class="w3-bar w3-black">
  <button class="w3-bar-item w3-button" onclick="openCity('London')">완료된 숙소</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Paris')">예정된 숙소</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Seoul')">취소된 숙소</button>
</div>


<!--완료된 숙소탭 시작  -->
<div id="London" class="w3-container city">


 <!--썸네일1시작 -->
  <a href="#">
  <div class="mywish_shj">
  
<table border="1">
<tr><td>방제목</td><td>체크인날짜</td>
    <td>체크아웃날짜</td><td>총금액</td></tr>


  
<%

List bookingList=(List)request.getAttribute("bookingList");
List paymentList=(List)request.getAttribute("paymentList");
List hostList=(List)request.getAttribute("hostList");

for(int i=0; i<bookingList.size(); i++){
	BookingBean bb=(BookingBean)bookingList.get(i);
	PaymentBean pb=(PaymentBean)paymentList.get(i);
	HostBean hb=(HostBean)hostList.get(i);





%>
  

<tr><td><%=hb.getRoom_subject()%></td>
    <td><%=bb.getCheck_in()%></td>
    <td><%=bb.getCheck_out()%></td>
    <td><%=pb.getSum_price()%></td></tr>

 
</table>
<%
}
%> 
  
  
  
  
  
  
  

  <div id="imginfo_shj">
  
  <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
 <!--영수증 버튼 끝  -->  
  <!--리뷰쓰기 버튼 -->
  <button onclick="location.href='./ReviewWrite.bk'" class="review_butt_DY">리뷰쓰기</button>
  <!--리뷰쓰기 버튼 끝  -->
  </div>
  </div>
  </a>
  <!--썸네일1끝  -->
  
  
  
  <!--썸네일2시작  -->
  <a href="#">
  <div class="mywish_shj">
  
  
    
<table border="1">
<tr><td>방제목</td><td>체크인날짜</td>
    <td>체크아웃날짜</td><td>총금액</td></tr>


  
<%

List bookingList2=(List)request.getAttribute("bookingList");
List paymentList2=(List)request.getAttribute("paymentList");
List hostList2=(List)request.getAttribute("hostList");

for(int i=0; i<bookingList2.size(); i++){
	BookingBean bb=(BookingBean)bookingList2.get(i);
	PaymentBean pb=(PaymentBean)paymentList2.get(i);
	HostBean hb=(HostBean)hostList2.get(i);





%>
  

<tr><td><%=hb.getRoom_subject()%></td>
    <td><%=bb.getCheck_in()%></td>
    <td><%=bb.getCheck_out()%></td>
    <td><%=pb.getSum_price()%></td></tr>

 
</table>
<%
}
%> 
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  <div id="imginfo_shj">
  
  <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
 <!--영수증 버튼 끝  -->  
  <!--리뷰쓰기 버튼 -->
  <button onclick="location.href='./ReviewWrite.bk'" class="review_butt_DY">리뷰쓰기</button>
  <!--리뷰쓰기 버튼 끝  -->
  </div>
  </div>
  </a>
  <!--썸네일2끝  -->
  
  
  <!--썸네일3시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="../img/담양1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 해운대</div>
  <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
 <!--영수증 버튼 끝  -->  
  <!--리뷰쓰기 버튼 -->
  <button onclick="location.href='./ReviewWrite.bk'" class="review_butt_DY">리뷰쓰기</button>
  <!--리뷰쓰기 버튼 끝  -->
  </div>
  </div>
  </a>
  <!--썸네일3끝  -->
  
  
  
  <!--썸네일4시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="../img/담양1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 해운대</div>
  <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
 <!--영수증 버튼 끝  -->  
  <!--리뷰쓰기 버튼 -->
  <button onclick="location.href='./ReviewWrite.bk'" class="review_butt_DY">리뷰쓰기</button>
  <!--리뷰쓰기 버튼 끝  -->
  </div>
  </div>
  </a>
  <!--썸네일4끝  -->
  
  
  
  
  
</div>
<!--완료된 숙소 끝  -->







<!--예정된 숙소 시작  -->
<div id="Paris" class="w3-container city" style="display:none">


 <!--썸네일1시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="../img/부산1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 광안리</div>
  <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
  <!-- 영수증 버튼 끝  -->
  <!--예약취소 버튼 -->
  <button class="cancel_butt_DY" onclick="button_event();">예약취소</button>
  <!--예약취소 버튼 끝  -->
  </div>
  </div>
  </a>
 <!--썸네일1끝  -->
 
 
 <!--썸네일2시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="../img/부산1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 광안리</div>
  <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
  <!-- 영수증 버튼 끝  -->
  <!--예약취소 버튼 -->
  <button class="cancel_butt_DY" onclick="button_event();">예약취소</button>
  <!--예약취소 버튼 끝  -->
  </div>
  </div>
  </a>
 <!--썸네일2끝  -->
 
 
 <!--썸네일3시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="../img/부산1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 광안리</div>
  <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
  <!-- 영수증 버튼 끝  -->
  <!--예약취소 버튼 -->
  <button class="cancel_butt_DY" onclick="button_event();">예약취소</button>
  <!--예약취소 버튼 끝  -->
  </div>
  </div>
  </a>
 <!--썸네일3끝  -->
 
 
 <!--썸네일4시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="../img/부산1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 광안리</div>
  <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
  <!-- 영수증 버튼 끝  -->
  <!--예약취소 버튼 -->
  <button class="cancel_butt_DY" onclick="button_event();">예약취소</button>
  <!--예약취소 버튼 끝  -->
  </div>
  </div>
  </a>
 <!--썸네일4끝  -->
 
 
 <!--썸네일5시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="../img/부산1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 광안리</div>
  <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
  <!-- 영수증 버튼 끝  -->
  <!--예약취소 버튼 -->
  <button class="cancel_butt_DY" onclick="button_event();">예약취소</button>
  <!--예약취소 버튼 끝  -->
  </div>
  </div>
  </a>
 <!--썸네일5끝  -->
 
 
 <!--썸네일6시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="../img/부산1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 광안리</div>
  <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
  <!-- 영수증 버튼 끝  -->
  <!--예약취소 버튼 -->
  <button class="cancel_butt_DY" onclick="button_event();">예약취소</button>
  <!--예약취소 버튼 끝  -->
  </div>
  </div>
  </a>
 <!--썸네일6끝  -->
  
  
</div>
<!--예정된 숙소 끝  -->




<!--취소된 숙소 시작 -->
<div id="Seoul" class="w3-container city" style="display:none">
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="../img/부산1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 광안리</div>
  
  
   <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
   <!-- 영수증 버튼 끝  -->
  
  

  </div>
  </div>
  </a>
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="../img/부산1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 광안리</div>
  
   
   
   <!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button onclick="document.getElementById('id09').style.display='block'" class="w3-button w3-black">영수증</button>
  </div>
<!-- 영수증 버튼 끝  -->
   
  
  </div>
  </div>
  </a>
</div>
<!--취소된 숙소 끝  -->

</div>




<!--영수증 모달 팝업창 시작 -->
  <div id="id09" class="w3-modal">
    <div class="w3-modal-content w3-card-4">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id09').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2 class="site_DY">Funstay</h2>
      </header>
      <div class="w3-container">
        <table class="receipt_table_DY">
         <tr>
          <td colspan="2" class="receipt_ti_DY">화이트캐슬</td>
         </tr>
         <tr>
          <td>체크인</td> 
          <td>화,12/9,2018</td>
         </tr>
         <tr>
          <td>체크아웃</td>
          <td>목,12/11,2018</td>
         </tr>
         <tr>
          <td>숙박 세부정보</td>
          <td>2박,객실 1개</td>
         </tr>
         <tr>
          <td>이름</td>
          <td>홍길동</td>
         </tr>
         <tr>
          <td>인원/성인</td>
          <td>1명의 성인</td>
         </tr>
         <tr>
          <td>침대</td>
          <td>싱글침대 1개</td>
         </tr>
         <tr>
          <td>포함사항</td>
          <td>무료 WiFi</td>
         </tr>
         <tr>
          <td>총 요금</td>
          <td>60,000원</td>
         </tr>
        </table>
      </div>
      <footer class="w3-container w3-teal">
        <p class="cancel_DY">예약취소</p>
      </footer>
    </div>
  </div>
<!--영수증 모달 팝업창 끝 -->  
  
  
  
  

<!-- content 영역 끝 -->  





<script>
// Get the modal(영수증모달)
var modal = document.getElementById('id09');

// When the user clicks anywhere outside of the modal, close it(모달박스 바깥쪽 누르면 모달창 꺼짐)
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}





//완료된숙소,예정숙소 탭  
function openCity(cityName) {
    var i;
    var x = document.getElementsByClassName("city");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    document.getElementById(cityName).style.display = "block";  
}


//예약 취소 확인
function button_event(){
	r=confirm("정말 예약 취소하시겟습니까?")
	
	if(r==true){
		//삭제액션으로 가기
		location.href="/BillCancel.bk";
		
	}else if(r==false){
		alert("예약 취소되었습니다.")
		history.go(-1);
	}
	return false;
}

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