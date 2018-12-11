<%@page import="net.host.db.HostBean"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="net.booking.db.PaymentBean"%>
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

<!-- mileage페이지의 링크 시작 -->
<link href="./css/mypage/mileage.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" 
integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">

	<!-- JSON링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./js/mypage/HostCash.js"></script>
<!--  mileage페이지의 링크 끝 -->

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
String email = (String)request.getAttribute("email");
%>

<h1 style="padding-top: 5px;">MY CASH</h1>
<!-- 보유마일리지  한눈에 보기 -->
<div id="mileagepreview_sg">
	<div class="previewmileage_sg" style="width:44%;line-height:60px;">
		총 누적 캐쉬 :  <b style="color: #cc1d1d;"><%=request.getAttribute("totalCash[0]") %> C</b><br>
		인출한 캐쉬 :  <b style="color: #cc1d1d;">0 C</b><br>
		인출 가능 캐쉬 : <b style="color: #cc1d1d;"><%=request.getAttribute("totalCash[0]") %> C</b><br>
		<!-- 은행권 공동 오픈플랫폼 - 입금이체 API -->
		<input type="button" value="인출하기" id="mdatebtn_sg" style="float:right;" onclick="alert('서비스 준비중');">
	</div>
	<div class="showsnakicon_sg">
		<a href="#">
		<img src="./img/photo2.jpg" style="width: 100%;height: 260px;">
		</a>
	</div>
</div>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal = Calendar.getInstance();
String strToday = sdf.format(cal.getTime());
String beforemonth = sdf.format(cal.getTime());
%>
 
<!-- 마일리지 내역 확인하기 -->
<div id="mileageuselist_sg">

<form action="./MemberSearchMC.me" method="post">
<input type="button" value="1개월" id="mdatebtnnav_sg" class="Msearch">
<input type="button" value="3개월" id="mdatebtnnav_sg" class="HYsearch">
<select name="room_subject" id="mdate_sg" class="room_subselect_sg" style="margin-left:57px;padding:7px;">
<option selected>-- 숙소선택 --</option>
<option value='0'>전체</option>
<%
List<HostBean> hostHome = (List)request.getAttribute("hostHome");
for(int i=0; i<hostHome.size(); i++){
	HostBean hb = hostHome.get(i);
%>
<option value='<%=hb.getHome_num()%>'>
	<%=hb.getRoom_subject()%>
</option>

<%} %>
</select>
<!-- <input type="text" placeholder="숙소제목" name="room_subject" id="mdate_sg" style="margin-left:77px"> -->
<input type="date" id="mdate_sg" name="start_searchdate" class="start_searchdate" style="width:140px;padding:5px;"> ~
<input type="date" value="<%=strToday%>" id="mdate_sg" class="end_searchdate" name="end_searchdate" style="width:140px;padding:5px;">
<input type="button" value="조회하기" id="mdatebtn_sg" class="mdatebtn_sg">
</form>


  <table border="1" class="mileagetable_sg">
  	<tr>
  		<th>일자</th>
  		<th>분류</th>
  		<th>내용</th>
  		<th>캐쉬</th>
  	</tr>
  	
<%
List<PaymentBean> c_list = (List)request.getAttribute("c_list");
for(int i=0;i<c_list.size();i++){
	PaymentBean pb=(PaymentBean)c_list.get(i);
%>
<tr class="mempty_sg">
  		<td><%=pb.getPayment_date()%></td>
  		<td><%=pb.getPayment_status()%></td>
  		<td><%=pb.getPayment_num()%></td>
  		<td><%=pb.getSum_price()%></td>
  	</tr>
  	<%}%>
  </table>
</div>


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