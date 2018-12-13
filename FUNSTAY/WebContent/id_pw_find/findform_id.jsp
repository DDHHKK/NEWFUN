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

<div class="tab">
  <button class="tablinks line" onclick="openCity(event, 'London')"id="defaultOpen">아이디 찾기</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">비밀번호 찾기</button>
</div>

<div id="London" class="tabcontent cont_box">
	<div class="content">
		<div class="agree">
		<!-- <div id="ysh"><h1>ID/비밀번호 찾기</h1></div> -->

		<div class="srh_box or">
			<div class="wap">

				<div class="srh_top">회원가입시 등록한 정보로 아이디를 찾을수 있습니다.</div><!-- //srh_top -->

				<div class="info in_box">
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
							<select name="me_hp1" class="tel_box">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							- 
							<input type="text" name="me_hp2" id="id_mobile1" class="tel_box" title="휴대폰번호입력">
							- 
							<input type="text" name="me_hp3" id="id_mobile2"  class="tel_box" title="휴대폰번호입력">
						</p>

						<button type="submit" class="btn">아이디 찾기</button>
					</fieldset>
					</form>
				</div><!-- //info -->

			</div><!-- //warp -->
		</div><!-- //srh_box or -->

		</div><!-- //agree -->
	</div><!-- //content -->
</div><!-- //tabcontent -->



<div id="Paris" class="tabcontent cont_box">
<div class="content">
  <div class="agree">
	<!-- <div id="ysh"><h1>ID/비밀번호 찾기</h1></div> -->
     <div class="srh_box br">
      <div class="srh_top">
       	가입하신 "이메일" 로 비밀번호 찾기가 가능합니다.<br>
       	꼭 올바른 이메일,성함,휴대폰번호를 입력해 주세요.
      </div><!-- //srh_top -->
      <div class="info in_box">
      <form name="pw_form" method="post" action="./Pw_FindAction.me" onsubmit="return chk_pwform(this)">
       <input type="hidden" name="s_type" value="pw">
       <fieldset>
        <!-- <legend>비밀번호 찾기</legend> -->
         <p>
          <label for="pw_name">아이디</label>
           <input type="text" name="me_email" id="pw_name" title="아이디 입력">
         </p>

         <p>
         <label for="pw_phone">이름</label>
          <input type="text" name="me_name" id="pw_phone" title="이름을 입력">
         </p>
         
         <p>
							<label for="id_mobile">휴대폰번호</label>
							<select name="me_hp1" class="tel_box">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							- 
							<input type="text" name="me_hp2" id="pass_mobile1" class="tel_box" title="휴대폰번호입력">
							- 
							<input type="text" name="me_hp3" id="pass_mobile2"  class="tel_box" title="휴대폰번호입력">
						</p>


         <button type="submit" class="btn">비밀번호 찾기</button>
       </fieldset>
      </form>
      </div><!-- //info -->
     </div><!-- //srh_box br -->
</div><!-- //agree -->
</div><!-- //content -->
</div><!-- //tabcontent -->





	<script>
	function openCity(evt, cityName) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}
	document.getElementById("defaultOpen").click();
	</script>



<!-- 페이지내용 끝 -->
</div>
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>