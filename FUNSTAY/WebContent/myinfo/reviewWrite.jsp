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





<!--my_reserve.css  -->
<link href="./css/myinfo/my_reserve.css" rel="stylesheet">
<!--revewWrite.css  -->
<link href="./css/myinfo/reviewWrite.css" rel="stylesheet">
</head>




<!--body시작  -->
<body>
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

<p class="letter">리뷰쓰기</p>
 		
<!--폼 시작  --> 
<form action="./ReviewWriteAction.bk" method="post"> 

<!--테이블 시작  -->
<table border="1">

<!-- <tr>
<td>별점매기기</td>
<td>  
 <div class="starRev" name="satisfaction">
  <span class="starR on">별1</span>
  <span class="starR">별2</span>
  <span class="starR">별3</span>
  <span class="starR">별4</span>
  <span class="starR">별5</span>
</div>
</td>
</tr> -->
<h2>숙박이 어떠셨는지 말씀해 주세요</h2>

<tr>
<td>payment_num</td>
<td><input type="text" name="payment_num"></td>
</tr>
<tr>
<td>숙박후기작성</td>
<td><textarea rows="20" cols="120" placeholder="고객님의 경험은 다른 여행객들이 숙박을 선택하는 데 큰 도움이 됩니다." name="content"></textarea></td>
</tr>
<tr>
<td>만족도</td>
<td><input type="text" name="satisfaction"></td>
</tr>
<tr>
<td>깨끗함</td>
<td><input type="text" name="clean"></td>
</tr>
<tr>
<td>교통접근성</td>
<td><input type="text" name="access"></td>
</tr>
<tr>
<td>아이디</td>
<td><input type="text" name="member_email"></td>
</tr>
<tr>
<td>home_num</td>
<td><input type="text" name="home_num"></td>
</tr>
<tr>
<td colspan="2">
<button type="submit" class="review_button_DY" onClick="alert('리뷰가 제출되었습니다')">내 리뷰 제출하기</button>
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

























