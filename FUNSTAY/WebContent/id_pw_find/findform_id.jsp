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
<link href="./css/default/default.css" rel="stylesheet">
<link href="./css/login1.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 페이지 default 링크 끝-->


<!-- 
	css파일 연결할때 예시 
	<link href="../css/jsp파일이 있는 폴더와 동일한 폴더를 css폴더 안에 만들고 폴더의 이름을 이곳에 써주세요/css파일 이름.css" rel="stylesheet"> 
	[예시] : message폴더에 message_list.jsp파일을 만들었을 경우
		css>message>message_list.css 파일이있어야합니다. 아래는 적용 link코드 입니다.
		<link href="../css/message/message_list.css" rel="stylesheet">	
	** js파일 적용방법도 동일합니다.
	 	<script src="../js/mypage/message_list.js"></script>
	** 해당 페이지의 연결링크와 스크립트를 head에 넣을때 default링크와 섞이지 않도록 주석으로 구분해서 넣어주세요
-->

<!-- 이메일 중복체크 -->
<script src="./js/member/email_check.js"></script>
<!-- 회원가입시 제어 -->
<script src="./js/default/required_Join.js"></script>
<link href="./css/mypage/id_find.css" rel="stylesheet">
<script src="./js/member/id_find.js"></script>
</head>
<body>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>

<div id="content">
<!-- 페이지내용 시작 -->
<div class="content">
  <div class="agree">
	<!-- <div id="ysh"><h1>ID/비밀번호 찾기</h1></div> -->
   <ul class="id_pw_srh">
    <li>
  <div class="srh_box or">
  <div class="wap">
  <div class="srh_top">
   <h2>ID찾기</h2>
	"내정보에 등록한 정보로"<br>
	"아이디를 찾을수 있습니다"
  </div><!-- //srh_top -->
<div class="info">
 <form name="id_form" method="post" action="./Id_FindAction.me" onsubmit="return chk_idform(this)">
  <input type="hidden" name="s_type" value="id">
   <fieldset>
    <!-- <legend>ID 찾기</legend> -->
     <p>
   	  <label for="id_name">이름</label>
   	  <input type="text" name="me_name" id="id_name" title="이름을 입력">
     </p>
     <p>
      <label for="id_mobile">휴대폰번호</label>
      <select name="me_hp1">
       <option value="">선택</option>
       <option value="010">010</option>
       <option value="011">011</option>
       <option value="016">016</option>
       <option value="017">017</option>
       <option value="018">018</option>
       <option value="019">019</option>
      </select>
       - 
      <input type="text" name="me_hp2" id="id_mobile1" title="휴대폰번호입력" style="width: 50px;">
       - 
      <input type="text" name="me_hp3" id="id_mobile2" title="휴대폰번호입력" style="width: 50px;">
     </p>

     <button type="submit">찾기</button>
   </fieldset>
 </form>
</div><!-- //info -->
</div><!-- //warp -->
</div><!-- //srh_box or -->
    </li>
   </ul>
</div><!-- //agree -->
</div><!-- //content -->



<!-- 페이지내용 끝 -->
</div>
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>