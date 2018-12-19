<%@page import="net.host.db.HostBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="dist/js/main.js"></script>

<!--Start of Tawk.to Script-->
<!-- <script type="text/javascript">
PI||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5bed14f670ff5a5a3a7243af/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();




</script> -->



<!--End of Tawk.to Script-->



<div id="content">
<%
String email = (String)session.getAttribute("email");
String address = (String)session.getAttribute("address");
String start_date = (String)session.getAttribute("start_date");
String end_date = (String)session.getAttribute("end_date");
int num = (Integer)session.getAttribute("num");
%>
<form action="./SideSearch.sc" method="post" name="fff" id="form_2">

<div id="sideBar_shj">
<div id="sideSrch_shj">

<nav id="nav_1">

<table  id="searchtable">
<tr><td colspan="2"><input type="submit" value="검색" id="btn1"></td></tr>



<tr><td>&nbsp;&nbsp;&nbsp;목적지</td> <td><input type="text" value="" placeholder="목적지를 적으세요" class="textsize1" name="address"></td></tr>
<tr><td><span>&nbsp;&nbsp;&nbsp;체크 인/아웃</span></td> <td><input type='text' id="minMaxExample" class='datepicker-here' name="start_date" data-language='en' data-position="bottom left" placeholder="년 / 월 / 일"/>
   <input type="text" value="" class="datepicker-here" id="datepicker" name="end_date" data-language='en' placeholder="년 / 월 / 일">
</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;인원</td> <td>
  <input type="text" value="" placeholder="게스트를 고르세요" class="textsize1" name="text1" id="textsize_1" readonly="readonly">
  <nav id="form_1">
  <ol>
     <li>
        <span class="font1">성&nbsp;인</span> &nbsp;&nbsp;
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
       <input type="button" value="확인" onclick="choice()" id="btn_sh">
     </li>
     </ol>
  </nav>
</td></tr>

<tr><td>&nbsp;&nbsp;&nbsp;목적지</td> <td><span class="table_text"><%=address %></span></td></tr>
<tr><td><span>&nbsp;&nbsp;&nbsp;체크 인/아웃</span></td> <td><span class="table_text"> <%=start_date %> / <%= end_date %></span></td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;인원</td> <td><span class="table_text"><%=num %> 명</span></td></tr>

</table>
<input type="hidden" name="address" value="<%=address%>">
<input type="hidden" name="start_date" value="<%=start_date%>">
<input type="hidden" name="end_date" value="<%=end_date%>">
<input type="hidden" name="num" value="<%=num %>">
</nav>


<span style="position: relative;     padding: 7% 5% 0% 7%; bottom: 23px; font-size: 20px;
    font-weight: bold;display: inline-block;">가격</span>
		<div id="sideRnge" style=" display: inline-block;">
		<script src="./js/search/jquery-1.12.3.min.js"></script>
		<script src="./js/search/ion.rangeSlider.js"></script>
			
		        <input type="text" id="range" value="" name="range" />
	        <input type="hidden" name="from" id="from_shj" value="0">
		    <input type="hidden" name="to" id="to_shj" value="0"> 
		   
		
		</div>
<script>

    $(function () {

        $("#range").ionRangeSlider({
            hide_min_max: true,
            keyboard: true,
            min: 0,
            max: 500000,
            from: 100,
            to: 50000,
            type: 'double',
            step: 100,
            prefix: "￦",
            min_interval : 5000,
            grid: true
        });
        $("#range").on("change", function () {
     	    var $this = $(this),
     	        from = $this.data("from"),
     	        to = $this.data("to");
			$('#from_shj').val(from);
			$('#to_shj').val(to);
			$('#from_shj').attr("value",from);
			$('#to_shj').attr("value",to);
			
     	    console.log(from + " - " + to);
     	});

        
    });
</script>

