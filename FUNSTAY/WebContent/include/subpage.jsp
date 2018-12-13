<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email = null;
email = (String)session.getAttribute("email");

if(email==null){
//response.sendRedirect("./MemberLogin.me");
System.out.println("아이디 : "+email+" -> 메인으로 이동됩니다.");
%>
<script type="text/javascript">
	alert("로그인이 필요한 서비스 입니다");
	/* document.getElementById('wrap').style.backgroundColor='#ffffff';
	document.getElementById('wrap').style.zIndex='999'; */
	//document.getElementById('id01').style.display='block';
	
	location.href="./Main.me";
</script>
<%} else {

int hostCheck = 0;
hostCheck = (Integer)session.getAttribute("hostCheck");
System.out.println(hostCheck);
%>
<script type="text/javascript">
// 현재 활성화 되어있는 페이지에 해당하는  목록을 border-bottom으로 밑줄 표시해주는 jquery
$(document).ready(function(){
	var pathArray = window.location.pathname.split('/');
	
	// 가상 주소가 a태그의 href에서 바뀌는 주소들은 따로 지정
	if(pathArray[2]==("MemberSearchMC.me")) {
		$('.a a:eq('+4+')').css({"border-bottom":"4px solid #cc1d1d"});}
	if(pathArray[2]==("MemberQNAcontent.me")) {
		$('.a a:eq('+5+')').css({"border-bottom":"4px solid #cc1d1d"});}
	if(pathArray[2]==("MyWish.wi")) {
		$('.a a:eq('+3+')').css({"border-bottom":"4px solid #cc1d1d"});}
	if(pathArray[2]==("MemberDelete.me")) {
		$('.a a:eq('+0+')').css({"border-bottom":"4px solid #cc1d1d"});}
	if(pathArray[2]==("HostPage.ho")) {
		$('.a a:eq('+6+')').css({"border-bottom":"4px solid #cc1d1d"});}
	if(pathArray[2]==("HostRoomList.ho")) {
		$('.a a:eq('+6+')').css({"border-bottom":"4px solid #cc1d1d"});}
/* 	if(pathArray[2]==("MemberUpdate.me")) {
		$('.a a:eq('+6+')').css({"border-bottom":"4px solid #cc1d1d"});} */
	
	var aSize = $('.a').length;
	// 주소창에 가상주소가 입력되면 회원메뉴에서 가상주소와 일치하는 목록을 찾아서 border-bottom으로 밑줄 표시
	for(var i=0; i<aSize; i++){
		if(pathArray[2]==$('.a a:eq('+i+')').attr('href').substr(2)){
			$('.a a:eq('+i+')').css({"border-bottom":"4px solid #cc1d1d"});
			break;
		}
	}
});
</script>

<div id="leftsection"></div>
<div id="wrap">
<div class="sub_menu">
<ul>
	<li class="a"><a href="./PassCheckForm.me">회원 정보 수정</a></li>
	<li class="a"><a href="./Booking.bo">예약/결제<br>(삭제 예정)</a></li>
	<li class="a"><a href="./MyReserve.bk">나의 예약</a></li>
	<li class="a"><a href="./Wishlist.wi">찜한숙소</a></li>
	<li class="a"><a href="./MemberMileage.me" class="aa">마일리지</a></li>
	<li class="a"><a href="./MemberQNAlist.me">문의 확인</a></li>
	
	<%if(hostCheck==1){%>
	<li><hr></li>
	<li class="a"><a href="./HostPassCheck.ho">숙소 관리</a></li>
	<li class="a"><a href="./HostCash.ho">MY CASH</a></li>
	<%} %>
	<%if(email.equals("admin")){%>
	<li><hr></li>
	<li class="a"><a href="./MemberListAction.me">회원목록</a></li>
	<li class="a"><a href="./FAQ_boardList.fa">FAQ 관리</a></li>
	<%}%>
</ul>
</div>
<%}//else의 끝%>
