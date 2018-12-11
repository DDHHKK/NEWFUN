<%@page import="net.search.db.SearchBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script language="javascript">
  function showPopup() { 
	  window.open("room_info/room_report.jsp", "a", "width=1000, height=700, left=200, top=100"); 
	  }
 </script>
<!--  <style>
 .btn_remove{
    background-color: transparent;
    color: black;
    padding: 20px 10px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    border-radius: 4px;
} 
.btn_remove:hover {
    opacity: 0.8;
}

 </style> -->
</head>
<body>
<%
	SearchBean sc = (SearchBean) request.getAttribute("sc");
	String pageNum = (String) request.getAttribute("pageNum");
	int num = ((Integer) request.getAttribute("num")).intValue();
%>

<div id="room_box">
<nav id="nav_1">
<form action="Booking.bo" method="get" name="fff" id="form_2">
<ol>
<li class="tite_text"><%=sc.getPrice() %> / 1박 <img src="./img/heart.jpg" align="right"></li>
<li>★★★★★ 167</li>
<li class="tite_text">날짜</li>
<li><span>체크인</span> <span id="checkout">체크아웃</span></li>
<li>
   <input type='text' id="minMaxExample" class='datepicker-here' data-language='en' data-position="bottom left" placeholder="년/월/일"/>
   <input type="text" value="" class="textsize2" id="datepicker" data-language='en' placeholder="년/월/일">
</li>
<li class="tite_text">인원</li>
<li>
  <input type="text" value="" placeholder="게스트를 고르세요" class="textsize1" name="text1" id="textsize_1" readonly="readonly">
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
<li><input type="submit" value="예약요청" id="btn1"></li>
<li align="center"><b>예약 확정 전에는 요금이 청구되지 않습니다.</b></li><hr>
<li align="center">지난 주에 500회 이상 조회되었습니다.</li>
	<input type="button" class="btn_remove" value="숙소신고하기" onclick="showPopup();" />
</ol>
</form>
</nav>
 </div>
</body>
</html>