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
<link href="../css/default/login.css" rel="stylesheet">
<link href="../css/default/default.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 페이지 default 링크 끝-->

<!-- 도이씨 삽입링크 -->
<link href="../css/search/search.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 

<!-- 혜진씨 삽입링크 -->
<link href="../css/search/search_center_shj.css" rel="stylesheet">
<link rel="stylesheet" href="styles.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="script.js"></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>

<!--star  -->
<script src="../js/search/star.js"></script>

<!-- rangebar -->
<link rel="stylesheet" href="../css/search/normalize.css" />
<link rel="stylesheet" href="../css/search/ion.rangeSlider.css" />
<link rel="stylesheet" href="../css/search/ion.rangeSlider.skinNice.css" />

<!-- 편의시설 아이콘 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.1/css/all.css'
	integrity='sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz' crossorigin='anonymous'>
	
	


</head>
<body>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>

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
   


<script src="../js/search/jquery-1.12.3.min.js"></script>
<script src="../js/search/ion.rangeSlider.js"></script>
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
<!-- 여기서부터 페이지 내용을 적어주세요. -->
<div class="content_top_shj" >

<!-- 변수값 : "부산광역시", "100" -->
<h1 style="float:left;margin:2% 2% 2% 3%;">"부산광역시"검색결과, "100"개의 정보를 찾았습니다.</h1><br>

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
 
  <img src="../img/photo_4.png" class="img_shj"style="width:100%">

</div>

<div class="mySlides fade_shj">

  <img src="../img/photo_3.png" class="img_shj" style="width:100%">

</div>


<div class="mySlides fade_shj">

  <img src="../img/photo_2.png" class="img_shj" style="width:100%">

</div>

<a class="prev_shj" onclick="plusSlides(-1)">&#10094;</a>
<a class="next_shj" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div class="dot_box" style="text-align:center">
  <span class="dot_shj" onclick="currentSlide(1)"></span> 
  <span class="dot_shj" onclick="currentSlide(2)"></span> 
  <span class="dot_shj" onclick="currentSlide(3)"></span> 
</div>

	<!-- 이미지 fade 기능  -->
<script>
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
</script>	



</div>
<div class="contentbox_shj">
<div class="innercon_shj">
<h4>개인실</h4>
<h3>방 제목</h3>
<h5>필수용품, 반려동물, 와이파이, 세탁기, 에어컨</h5>
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
<h4>25000/1박</h4></div>
<div class="heart_shj"> <i  class='fas' style="color:#cc1d1d;">&#xf004;</i></div>
</div>
</div>








































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
<hr>
<!-- footer -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer -->
</body>
</html>