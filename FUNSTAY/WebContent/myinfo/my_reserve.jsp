<%@page import="net.book.db.BeforeBean"%>
<%@page import="net.book.db.HomeBean"%>
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
<!-- <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet"> -->
<link href="./css/default/login.css" rel="stylesheet">
<link href="./css/default/default.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="./css/default/subpage_content.css" rel="stylesheet">
<link href="./css/default/subpage.css" rel="stylesheet">
<script src="./js/default/jquery-3.3.1.js"></script>
<!-- 페이지 default 링크 끝-->




<!--혜진씨 검색목록 컨텐츠 부분  -->
<!-- <link href="./css/myinfo/mywish_wishlist_shj.css" rel="stylesheet">  -->

<!--영수증 모달  -->
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link href="./css/myinfo/w3.css" rel="stylesheet">

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

<%-- <!-- 여기서부터 페이지 내용을 적어주세요. -->
<%

int home_num=(Integer.parseInt(request.getParameter("home_num")));

%> --%>

<h1>내 예약정보</h1>
 
<div class="w3-bar_DY w3-black">
  <button class="w3-bar-item w3-button" onclick="openCity('London')">완료된 숙소</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Paris')">예정된 숙소</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Seoul')">취소된 숙소</button>
</div>





<!--완료된 숙소탭 시작  -->
<div id="London" class="w3-container city">

  <!--썸네일2시작  -->
  <a href="#">
  
<table class="reseve_table">

<%
/* 
List bookingList=(List)request.getAttribute("bookingList");
List paymentList=(List)request.getAttribute("paymentList");
List hostList=(List)request.getAttribute("hostList");  */
List beforeList=(List)request.getAttribute("beforeList");

 if(beforeList.size()==0){
	%><p class="info_DY">완료된 숙소가 없습니다.</p>
<%
 }else{
 
 
%>
<% 

for(int i=0; i<beforeList.size(); i++){
	/* BookingBean bb=(BookingBean)bookingList.get(i);
	PaymentBean pb=(PaymentBean)paymentList.get(i);
	HostBean hb=(HostBean)hostList.get(i); */
	BeforeBean BeforeB=(BeforeBean)beforeList.get(i);
	/* System.out.println("1"); */
	
	
if(i%3==0){
	%>
	<tr id="tr">
	<% 
}
%>

<td><img src="./upload/<%=BeforeB.getPhoto().split(",")[0]%>" width="300" height="300"><br>


<div id="room_sub">
<%=BeforeB.getRoom_subject()%> <br>
</div>
	<%
String email=(String)session.getAttribute("email");
%>
 <input type="hidden" value="<%=email%>" id="member_email_DY">
<%--<input type="hidden" value="<%=BeforeB.getPayment_num()%>" id="payment_num_DY">	 --%>
	
	
	
	
<!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button class="bill_butt_DY" id="<%=BeforeB.getPayment_num()%>" onclick="document.getElementById('id09').style.display='block'">영수증</button>
  </div>
  <%-- class="<%=BeforeB.getPayment_num()%>" --%>
 
 <!--영수증 버튼 끝  -->  
 <hr>
 
 
 
 
  <!--리뷰쓰기 버튼 -->
     <input type="button" onclick="location.href='ReviewWrite.bk?payment_num=<%=BeforeB.getPayment_num()%>'"
      class="review_butt_DY" value="리뷰쓰기">  
  <!--리뷰쓰기 버튼 끝  -->  
		 

	</td>


<% if(i%3==2) { %>
</tr>
  <% }//if문 끝
   
  }//for문 끝
  

}//else문 끝%>

 
</table>

  <div id="imginfo_shj">
  <!--리뷰쓰기 버튼 끝  -->
  </div>
 <!--  </div> -->
  </a>
  <!--썸네일2끝  -->
  
  
</div>
<!--완료된 숙소 끝  -->







<!--예정된 숙소 시작  -->

<div id="Paris" class="w3-container city" style="display:none">


<table class="reseve_table">

<%
List bookingList2=(List)request.getAttribute("bookingList2");
List paymentList2=(List)request.getAttribute("paymentList2");
List hostList2=(List)request.getAttribute("hostList2"); 
List afterList=(List)request.getAttribute("afterList");

