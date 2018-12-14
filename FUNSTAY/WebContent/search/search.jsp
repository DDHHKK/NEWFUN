<%@page import="net.host.db.HostBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="content">
<!-- 페이지내용 시작 -->

<div id="sub_DY">
   <form action="starTest.jpg" method="post" name="fr">
 <div id="search_bar_DY">
 main에서 검색바 떼와서 붙이는 자리
 </div>
 <div id="option_DY">
  
  
  <div id="hotel_rate_DY">

<div align=center>
 <span>
 	 <i id="image1"class="material-icons" style="color:#cc1d1d;" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)">star_border</i>
 	 <i id="image2" class="material-icons" style="color:#cc1d1d;" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)">star_border</i>
 	 <i id="image3" class="material-icons" style="color:#cc1d1d;" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)">star_border</i>
 	 <i id="image4"class="material-icons" style="color:#cc1d1d;" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)">star_border</i>
 	  <i id="image5"class="material-icons" style=color:#cc1d1d;" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)">star_border</i>
 
 </span>
</div>
<input type="hidden" class="star_shj" name="star" value="">


  </div>
   


<script src="./js/search/jquery-1.12.3.min.js"></script>
<script src="./js/search/ion.rangeSlider.js"></script>
 <div style="position: relative; padding: 10%;">

    <div>
        <input type="text" id="range" value="" name="range" />
        <input type="number" id="from_shj" value="0">
        <input type="number" id="to_shj" value="0">
    </div>

