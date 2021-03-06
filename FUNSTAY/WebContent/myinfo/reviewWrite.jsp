<%@page import="net.booking.db.BookingBean"%>
<%@page import="net.search.db.SearchBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FunStay</title>
<!-- 페이지 default 링크 시작 -->
<link href="./css/default/login.css" rel="stylesheet">
<link href="./css/login1.css" rel="stylesheet">
<link href="./css/default/default.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="./css/default/subpage_content.css" rel="stylesheet">
<link href="./css/default/subpage.css" rel="stylesheet">
<script src="./js/default/jquery-3.3.1.js"></script>
<!-- 페이지 default 링크 끝-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">

<!-- 별점-->
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
<!-- 별점 끝-->




<!--my_reserve.css  -->
<!-- <link href="./css/myinfo/my_reserve.css" rel="stylesheet"> -->

<link href="./css/myinfo/reviewWrite.css" rel="stylesheet">
</head>




<!--body시작  -->
<body>
<%
request.setCharacterEncoding("UTF-8");
	
BookingBean bb=new BookingBean();
String pageNum = (String) request.getAttribute("pageNum");
int home_num = ((Integer) request.getAttribute("home_num")).intValue();
String Member_email = (String)request.getAttribute("Member_email");
String payment_num= (String)request.getAttribute("payment_num");

	%>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>
<!-- 회원 관리 페이지 왼쪽메뉴바 시작 -->
<jsp:include page="../include/subpage.jsp"></jsp:include>
<!-- 회원 관리 페이지 왼쪽메뉴바 끝 -->




<!-- 각 페이지 내용을  content 영역 안에 배치 해주세요.-->
<div id="content_DY">

<!-- 여기서부터 페이지 내용을 적어주세요. -->

<h1>리뷰쓰기</h1>
 		
<!--폼 시작  --> 
<form action="./ReviewWriteAction.bk" method="post"> 


<input type="hidden" name="home_num" value="<%=home_num%>">
<input type="hidden" name="payment_num" value="<%=payment_num%>">
<input type="hidden" name="Member_email" value="<%=Member_email%>"> 
<input type="hidden" name="pageNum" value="<%=pageNum%>"> 

<!--테이블 시작  -->
<table>

<!-- <tr>
<td class="ttd">별점</td>
<td class="ttd2">
<span class="star-input">
	<span class="input">
    	<input type="radio" name="star" value="1" id="p1">
    	<label for="p1">1</label>
    	<input type="radio" name="star" value="2" id="p2">
    	<label for="p2">2</label>
    	<input type="radio" name="star" value="3" id="p3">
    	<label for="p3">3</label>
    	<input type="radio" name="star" value="4" id="p4">
    	<label for="p4">4</label>
    	<input type="radio" name="star" value="5" id="p5" checked>
    	<label for="p5">5</label>
  	</span>
  	<output for="star-input"><b>5</b>점</output>						
</span>
<script src="js/room_info/jquery-1.11.3.min.js"></script>
<script src="js/room_info/star.js"></script>
</td>
</tr> -->

<tr><h2>숙박이 어떠셨는지 말씀해 주세요</h2></tr>
<tr class="ttr">
<td class="ttd">만족도</td>
<td class="ttd2">
<input type="radio" class="ra" name="satisfaction" value="5" checked>★★★★★
<input type="radio" name="satisfaction" value="4">★★★★
<input type="radio" name="satisfaction" value="3">★★★
<input type="radio" name="satisfaction" value="2">★★
<input type="radio" name="satisfaction" value="1">★
</td>
</tr>


<tr class="ttr">
<td class="ttd">청결도</td>
<td class="ttd2">
<input type="radio" name="clean" value="5" checked>★★★★★
<input type="radio" name="clean" value="4">★★★★
<input type="radio" name="clean" value="3">★★★
<input type="radio" name="clean" value="2">★★
<input type="radio" name="clean" value="1">★
</tr>



<tr class="ttr">
<td class="ttd">접근성</td>
<td class="ttd2">
<input type="radio" name="access" value="5" checked>★★★★★
<input type="radio" name="access" value="4">★★★★
<input type="radio" name="access" value="3">★★★
<input type="radio" name="access" value="2">★★
<input type="radio" name="access" value="1">★
</tr>


<tr class="ttr">
<td class="ttd">리뷰</td>
<td><textarea rows="20" cols="120" placeholder="고객님의 경험은 다른 여행객들이 숙박을 선택하는 데 큰 도움이 됩니다." name="content"></textarea></td>
</tr>





<tr>
<td colspan="2">
<button type="submit" class="review_button_DY" onClick="alert('리뷰가 제출되었습니다')">리뷰 쓰기</button>
</td>
</tr>


</table> 
<!--테이블 끝  -->



</form>
<!--폼 끝  -->






















<!--별점 스크립트  -->
<script type="text/javascript">

$('.starRev span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});
</script>
<!--별점 스크립트  -->







<!-- 페이지내용 끝 -->
</div>
</div><!-- 회원 관리 페이지 'subpage' include된 페이지의 div끝 !!지우지마세요!!-->
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
<!--body끝  -->



</html>

