if(bookingList2.size()==0){
	 %><p class="info_DY">예정된 숙소가 없습니다.</p>
	 <%
}else{
%> 
	 
<%
for(int i=0; i<bookingList2.size(); i++){
	BookingBean bb=(BookingBean)bookingList2.get(i);
	PaymentBean pb=(PaymentBean)paymentList2.get(i);
	HostBean hb=(HostBean)hostList2.get(i); 
	BeforeBean BeforeB=(BeforeBean)afterList.get(i);
	/* System.out.println("2"); */
if(i%3==0){
	%>
	<tr id="tr">
	<% 
}
%>

<%-- <td><%=pb.getRequest_msg()%></td>
<td><%=pb.getPayment_num()%></td> --%>
<td><img src="./upload/<%=BeforeB.getPhoto().split(",")[0]%>" width="300" height="300"><br>


<div id="room_sub">
<%=BeforeB.getRoom_subject()%><%-- <img src="./upload/<%=hb.getPhoto().split(",")[0]%>" width="300" height="300"> --%> <br>
</div>


	
<!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button id="<%=BeforeB.getPayment_num()%>" onclick="document.getElementById('id10').style.display='block'" class="bill_butt_DY">영수증</button>
  </div>
 <!--영수증 버튼 끝  -->  
 <hr>
  <!-- 예약취소 버튼 -->
  <button class="cancel_butt_DY" onclick="button_event('<%=BeforeB.getPayment_num()%>');">예약취소</button>
  <!-- 예약취소 버튼 끝  -->
		

	</td>


<% if(i%3==2) { %>
</tr> 
  <% }//if문 끝
  
   }//for문 끝
  
  }//else문 끝%>
  

</table>


</div>

<!--예정된 숙소 끝  -->




<!--취소된 숙소 시작 -->

<div id="Seoul" class="w3-container city" style="display:none">


<table class="reseve_table">

<%
List bookingList4=(List)request.getAttribute("bookingList3");
List paymentList4=(List)request.getAttribute("paymentList3");
List hostList4=(List)request.getAttribute("hostList3");  
List afterList4=(List)request.getAttribute("afterList3");


if(afterList4.size()==0){
	 %><p class="info_DY">취소된 숙소가 없습니다.</p>
	 <%
}else{
%> 

<% 
for(int i=0; i<afterList4.size(); i++){
	/* BookingBean bb=(BookingBean)bookingList4.get(i);
	PaymentBean pb=(PaymentBean)paymentList4.get(i);
	HostBean hb=(HostBean)hostList4.get(i);  */
	BeforeBean BeforeB=(BeforeBean)afterList4.get(i);
	/* System.out.println("3"); */
if(i%3==0){
	%>
	<tr id="tr">
	<% 
}
%>

<%-- <td><%=pb.getRequest_msg()%></td>
<td><%=pb.getPayment_num()%></td> --%>
<td><img src="./upload/<%=BeforeB.getPhoto().split(",")[0]%>" width="300" height="300"><br>

<div id="room_sub">
<%=BeforeB.getRoom_subject()%><%-- <img src="./upload/<%=hb.getPhoto().split(",")[0]%>" width="300" height="300"> --%><br> 
</div>
	
	
<!--영수증버튼(모달박스)  -->
  <div class="w3-container_receipt">
  <button id="<%=BeforeB.getPayment_num()%>" onclick="document.getElementById('id11').style.display='block'" class="bill_butt_Cancel_DY" name="<%=BeforeB.getRoom_subject()%>" >영수증</button>
  </div>
 <!--영수증 버튼 끝  -->  
  
		

	</td>


<% if(i%3==2) { %>
</tr> 
  <% }//if문 끝 
  }//for문 끝

}//else문 끝

%>
  

</table>


</div>

<!--취소된 숙소 끝  -->


</div>




 
 <!--완료된 숙소 영수증 모달 팝업창 시작 -->
  <div id="id09" class="w3-modal">
    <div class="w3-modal-content w3-card-4">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id09').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2 class="site_DY">영수증</h2>
      </header>
      <div class="w3-container">
        <table class="receipt_table_DY">

