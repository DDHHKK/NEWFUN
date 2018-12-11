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
     <div class="srh_box br">
      <div class="srh_top">
       <h2>비밀번호 찾기</h2>
       "내정보에 등록한 정보로"<br>
       "비밀번호를 재설정할 수 있습니다"
      </div><!-- //srh_top -->
      <div class="info">
      <form name="pw_form" method="post" action="./Pw_FindAction.me" onsubmit="return chk_pwform(this)">
       <input type="hidden" name="s_type" value="pw">
       <fieldset>
        <!-- <legend>비밀번호 찾기</legend> -->
         <p>
          <label for="pw_name">ID</label>
           <input type="text" name="me_email" id="pw_name" title="아이디 입력">
         </p>
         <p>
         <label for="pw_phone">이름</label>
          <input type="text" name="me_name" id="pw_phone" title="이름을 입력">
         </p>

         <button type="submit">찾기</button>
       </fieldset>
      </form>
      </div><!-- //info -->
     </div><!-- //srh_box br -->
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