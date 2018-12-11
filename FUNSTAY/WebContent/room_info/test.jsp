<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script language="javascript">
  function showPopup() { 
	  window.open("room_report.jsp", "a", "width=1000, height=700, left=200, top=100"); 
	  }
 </script>
 <style>
 @import url('https://fonts.googleapis.com/css?family=Lato');

body, html{
  height: 100%;
  background: whithe;
	font-family: 'Lato', sans-serif;
}

.container{
  display: block;
  position: relative;
  margin: 40px auto;
  height: auto;
  width: 500px;
  padding: 20px;
}

h2 {
	color: #AAAAAA;
}

.container ul{
  list-style: none;
  margin: 0;
  padding: 0;
	overflow: auto;
}

ul li{
  color: #AAAAAA;
  display: block;
  position: relative;
  float: left;
  width: 100%;
  height: 100px;
	border-bottom: 1px solid #333;
}

ul li input[type=radio]{
  position: absolute;
  visibility: hidden;
}

ul li label{
  display: block;
  position: relative;
  font-weight: 300;
  font-size: 1.35em;
  padding: 25px 25px 25px 80px;
  margin: 10px auto;
  height: 30px;
  z-index: 9;
  cursor: pointer;
  -webkit-transition: all 0.25s linear;
}

ul li:hover label{
	color: #FFFFFF;
}

ul li .check{
  display: block;
  position: absolute;
  border: 5px solid #AAAAAA;
  border-radius: 100%;
  height: 25px;
  width: 25px;
  top: 30px;
  left: 20px;
	z-index: 5;
	transition: border .25s linear;
	-webkit-transition: border .25s linear;
}

ul li:hover .check {
  border: 5px solid #FFFFFF;
}

ul li .check::before {
  display: block;
  position: absolute;
	content: '';
  border-radius: 100%;
  height: 15px;
  width: 15px;
  top: 5px;
	left: 5px;
  margin: auto;
	transition: background 0.25s linear;
	-webkit-transition: background 0.25s linear;
}

<!--check 후 orange-->
input[type=radio]:checked ~ .check {
  border: 5px solid orange;
}

input[type=radio]:checked ~ .check::before{
  background: orange;
}

input[type=radio]:checked ~ label{
  color: orange;
}

.signature {
	margin: 10px auto;
	padding: 10px 0;
	width: 100%;
}

.signature p{
	text-align: center;
	font-family: Helvetica, Arial, Sans-Serif;
	font-size: 0.85em;
	color: #AAAAAA;
}

.signature .much-heart{
	display: inline-block;
	position: relative;
	margin: 0 4px;
	height: 10px;
	width: 10px;
	background: #AC1D3F;
	border-radius: 4px;
	-ms-transform: rotate(45deg);
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
}

.signature .much-heart::before, 
.signature .much-heart::after {
	  display: block;
  content: '';
  position: absolute;
  margin: auto;
  height: 10px;
  width: 10px;
  border-radius: 5px;
  background: #AC1D3F;
  top: -4px;
}

.signature .much-heart::after {
	bottom: 0;
	top: auto;
	left: -4px;
}

.signature a {
	color: #AAAAAA;
	text-decoration: none;
	font-weight: bold;
}


/* Styles for alert... 
by the way it is so weird when you look at your code a couple of years after you wrote it XD */

.alert {
	box-sizing: border-box;
	background-color: #0DFF92;
	width: 100%;
	position: relative; 
	top: 0;
	left: 0;
	z-index: 300;
	padding: 20px 40px;
	color: #333;
}

.alert h2 {
	font-size: 22px;
	color: #232323;
	margin-top: 0;
}

.alert p {
	line-height: 1.6em;
	font-size:18px;
}

.alert a {
	color: #232323;
	font-weight: bold;
}

.button1 {
	align : right;

	font-family: Verdana, Geneva, sans-serif;
	font-size: 24px;
	color: #FFF;
	padding: 5px 10px 5px 10px;
	border: solid 1px #CCC;

	background: orange;
	text-shadow: 0px 1px 0px #000;

	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;

	box-shadow: 0 1px 3px #111;
	-moz-box-shadow: 3px 3px 1px #999;
	-webkit-box-shadow: 3px 3px 1px #999;

	cursor: pointer;
	align: right;

}
.button1:hover {
	background: blue;
}

 .white_content {
  display: none;
  position: absolute;
  width:200px;
  top: 60%;
  left: 72%;
  width: 20%;
  height: 32%;
  padding: 16px;
  border: 16px solid white;
  background-color: white;
  z-index: 1002;
  overflow: auto;
}

 </style>
</head>
<body>
<div id="room_box">
<nav id="nav_1">
<form action="#" method="get" name="fff" id="form_2">
<ol>
<li class="tite_text">₩29,000 /박 <img src="../img/heart.jpg" align="right"></li>
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
<li align="center"><a href="javascript:void(0)" onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
신고하기</a>
  <div id="light" class="white_content">
  <div>
 <form action="subpage.jsp" method="get" name="fff" id="form_report">
<div class="container">
	
	<h2>이 숙소를 신고하시는 이유를 알려주세요.</h2>
	
  <ul>
  <li>
    <input type="radio" id="a-option" name="selector">
    <label for="a-option">부정확하거나 틀린 정보가 있어요</label>  
    <div class="check"></div>
  </li>
  
  <li>
    <input type="radio" id="b-option" name="selector">
    <label for="b-option">실제 숙소가 아닙니다</label>  
    <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
    <input type="radio" id="c-option" name="selector">
    <label for="c-option">사기입니다</label>
    <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
    <input type="radio" id="d-option" name="selector">
    <label for="d-option">불쾌합니다</label>  
    <div class="check"></div>
    
     <li>
    <input type="radio" id="e-option" name="selector">
    <label for="e-option">기타</label>  
    <div class="check"><div class="inside"></div>
  </li>
  </li>
	<p align="right"><input type="submit" name="submit1" value="Submit" class="button1" /></p>
</ul>
</form> 
   </div>
   <li>
</ol>
</form>
</nav>
 </div>
</body>
</html>