<%
/* 
List bookingList=(List)request.getAttribute("bookingList");
List paymentList=(List)request.getAttribute("paymentList");
List hostList=(List)request.getAttribute("hostList");  */
List beforeList2=(List)request.getAttribute("beforeList");
for(int i=0; i<beforeList2.size(); i++){
	/* BookingBean bb=(BookingBean)bookingList.get(i);
	PaymentBean pb=(PaymentBean)paymentList.get(i);
	HostBean hb=(HostBean)hostList.get(i); */
	BeforeBean BeforeB=(BeforeBean)beforeList2.get(i);
	
if(i%3==0){
	%>
	
	<% 
}
%>

   
          <tbody></tbody>
	

<% if(i%3==2) { %>

  <% } }%> 
  
 </table>
      </div>
     <!--  <footer class="w3-container w3-teal">
        <p class="cancel_DY">예약취소</p>
      </footer> -->
    </div>
  </div>  
 <!--완료된 숙소 영수증 모달 팝업창 끝 -->  
 


 

<!-- 예정된 숙소 영수증 모달 팝업창 시작 -->
   <div id="id10" class="w3-modal">
    <div class="w3-modal-content w3-card-4">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id10').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2 class="site_DY">영수증</h2>
      </header>
      <div class="w3-container">
        <table class="receipt_table_DY">
         
<%
/* 
List bookingList=(List)request.getAttribute("bookingList");
List paymentList=(List)request.getAttribute("paymentList");
List hostList=(List)request.getAttribute("hostList");  */
List afterList2=(List)request.getAttribute("afterList");
for(int i=0; i<afterList2.size(); i++){
	/* BookingBean bb=(BookingBean)bookingList.get(i);
	PaymentBean pb=(PaymentBean)paymentList.get(i);
	HostBean hb=(HostBean)hostList.get(i); */
	BeforeBean BeforeB=(BeforeBean)afterList2.get(i);
	
if(i%3==0){
	%>
	<tr>
	<% 
}
%>
        
	
         <tr>
          <td colspan="2" class="receipt_ti_DY"><%=BeforeB.getRoom_subject() %></td>
         </tr>
         <tr>
          <td>체크인</td> 
          <td><%=BeforeB.getCheck_in() %></td>
         </tr>
         <tr>
          <td>체크아웃</td>
          <td><%=BeforeB.getCheck_out() %></td>
         </tr>
         <tr>
          <td>Room_type</td>
          <td><%=BeforeB.getRoom_type() %></td>
         </tr>
         <tr>
          <td>UserName</td>
          <td><%=BeforeB.getMember_email() %></td>
         </tr>
         <tr>
          <td>인원</td>
          <td><%=BeforeB.getPeople() %></td>
         </tr>
         <tr>
          <td>총 요금</td>
          <td><%=BeforeB.getSum_price() %></td>
         </tr>
    
<% if(i%3==2) { %>
</tr>
  <% } }%> 
  
 </table>
      </div>
     <!--  <footer class="w3-container w3-teal">
        <p class="cancel_DY">예약취소</p>
      </footer> -->
    </div>
  </div> 
<!--예정된 숙소 영수증 모달 팝업창 끝 -->  



<!-- 취소된 숙소 영수증 모달 팝업창 시작 -->
   <div id="id11" class="w3-modal">
    <div class="w3-modal-content w3-card-4">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id11').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2 class="site_DY">영수증</h2>
      </header>
      <div class="w3-container">
        <table class="receipt_table_DY">
         
<%
	%>
	<tr>
	<% 
%>
  
<% //if(i%3==2) { %>
</tr>
  <% //}// }%> 
  
 </table>
      </div>
     <!--  <footer class="w3-container w3-teal">
        <p class="cancel_DY">예약취소</p>
      </footer> -->
    </div>
  </div> 