<div id="like_star">
<span style="top: 19px;">선호도</span>
 <span>
 	 <i id="image1"class="material-icons" style="color:#cc1d1d;" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)">star_border</i>
 	 <i id="image2" class="material-icons" style="color:#cc1d1d;" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)">star_border</i>
 	 <i id="image3" class="material-icons" style="color:#cc1d1d;" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)">star_border</i>
 	 <i id="image4"class="material-icons" style="color:#cc1d1d;" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)">star_border</i>
 	  <i id="image5"class="material-icons" style=color:#cc1d1d;" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)">star_border</i>
 <input type="hidden" class="star_shj" name="star">


 </span>
</div>
</div>
<br><br>


<script type="text/javascript">
$(document).ready(function(){
	
	$('input[name="conven"]').change(function(){
		var convenience = [];
		var convenience ="";
		$('input[name="conven"]').each(function(index){
		if ($(this).is(':checked')){
				$(this).append("<input type='hidden' value='1' name='num_conv' checked>");
			
			} else{
	
				$(this).append("<input type='hidden' value='0' name='num_conv' checked>");
			}
		}); 
	});
	
	});
</script>



<div id="sideOp">
<span>선택 옵션</span>
<table>
<tr><td><i class='far fa-lightbulb' style='font-size:20px'></i></td>
	<td><input type="checkbox" name="conven" value="essential" class="conv"></td><td>필수품목</td></tr>
	<tr><td><i class="fa fa-wifi"></i></td>
<td><input name="conven" value="wifi" type="checkbox"></td><td> 와이파이</td></tr>
<tr><td><i class='fas fa-parking' style='font-size:20px'></i></td>
<td><input name="conven" value="parking" type="checkbox"></td><td> 주차가능</td></tr>		
<tr><td> <img src="./img/icon/shampoo.png" width="15px" height="25px"></td>
<td><input name="conven" value="shampoo" type="checkbox"></td><td>샴푸</td></tr>	
<tr><td><i class='fas fa-thermometer-empty' style='font-size:20px'></i></td>
<td><input name="conven" value="air_conditioner" type="checkbox"></td><td> 에어컨</td></tr>	
<tr><td><i class='fas fa-thermometer-full' style='font-size:20px'></i> </td>
<td><input name="conven" value="heat" type="checkbox"></td><td> 난방</td></tr>	
<tr><td> <i class='fas fa-paw'></i></td>
<td><input name="conven" value="animal" type="checkbox"></td><td>반려동물</td></tr>
<tr><td><i class='fab fa-accessible-icon' style='font-size:20px'></i></td>
<td><input type="checkbox" name="conven" value="disabled" class="conv" ></td><td>장애인시설</td></tr>	

<tr><td><i class='fas fa-birthday-cake' style='font-size:20px'></i></td>
<td><input name="conven" value="party" type="checkbox"></td><td>파티가능</td></tr>	
<tr><td><i class="fa fa-car" style="font-size:20px"></i></td>
<td><input name="conven" value="pickup" type="checkbox"></td><td>픽업가능</td></tr>	
<tr><td><i class='fas fa-sort' style='font-size:20px'></i></td>
<td><input name="conven" value="elevator" type="checkbox"></td><td> 엘리베이터</td></tr>	
<tr><td><i class='fas fa-utensils'></i></td>
<td><input name="conven" value="breakfast" type="checkbox"></td><td> 조식제공</td></tr>

<tr><td><i class='fas fa-smoking'></i></td>
<td><input name="conven" value="smoking" type="checkbox"></td><td>흡연가능</td></tr>	
<tr><td><img src="./img/icon/washing.png" width="15px" height="20px"></td>
<td><input type="checkbox" name="conven" value="laundry" class="conv" ></td><td>세탁기</td></tr>

