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
<!-- 페이지 default 링크 끝-->
<style type="text/css">
.compp_sg {
border-collapse: collapse;
border-bottom: 2px solid #cc1d1d;
border-top: 2px solid #cc1d1d;
}

.compp_sg td {
padding:10px;
border-bottom: 1px solid #cccccc;}
</style>
</head>
<body>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>

<div id="content">
<!-- 페이지내용 시작 -->

<div style="width:50%;margin:100px auto;text-align:center;">
<h1 style="text-align:center;font-size:40px;color:#cc1d1d;">예약이 완료 되었습니다.</h1>
<table class="compp_sg" style="margin:50px auto;text-align: left;">
<tr>
	<td style="background-color:#f3f3f3;">예약된 숙소</td><td><%=request.getAttribute("room_subject") %></td>
</tr>
<tr>
	<td style="background-color:#f3f3f3;">예약 날짜</td><td><%=request.getAttribute("check_in") %> ~ <%=request.getAttribute("check_out") %></td>
</tr>
<%-- <tr>
	<td style="background-color:#f3f3f3;">요청 메세지</td><td><%=request.getAttribute("request_msg") %></td>
</tr> --%>
<tr>
	<td style="background-color:#f3f3f3;">결제 금액</td><td><%=request.getAttribute("sum_price") %></td>
</tr>
<tr>
	<td style="background-color:#f3f3f3;">적립된 마일리지</td><td><%=request.getAttribute("storage_m") %></td>
</tr>
<tr>
	<td style="background-color:#f3f3f3;">사용한 마일리지</td><td><%=request.getAttribute("used_m") %></td>
</tr>
<!-- <tr>	
	<td colspan="2" style="text-align:center;">
		<h3 style="text-align:center;">예약하신 정보는 나의 예약 페이지에서 확인 가능합니다.</h3><br><br>
		<a href="./MyReserve.bk" style="margin-top:40px;padding:10px;background-color:#cc1d1d;color:white;font-weight:bold;font-size:20px;">예약정보 확인하기</a>
	</td>
</tr> -->
</table>
<h3 style="text-align:center;">예약하신 정보는 나의 예약 페이지에서 확인 가능합니다.</h3>
		<a href="./MyReserve.bk" style="margin-top:40px;padding:10px;background-color:#cc1d1d;color:white;font-weight:bold;font-size:20px;">예약정보 확인하기</a>
	
<%-- 예약된 숙소 : <%=request.getAttribute("room_subject") %><br>
home_num : <%=request.getAttribute("home_num") %><br>
예약 날짜 : <%=request.getAttribute("check_in") %> ~ <%=request.getAttribute("check_out") %><br>
member_email : <%=request.getAttribute("member_email") %><br>
요청 메세지 : <%=request.getAttribute("request_msg") %><br>
결제 금액 : <%=request.getAttribute("sum_price") %><br>
적립된 적립금: <%=request.getAttribute("storage_m") %><br>
사용한 적립금 : <%=request.getAttribute("used_m") %><br>
예약하신 정보는 나의 예약 페이지에서 확인 가능합니다.
<a href="./MyReserve.bk" style="margin:10px;padding:10px;backgournd-color:#cc1d1d;color:white;font-weight:bold;font-size:20px;">나의 예약으로 이동하기</a>
  --%>

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


