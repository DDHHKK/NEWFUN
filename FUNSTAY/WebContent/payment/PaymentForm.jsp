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

<!-- payment.jsp 링크 -->
<link href="./css/payment/PaymentForm.css" rel="stylesheet">	
<!-- 아임포트 jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" 
integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">

</head>
<body>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>
<!-- 회원 관리 페이지 왼쪽메뉴바 시작 -->
<jsp:include page="../include/subpage.jsp"></jsp:include>
<!-- 회원 관리 페이지 왼쪽메뉴바 끝 -->
<div id="content">
<!-- 페이지내용 시작 -->
<%
String room_subject=request.getParameter("room_subject");
//int people = Integer.parseInt(request.getParameter("people"));
int people = (Integer)request.getAttribute("people");
int getMileage=(Integer)request.getAttribute("getMileage");
%>
<div id="splitwraptotal_sg">
<h1>결제하기</h1>
<div class="paysnakmsg_sg">
	<div class="heightcenterfit_sg">
	<i class="fas fa-spinner"></i>
	</div>
	<p>결제 도중 같은 날짜의 룸에 다른 고객님의 결제가 이루어지면 예약이 조기 마감될수 있습니다.</p>
</div>
</div>
<div class="clear"></div>
<!-- 결제 모듈에 전송될 파라메터들을 form태그 안에 배치 -->
<form action="./bookingAction.bo" method="post">



<!-- 주문 정보 영역 시작 -->
<div id="splitwrapright_sg1">
<div id="paymentinfo_sg">
<h3>주문 정보</h3>
<!-- 주문번호 : djfigieowkdfj02983<br> -->
<a href="#"><img src="./img/photo2.jpg" alt="숙소 미리보기 사진"></a><br>
<%=room_subject%><br><hr>
<i class="fas fa-user-alt"></i> x <%=request.getAttribute("people") %> 명<br>
<i class="far fa-calendar-check"></i> 
	<%=request.getAttribute("check_in")%>
	<i class="fas fa-long-arrow-alt-right"></i> 
	 <%=request.getAttribute("check_out") %><br>
<i class="fas fa-coins"></i> 기본 요금 <%=request.getAttribute("basic_price") %><br>
&nbsp;&nbsp;&nbsp; + 추가요금 <%=request.getAttribute("add_price") %><br>
&nbsp;&nbsp;&nbsp; + 수수료 <%=request.getAttribute("fees")%>
<div class="clear"></div>
<div class="paytotal_sg">
<i class="fas fa-long-arrow-alt-right"></i> 
<i class="fas fa-coins"></i> 결제 금액 <%=request.getAttribute("sum_price")%>
</div>
</div>
</div>

<!-- 결제 정보 영역 시작 -->
<div id="splitwrapleft_sg">
<!-- 룸상세 페이지에서 받아오는 정보 -->
<div class="room_info" style="height:0;">
	<!-- <div class="room1"> -->
		<!-- home_num :  --><input type="hidden" value=<%=request.getAttribute("home_num") %> name="home_num"><br>
		
		<%-- room_num1<input type="text" value=<%=request.getAttribute("room_num[0]") %> name="room_num[0]"><br>
		room_num2<input type="text" value=<%=request.getAttribute("room_num[1]") %> name="room_num[1]"><br>
		 --%>
		<!-- check_in --><input type="hidden" value=<%=request.getAttribute("check_in") %> name="check_in"><br>
		<!-- check_out --><input type="hidden" value=<%=request.getAttribute("check_out") %> name="check_out"><br>
		<!-- people --><input type="hidden" value=<%=request.getAttribute("people") %> name="people"><br>
		<!-- room_price,add_price db쿼리로 빼기? -->
		<!-- 홈설정 디폴트 요금 --><input type="hidden" value="<%=request.getAttribute("price") %>" name="price">
		<!-- 기본요금 --><input type="hidden" value="<%=request.getAttribute("basic_price") %>" name="room_price"><br> 
		<!-- 추가요금 --><input type="hidden" value="<%=request.getAttribute("add_price") %>" name="add_price"><br>
		<!-- 수수료 --><input type="hidden" value=<%=request.getAttribute("fees")%> name="fees"><br>
		<!-- host_email --><input type="hidden" value=<%=request.getAttribute("host_email")%> name="host_email"><br>
		<!-- storage_m --><input type="hidden" value=<%=request.getAttribute("storage_m")%> name="storage_m"><br>
		<!-- sum_price --><input type="hidden" value=<%=request.getAttribute("sum_price")%> name="sum_price"><br>
		<!-- room_subject --><input type="hidden" value="<%=room_subject%>" name="room_subject"><br>
		
	<!-- </div> -->
</div>

<div id="paymemberinfo_sg">
<h3>결제 정보</h3>
<table>
<tr>
	<td>결제수단</td>
	<td><i class="far fa-credit-card"></i> 신용카드</td>
</tr>
<tr>
	<td>성함</td>
	<td> <input type="text" name="name"></td>
</tr>
<tr>
	<td>이메일 주소</td>
	<td> <input type="text" name="member_email" value="<%=request.getAttribute("member_email")%>"></td>
</tr>
<!-- <tr>
	<td>전화번호</td>
	<td> <input type="text" name="phone"></td>
</tr> -->
<tr>
	<td class="line-height">요청 메세지</td>
	<td><textarea rows="3" cols="10" placeholder="호스트에게 요청사항을 적어주세요" name="request_msg"></textarea></td>
</tr>
<tr>
	<td>적립 마일리지</td>
	<td>
		<input type="text" value=<%=request.getAttribute("storage_m")%> name="storage_m">
		<%-- <div>
		<span>사용마일리지</span><span><input type="text" value="0" name="used_m"><input type="button" value="사용하기" class="mileage_btn_sg"></span>
		보유 마일리지 <%=getMileage%>	
		</div> --%>
	</td>
</tr>
<tr>
	<td>사용 마일리지</td>
	<td>
		<input type="text" value="0" name="used_m" style="float:left;"><input type="button" value="사용하기" class="mileage_btn_sg" style="float:left;">
		<input type="text" value="사용가능 <%=getMileage%>" style="border:none;padding-left:10px;">	
	</td>
</tr>
</table>
</div>
</div>
<!-- <div class="clear"></div> -->
<div id="splitwrapright_sg2">
<!-- 아임포트 j쿼리 버튼 -->
<input type="button" value="결제하기" id="check_module" class="check_module">
<input type="submit" value="결제하기(테스트용)" id="check_module">
</div>
</form>
<!-- 아임포트 결제 j쿼리 -->
<script src="./js/payment/PaymentForm.js"></script>

<!-- <input type="button" value="날짜 확인test" id="datebtn">
<script>
$("#datebtn").click(function(){
	var newdate=new Date();
	var deadline = new Date().getDate() + 3;
	alert("현재 : "+newdate);
	alert("현재 날짜 : "+newdate.getDate());
	alert("현재 년도 : "+newdate.getFullYear())//년도
	alert("현재 월 : "+newdate.getMonth())//월
	alert("기한 날짜 : "+deadline);//기한날짜
});

</script> -->

<!-- 페이지내용 끝 -->
</div>
</div><!-- 인클루드된 wrap의 끝  -->
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>