</div>
<script>

    $(function () {

        $("#range").ionRangeSlider({
            hide_min_max: true,
            keyboard: true,
            min: 0,
            max: 50000,
            from: 100,
            to: 50000,
            type: 'double',
            step: 100,
            prefix: "$",
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




 
 

  
  
  
  <div id="facility_DY">
   <h3>시설</h3>
   <ul id="filter_pupular_list">
    <li>
     <label> <i class='far fa-lightbulb' style='font-size:20px'></i>&nbsp;&nbsp;<input name="conven" value="essential" type="checkbox">&nbsp; 필수품목</label>
    </li>
    <li>
     <label> <i class='fab fa-accessible-icon' style='font-size:20px'></i>&nbsp;&nbsp;<input name="conven" value="disabled" type="checkbox">&nbsp; 장애인시설</label>
    </li>
    <li>
     <label> <i class='fas fa-parking' style='font-size:20px'></i>&nbsp;&nbsp; <input name="conven" value="parking" type="checkbox">&nbsp; 주차가능</label>
    </li>
    <li>
     <label> <i class="fa fa-wifi"></i>&nbsp;&nbsp;<input name="conven" value="wifi" type="checkbox">&nbsp; 와이파이</label>
    </li>
    <li>
     <label> <i class='fas fa-thermometer-empty' style='font-size:20px'></i>&nbsp;&nbsp;<input name="conven" value="air_conditioner" type="checkbox">&nbsp; 에어컨</label>
    </li>
    <li>
     <label> <i class='fas fa-paw'></i>&nbsp;&nbsp; <input name="conven" value="animal" type="checkbox">&nbsp;반려동물</label>
    </li>
    <li>
     <label> <i class='fas fa-birthday-cake' style='font-size:20px'></i>&nbsp;&nbsp;<input name="conven" value="party" type="checkbox">&nbsp; 파티가능</label>
    </li>
    <li>
     <label> <i class="fa fa-car" style="font-size:20px"></i>&nbsp;&nbsp; <input name="conven" value="pickup" type="checkbox">&nbsp; 픽업가능</label>
    </li>
    <li>
     <label> <i class='fas fa-sort' style='font-size:20px'></i>&nbsp;&nbsp; <input name="conven" value="elevator" type="checkbox">&nbsp; 엘리베이터</label>
    </li>
    <li>
     <label> <img src="./img/icon/iron-512.png" width="20px" height="20px">&nbsp;&nbsp;<input name="conven" value="iron" type="checkbox">&nbsp; 다리미</label>
    </li>
    <li>
     <label> <i class='fas fa-bed' style='font-size:15px'></i>&nbsp;&nbsp;<input name="conven" value="extra_bed" type="checkbox">&nbsp; 간이침대</label>
    </li>
    <li>
     <label> <img src="./img/icon/shampoo.png" width="15px" height="25px">&nbsp;&nbsp; <input name="conven" value="shampoo" type="checkbox">&nbsp; 샴푸</label>
    </li>
    <li>
     <label> <i class='fas fa-thermometer-full' style='font-size:20px'> </i>&nbsp;&nbsp;<input name="conven" value="heat" type="checkbox">&nbsp; 난방</label>
    </li>
     <li>
     <label> <i class='fas fa-smoking'></i>&nbsp;&nbsp; <input name="conven" value="smoking" type="checkbox">&nbsp; 흡연가능</label>
    </li>
    <li>
     <label> <i class='fas fa-utensils'></i>&nbsp;&nbsp;<input name="conven" value="breakfast" type="checkbox">&nbsp; 조식제공</label>
    </li>
    <li>
     <label> <img src="./img/icon/table-512.png" width="20px" height="20px">&nbsp;&nbsp;<input name="conven" value="desk" type="checkbox">&nbsp;  업무가능공간/책상</label>
    </li>
    <li>
     <label> <img src="./img/icon/hair_dryer-512.png" width="20px" height="20px">&nbsp;&nbsp;<input name="conven" value="hair_dryer" type="checkbox">&nbsp; 헤어드라이기</label>
    </li>
    
   
   </ul>
  </div>
  
  
  
 </div>

</form>
</div>







<div id="content_DY">
<%
List list = (List)session.getAttribute("list");
List rest = (List)session.getAttribute("rest");
String address = request.getParameter("address");
System.out.print(address);
%>
<p id = "pont_1213_WS"><%=address%>에 대해 찾으셨나요?
 <%if(list.size()!=0){
	%> <%=list.size()%>개의 정보를 찾았습니다.</p>
<%
 }
 else if(rest.size()!=0){
	 %> <%=rest.size()%>개의 정보를 찾았습니다.</p>
	 <% 
 }
%>
<% 
if(list.size()!=0){
for(int i=0;i<list.size();i++){ //for문 시작
	HostBean hb = (HostBean)list.get(i);
%>

<!-- 여기서부터 페이지 내용을 적어주세요. -->
<div class="content_top_shj" >

<!-- 변수값 : "부산광역시", "100" -->
<h1 style="float:left;margin:2% 2% 2% 3%;"><%=hb.getAddress()%></h1><br>

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

</div>

</div>
<div class="contentbox_shj">
<div class="innercon_shj">
<h4><%=hb.getRoom_type() %></h4>
<h3><%=hb.getRoom_subject() %></h3>
<h5>필수용품, 반려동물, 와이파이, 세탁기, 에어컨</h5>
<h5><%=hb.getRoom_content() %></h5>
<h6><%=hb.getStart_date()%> ~ <%=hb.getEnd_date()%> 예약가능</h6>
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
<h4><%=hb.getPrice() %>￦/1박</h4></div>

<div id="wrap">
	<h1>모달윈도우 샘플페이지</h1>
	<div class="c_text">레이어팝업식으로 새창이 뜨면서 화면의 나머지 부분이 비활성화된것처럼 반투명의 검정색으로 보여집니다.</div>
	<div><a href="#loginmodal" class="flatbtn" id="modaltrigger">
	<i class='far' id="modaltrigger_shj" style="cursor:pointer;color:#cc1d1d;">&#xf004;</i>
	</a></div>

</div>

</div>

<div id="loginmodal" style="display:none;">
<h2 >목록 리스트</h2>
<ul>
<li style="cursor: pointer;">Mylist1</li>
<li style="cursor: pointer;">Mylist2</li>
<li style="cursor: pointer;">Mylist3</li>
</ul>
</div>





<!-- 하트 클릭부분 -->
<script type="text/javascript">
$(document).ready(function(){
	
	$('#loginmodal li').click(function(){
		/* var home_num= $('#home_num').val();
		var wishlist_num= $('#wishlist_num').val();
		var wish_num=$('#wish_num').val(); */
		
		if($("#modaltrigger_shj").attr("class")=='far')
			{
			
				$("#modaltrigger_shj").attr('class','fas');
				/*  location.href="./AddMyWish.wi?home_num="+home_num+"&wishlist_num="+wishlist_num; */
				location.href="#loginmodal"; 
			}
		else
			{
				$("#modaltrigger_shj").attr('class','far');
				/*  location.href="./DeleteMyWish.wi?wish_num="+wish_num+"&wishlist_num="+wishlist_num; */
				return;
			}
			});
});
</script>


<!--모달윈도우부분-->
<script type="text/javascript">
$(function(){
 /*  $('#loginform').submit(function(e){
    return false;
  });
   */
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
</script>
<%
} //for문끝
} //if문끝



else if(rest.size()!=0){
for(int i=0;i<rest.size();i++){ //for문 시작
	HostBean hb1 = (HostBean)rest.get(i);
%>

<!-- 여기서부터 페이지 내용을 적어주세요. -->
<div class="content_top_shj" >

<!-- 변수값 : "부산광역시", "100" -->
<h1 style="float:left;margin:2% 2% 2% 3%;"><%=hb1.getAddress()%></h1><br>

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
<h3><%=hb1.getRoom_subject() %></h3>
<h5>필수용품, 반려동물, 와이파이, 세탁기, 에어컨</h5>
<h5><%=hb1.getRoom_content() %></h5>
<h6><%=hb1.getStart_date()%> ~ <%=hb1.getEnd_date()%> 예약가능</h6>
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

<div id="modal_shj" style="display:none;">
	<h2 >목록 리스트</h2>

</div>





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
 /*  $('#loginform').submit(function(e){
    return false;
  }); */
  
  $('#modaltrigger_shj').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
</script>
<%
} //for문끝
} //esle if문끝


else{
%>
<p id="pont_1213_WS"><%=address%>대한 정보를 찾지 못하였습니다.
다시 지역을 검색해 주세요</p>
<% 
}
%>























<div class="pageNum_shj">
<a href="#" >◀</a>
<b><a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
 <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a></b>
<a href="#">▶</a>


</div>
<!-- 페이지 내용이 끝나는 부분입니다. -->
</div>
</div>
</div><!-- subpage include 파일에서 나온 div 닫기 태그 -->


<div class="clear"></div>