<tr><td ><img src="./img/icon/iron-512.png" width="20px" height="20px"></td>
<td><input type="checkbox" name="conven" value="iron" class="conv" ></td><td>  다리미</td></tr>
<tr><td><img src="./img/icon/table-512.png" width="20px" height="20px"></td>
<td><input name="conven" value="desk" type="checkbox"></td><td> 업무가능공간/책상</td></tr>	
<tr><td><i class='fas fa-bed' style='font-size:15px'></i></td>
<td class="td"><input type="checkbox" name="conven" value="extra_bed" class="conv" ></td> <td> 간이침대</td></tr>
<tr><td><img src="./img/icon/hair_dryer-512.png" width="20px" height="20px"> </td>
<td><input name="conven" value="hair_dryer" type="checkbox"></td><td>헤어드라이기</td></tr>	

</table>
</div>


</form>
</div>
<!-- 페이지내용 시작 -->


<div id="sub_DY">
  <form action="starTest.jpg" method="post" name="fr">
 <div id="search_bar_DY"> 



 </div> 



<div id="content_DY">
<%
List list = (List)session.getAttribute("list");
List rest = (List)session.getAttribute("rest");

List past = (List)session.getAttribute("past");


int pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
%>
<p id = "pont_1213_WS"><%=address%>에 대해 찾으셨나요?
 <%if(list.size()!=0){
	%><%=list.size()%>개의 정보를 찾았습니다.</p>
<%
 }
 else if(past.size()!=0){
	 %><%=past.size()%>개의 정보를 찾았습니다.</p>
	 <% 
 }
 else if(rest.size()!=0){
	 %><%=rest.size()%>개의 정보를 찾았습니다.</p>
	 <% 
 }
%>
<!--정렬  -->
<div style="width:8%" id='listmenu_shj'>
<ul style=" width: 100%;" >
   <li class='active has-sub_shj'><a href='#'><span  class='fas'>정렬  &#xf107; &#xf106;</span></a>
      <ul>
         <li class='has-sub_shj'><a href='#'><span  class='fas'>최신순 &#xf107; &#xf106;</span></a>
         </li>
         <li class='has-sub_shj'><a href='#'><span  class='fas'>인기순  &#xf107; &#xf106;</span></a>
         </li>
      </ul>
   </li>
