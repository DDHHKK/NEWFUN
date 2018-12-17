<%@page import="net.search.db.SearchBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SearchBean sc = (SearchBean) request.getAttribute("sc");
	String pageNum = (String) request.getAttribute("pageNum");
	int num = ((Integer) request.getAttribute("num")).intValue();
%>

<div id="room_box">
<nav id="nav_1">
<form action="Booking.bo" method="get" name="fff" id="form_2">
<ol>
<li class="tite_text"><%=sc.getPrice() %> / 1박 
<!--  <img src="./img/heart.jpg" align="right"> --></li>
<li>★★★★★ 167</li>
<!-- <li class="tite_text">날짜</li> -->
<li><span>체크인</span> <span id="checkout">체크아웃</span></li>
<li>
   <input type='text' id="minMaxExample" class='datepicker-here' data-language='en' data-position="bottom left" placeholder="년/월/일"/>
   <input type="text" value="" class="textsize2" id="datepicker" data-language='en' placeholder="년/월/일">
</li>
<!-- <li class="tite_text">인원</li> -->
<li>
  <input type="text" value="" placeholder="게스트 인원을 고르세요" class="textsize1" name="text1" id="textsize_1" readonly="readonly">
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
<div class="clear"></div>
<!-- <hr> -->
<!-- <li align="center"><b>예약 확정 전에는 요금이 청구되지 않습니다.</b></li> -->
<li align="center">지난 주에 500회 이상 조회되었습니다.</li>
	<input type="button" class="btn_remove" value="숙소신고하기" onclick="showPopup();" style="color:gray;"/>
</ol>
</form>
</nav>
 </div>