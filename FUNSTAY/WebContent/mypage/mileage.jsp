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

	<!-- JSON링크 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 --><script src="./js/mypage/mileage.js"></script>
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

<div id="content" style="display:block;">
<!-- 페이지내용 시작 -->

<h1>나의 마일리지 확인</h1>
<!-- 보유마일리지  한눈에 보기 -->
<div id="mileagepreview_sg">
	
	<!-- 추천숙소의 섬네일 -->
	<div class="showsnakicon_sg">
		<a href="#">
			<img src="./img/photo2.jpg" style="width: 100%;height: 260px;">
		</a>
	</div>
	
	<!-- 마일리지 보기 -->
	<div class="previewmileage_sg">
		총 누적 마일리지 : <%=request.getAttribute("total_m") %> <b style="color: #cc1d1d;">M</b><br>
		사용된 마일리지 : <%=(int)request.getAttribute("total_m")-(int)request.getAttribute("current_m") %> <b style="color: #cc1d1d;">M</b><br>
		사용가능 마일리지 : <%=request.getAttribute("current_m") %> <b style="color: #cc1d1d;">M</b>
	</div>
</div>


 
<!-- 마일리지 내역 확인하기 -->
<div id="mileageuselist_sg">

	<!-- 기간  검색 내비게이션 버튼 -->
	<form action="./MemberSearchMC.me" method="post">
		<input type="button" value="1주일" id="mdatebtnnav_sg" class="Wsearch">
		<input type="button" value="1개월" id="mdatebtnnav_sg" class="Msearch">
	<input type="button" value="3개월" id="mdatebtnnav_sg" class="HYsearch">

	<%
		// 날짜를 선택할 수 있는 검색바에 오늘 날짜를 default값으로 표시하기 위한 코드
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String strToday = sdf.format(cal.getTime());
	%>

	<!-- 기간 검색 날짜선택가능한 버튼 -->
		<input type="date" value="" id="mdate_sg" name="start_searchdate" style="margin-left: 51px;"> ~
		<input type="date" value="<%=strToday%>" id="mdate_sg" name="end_searchdate">
		<input type="submit" value="조회하기" id="mdatebtn_sg">
	</form>

	<!-- 검색결과 시작-->
  	<table border="1" class="mileagetable_sg">
  		<tr>
  			<th>일자</th>
  			<th>분류</th>
  			<th>주문번호</th>
  			<th>사용</th>
  			<th>적립</th>
  		</tr>
  	
	<%
		String email = (String)request.getAttribute("email");
		//java단에서 저장한 m_list를 불러오기
		List<PaymentBean> m_list = (List)request.getAttribute("m_list");

		//DB에서 불러온 마일리지내역 출력
		for(int i=0;i<m_list.size();i++){
		PaymentBean pb=(PaymentBean)m_list.get(i);
	%>
  		<tr class="mempty_sg">
  			<td><%=pb.getPayment_date() %></td>
  			<td><%=pb.getPayment_status() %></td>
  			<td><%=pb.getPayment_num() %></td>
  			<td><%=pb.getUsed_m() %></td>
  			<td><%=pb.getStorage_m() %></td>
  		</tr>
	<%}%>
  	</table>
	<!-- 검색결과 끝 -->
  
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