</ul>
</div>
<% 
if(list.size()!=0){
for(int i=0;i<list.size();i++){ //for문 시작
	HostBean hb = (HostBean)list.get(i);
%>

<!-- 여기서부터 페이지 내용을 적어주세요. -->
<div class="content_top_shj" >

<!-- 변수값 : "부산광역시", "100" -->
<%-- <h1 style="float:left;margin:2% 2% 2% 3%;"><%=hb.getAddress()%></h1><br> --%>


 




</div>
<div class="clear"></div>

<div class="outerbox_shj">
<div class="imgbox_shj">

<div class="slideshow-container">

<div class="mySlides fade_shj">
 
 <img src="./upload/<%=hb.getPhoto().split(",")[0]%>" class="img_shj"style="width:100%">

</div>

<a class="prev_shj"></a>
<a class="next_shj"></a>


<!-- <div class="mySlides fade_shj">

  <img src="./img/photo_3.png" class="img_shj" style="width:100%">


</div>



<div class="mySlides fade_shj">

  <img src="./img/photo_2.png" class="img_shj" style="width:100%">

</div> -->


</div>


<!-- <div class="dot_box" style="text-align:center">
  <span class="dot_shj" onclick="currentSlide(1)"></span> 
  <span class="dot_shj" onclick="currentSlide(2)"></span> 
  <span class="dot_shj" onclick="currentSlide(3)"></span> 
</div> -->

	<!-- 이미지 fade 기능  -->
<!-- <script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active_shj";
}
</script>	 -->


</div>
<div class="contentbox_shj">
<div class="innercon_shj">
<h4><%=hb.getRoom_type() %></h4>
<h3><a href="./RoomDetail.sc?num=<%=hb.getHome_num()%>&pageNum=<%=pageSize%>"><%=hb.getRoom_subject() %></a></h3>
<h5><%=hb.getRoom_content() %></h5>
<%-- <h6><%=hb.getStart_date()%> ~ <%=hb.getEnd_date()%> 예약가능</h6> --%>
</div>


<%
int avg =0;
try{List avglist = (List)session.getAttribute("avg");
avg = (Integer)avglist.get(0);	}
catch(Exception e)
{ avg=0;}


{
	
	%>
	
<%
}
%>
<input type="hidden" id="avg_shj" name="avg" value="<%=avg%>">
<div class="star_shj">
 <span>
 	 <i id="image1"class="material-icons" style="font-size:18px" >star_border</i>
 	 <i id="image2" class="material-icons" style="font-size:18px" >star_border</i>
 	 <i id="image3" class="material-icons" style="font-size:18px" >star_border</i>
 	 <i id="image4"class="material-icons" style="font-size:18px" >star_border</i>
 	  <i id="image5"class="material-icons" style="font-size:18px" >star_border</i>
 </span>
 <span style="position: relative; bottom: 10%;">
 </span>
</div>
</div>
<div class="extra_shj">
<div class="innerex_shj">
<h4><%=hb.getPrice() %>￦/1박</h4></div>
<div class="heart_shj"> <i  class='far' id="modaltrigger_shj" style="cursor:pointer;color:#cc1d1d;">&#xf004;</i></div>
</div>
</div>


<div id="modal_shj" style="display:none;">
	<h2 >목록 리스트</h2>

</div>
<!-- <div style="width:400px; height:400px; border: 10px solid blue;" id ="sjsjsj"> 
<script type="text/javascript">
$("#sjsjsj").click(function(){
	alert("ddd");
	var avg =$("#avg_shj").val();	

		alert(avg);
		for(var i =1; i<=avg; i++)
			{
			
			$('#image'+i).text("star");
			} 
	
});

</script> -->






<!-- 하트 클릭부분 -->
<script type="text/javascript">
$(document).ready(function(){


	
	
	$('.heart_shj>i').click(function(){
		/* var home_num= $('#home_num').val();
		var wishlist_num= $('#wishlist_num').val();
		var wish_num=$('#wish_num').val(); */
		if($(this).attr("class")=='far')
			{
			
				$(this).attr('class','fas');
				/*  location.href="./AddMyWish.wi?home_num="+home_num+"&wishlist_num="+wishlist_num; */
				location.href = "#modal_shj";
			}
		else
			{
				$(this).attr('class','far');
				/*  location.href="./DeleteMyWish.wi?wish_num="+wish_num+"&wishlist_num="+wishlist_num; */
				 
			}
			});
});
</script>



<!--모달윈도우부분-->
<script type="text/javascript">
$(function(){

  $('#modaltrigger_shj').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
</script>



<%
} //for문끝
} //if문끝


else if(past.size()!=0){
for(int i=0;i<past.size();i++){ //for문 시작
	HostBean hb2 = (HostBean)past.get(i);
%>

<!-- 여기서부터 페이지 내용을 적어주세요. -->
<div class="content_top_shj" >

<!-- 변수값 : "부산광역시", "100" -->
<%-- <h1 style="float:left;margin:2% 2% 2% 3%;"><%=hb1.getAddress()%></h1><br> --%>

<!--정렬  -->

 
</div>
<div class="clear"></div>

<div class="outerbox_shj">
<div class="imgbox_shj">

<div class="slideshow-container">

<div class="mySlides fade_shj">
 
<img src="./upload/<%=hb2.getPhoto().split(",")[0]%>" class="img_shj"style="width:100%">

</div>

<a class="prev_shj"></a>
<a class="next_shj"></a>

</div>
<br>

	<!-- 이미지 fade 기능  -->
</div>
<div class="contentbox_shj">
<div class="innercon_shj">
<h4><%=hb2.getRoom_type() %></h4>
<h3><a href="./RoomDetail.sc?num=<%=hb2.getHome_num()%>&pageNum=<%=pageSize%>"><%=hb2.getRoom_subject() %></a></h3>
<h5><%=hb2.getRoom_content() %></h5>
<%-- <h6><%=hb1.getStart_date()%> ~ <%=hb1.getEnd_date()%> 예약가능</h6> --%>
</div>
<div class="star_shj">

 <span>
 	 <i id="image1"class="material-icons" style="font-size:18px" >star</i>
 	 <i id="image2" class="material-icons" style="font-size:18px" >star</i>
 	 <i id="image3" class="material-icons" style="font-size:18px" >star_border</i>
 	 <i id="image4"class="material-icons" style="font-size:18px" >star_border</i>
 	  <i id="image5"class="material-icons" style="font-size:18px" >star_border</i>
 </span>
 <span style="position: relative; bottom: 10%;">
 2/5
 </span>
</div>
</div>
<div class="extra_shj">
<div class="innerex_shj">
<h4><%=hb2.getPrice() %>￦/1박</h4></div>
<div class="heart_shj"> <i  class='far' id="modaltrigger_shj" style="cursor:pointer;color:#cc1d1d;">&#xf004;</i></div>
</div>
</div>


<%
} //for문끝
} //esle if문끝




else if(rest.size()!=0){
for(int i=0;i<rest.size();i++){ //for문 시작
	HostBean hb1 = (HostBean)rest.get(i);
%>

<!-- 여기서부터 페이지 내용을 적어주세요. -->
<div class="content_top_shj" >

<!-- 변수값 : "부산광역시", "100" -->
<%-- <h1 style="float:left;margin:2% 2% 2% 3%;"><%=hb1.getAddress()%></h1><br> --%>

<!--정렬  -->

 
</div>
<div class="clear"></div>

<div class="outerbox_shj">
<div class="imgbox_shj">

<div class="slideshow-container">

<div class="mySlides fade_shj">
 
<img src="./upload/<%=hb1.getPhoto().split(",")[0]%>" class="img_shj"style="width:100%">

</div>

<a class="prev_shj"></a>
<a class="next_shj"></a>

</div>
<br>

	<!-- 이미지 fade 기능  -->
</div>
<div class="contentbox_shj">
<div class="innercon_shj">
<h4><%=hb1.getRoom_type() %></h4>
<h3><a href="./RoomDetail.sc?num=<%=hb1.getHome_num()%>&pageNum=<%=pageSize%>"><%=hb1.getRoom_subject() %></a></h3>
<h5><%=hb1.getRoom_content() %></h5>
<%-- <h6><%=hb1.getStart_date()%> ~ <%=hb1.getEnd_date()%> 예약가능</h6> --%>
</div>
<div class="star_shj">

 <span>
 	 <i id="image1"class="material-icons" style="font-size:18px" >star</i>
 	 <i id="image2" class="material-icons" style="font-size:18px" >star</i>
 	 <i id="image3" class="material-icons" style="font-size:18px" >star_border</i>
 	 <i id="image4"class="material-icons" style="font-size:18px" >star_border</i>
 	  <i id="image5"class="material-icons" style="font-size:18px" >star_border</i>
 </span>
 <span style="position: relative; bottom: 10%;">
 2/5
 </span>
</div>
</div>
<div class="extra_shj">
<div class="innerex_shj">
<h4><%=hb1.getPrice() %>￦/1박</h4></div>
<div class="heart_shj"> <i  class='far' id="modaltrigger_shj" style="cursor:pointer;color:#cc1d1d;">&#xf004;</i></div>
</div>
</div>


<%
} //for문끝
} //esle if문끝




else {
%>
<p id="pont_1213_WS"><%=address%>대한 정보를 찾지 못하였습니다.
다시 지역을 검색해 주세요</p>
<% 
}
%>





















<!-- 페이지 내용이 끝나는 부분입니다. -->

</div>
</div><!-- subpage include 파일에서 나온 div 닫기 태그 -->


<div class="clear"></div>