<!--취소된 숙소 영수증 모달 팝업창 끝 -->  



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
function button_event(payment_num){
	r=confirm("정말 예약 취소하시겟습니까?")
	
	if(r==true){
		//삭제액션으로 가기
		
		
		<%
		List bookingList3=(List)request.getAttribute("bookingList2");
		List paymentList3=(List)request.getAttribute("paymentList2");
		List hostList3=(List)request.getAttribute("hostList2"); 
		List afterList3=(List)request.getAttribute("afterList");
		for(int i=0; i<bookingList3.size(); i++){
			BookingBean bb=(BookingBean)bookingList3.get(i);
			PaymentBean pb=(PaymentBean)paymentList3.get(i);
			HostBean hb=(HostBean)hostList3.get(i); 
			BeforeBean BeforeB=(BeforeBean)afterList3.get(i);
		
		%>
           
		return location.href="./BillCancel.bk?booking_num="+<%=bb.getBooking_num()%>+"&payment_num="+payment_num+"";
		<% }%> 
		  
		
		
		/* alert("예약취소되었습니다.") */
		
	}else{
		
		
	}
	
}
//영수증(완료/예정 숙소)
  $(document).ready(function(){
	  var member_email=$('#member_email_DY').val();
	   //alert(member_email); //alert주석처리하고 아래 getJSON주석해제
	   //var payment_num=$('#payment_num_DY').val();
    
	 $('.bill_butt_DY').click(function(){
		 var payment_num=$(this).attr('id');
		   alert(payment_num);
		 
		 $.getJSON({
			 dataType:"json",
			 url:"./myinfo/JSON/bill.jsp",
			 data:{payment_num:payment_num,member_email:member_email},
			 success:function(data){
			 
		  	  $.each(data,function(index,item){
		  		  $('.receipt_table_DY').html('<tr><td colspan="2" class="sub_DY">'+item.room_subject+'</td></tr><tr><td>체크인</td><td>'+item.check_in+
		  				  '</td></tr><tr><td>체크아웃</td><td>'+item.check_out+'</td></tr><tr><td>Room_type</td><td>'+item.room_type+
		  				  '</td></tr><tr><td>인원</td><td>'+item.people+'</td></tr><tr><td>결제상태</td><td>'+item.payment_status+ 
		  				  '</td></tr><tr><td>subtotal</td><td>'+(item.sum_price-item.fees)+ 
		  				  '</td></tr><tr><td>수수료</td><td>'+item.fees+'</td></tr><tr><td>total</td><td>'+item.sum_price+
		  				  '</td></tr>');
		  	  }); 
		  	  
		  	  
			 }
		    });
		
		 
	 });
    
      
    });
    
    
    
//영수증(취소 숙소)
  $(document).ready(function(){
	  var member_email=$('#member_email_DY').val();
	   //alert(member_email); //alert주석처리하고 아래 getJSON주석해제
	   //var payment_num=$('#payment_num_DY').val();
    
	 $('.bill_butt_Cancel_DY').click(function(){
		 var payment_num=$(this).attr('id');
		   alert(payment_num);
		 var room_subject= $(this).attr('name');
		   alert(room_subject);
		 
		 $.getJSON({
			 dataType:"json",
			 url:"./myinfo/JSON/bill2.jsp",
			 data:{payment_num:payment_num,member_email:member_email,room_subject:room_subject},
			 success:function(data){
			 
		  	  $.each(data,function(index,item){
		  		  $('.receipt_table_DY').html('<tr><td colspan="2" class="sub_DY">'+item.room_subject+'</td></tr><tr><td>Room_type</td><td>'+item.room_type+
		  				  '</td></tr><tr><td>결제상태</td><td>'+item.payment_status+ 
		  				  '</td></tr><tr><td>subtotal</td><td>'+(item.sum_price-item.fees)+ 
		  				  '</td></tr><tr><td>수수료</td><td>'+item.fees+'</td></tr><tr><td>총요금</td><td>'+item.sum_price+'</td></tr>');
		  	  }); 
		  	  
		  	
		  	  
			 }
		    });
		
		 
	 });
    
      
    });
    
    
    
    
    
    
  /* FAQ 검색 버튼 색상 적용하는 쿼리 */
  /* //롤오버
  function over(obj){ 
  	if(obj.className != "act") {
  	obj.className = "m_over";
  	}
  	} 
  	// 롤아웃 
  	function out(obj){ 
  	if(obj.className != "act") {
  	obj.className = "m_out";
  	}
  	} 
  	// 클릭 
  	function clicks(obj){ 
  	var divs = document.getElementById("btn2_DY").getElementsByTagName("button"); 
  	        for(var i=0; i<divs.length; i++){ 
  	        divs[i].className = "m_out";
  	        }
  	        
  	    obj.className = "act";
  	}
  	 */
    
    
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