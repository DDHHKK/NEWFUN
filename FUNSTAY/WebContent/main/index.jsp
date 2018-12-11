<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="css/login1.css" rel="stylesheet">
<link href = "css/main.css" rel="stylesheet">
<!-- <link href = "css/practice1.css" rel="stylesheet"> -->


<!-- 로고 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<!-- 검색 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Kodchasan" rel="stylesheet">
<!-- 회원가입 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 로그인 jquery -->
<script src="js/login.js"></script>


<!-- date picker api  -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="dist/css/datepicker.min.css" rel="stylesheet"type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>


<script src="dist/js/caleander.js"></script>
<script src="dist/js/datepicker.js"></script>
<script src="dist/js/datepicker.min.js"></script>
<script src="dist/js/i18n/datepicker.en.js"></script>
<!-- 이메일 중복체크 -->
<script src="js/member/email_check.js"></script>
<!-- 회원가입시 제어 -->
<script src="js/default/required_Join.js"></script>

</head>

<body>

<div id="frame1">

<section>

	<%
	String email = (String)session.getAttribute("email");
	
	if(session.getAttribute("email")==null){
	%>
	<!-- 로그인/회원가입 버튼 -->
<button class="btn_remove" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">로그인</button>
<button class="btn_remove" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">회원가입</button>
	<%
	}else{
	MemberBean mb = new MemberBean();
	MemberDAO md = new MemberDAO();
	%>
	
	<div class="log_btn_sh">
	<div class="dropdown">
		<img src="./img/default/no_profile.png" style="border-radius:50%;width:25px;height:25px;float:left;">
		<button class="dropbtn">
		<%=mb.getProfile_photo()%>
			<%=email%>
		</button>
		<div class="dropdown-content">
<%
//id가 admin이면 회원목록 출력 
if (email.equals("admin")) {
%>
 		<a href="./MemberListAction.me">회원목록</a>
		<a href="./MemberLogout.me">로그아웃</a>
 <%}else{%>
		<a href="./MemberUpdate.me">프로필수정</a>
		<a href="./Booking.bo">예약및 결제하기</a>
		<a href="./MyReserve.bk">MY RESERVE</a>
		<a href="./Wishlist.wi">위시리스트</a>
		<a href="./MemberMileage.me">마일리지</a>
		<a href="./MemberQNAlist.me">문의확인</a>
		<a href="./MemberLogout.me">로그아웃</a>
		</div>
	</div>
 	</div><!-- //log_btn_sh -->
	<%	
		}
	}
	%>  

	
		<!-- 로그인 -->
<div id="id01" class="modal">
<div class="modal_sh">
  <form class="modal-content animate" action="./MemberLoginAction.me" method="post">
  <!-- 닫기버튼 스타일 -->
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <!-- 로고스타일 -->    
      <div id="logo_sh">FUNSTAY</div>
    </div>
    <div class="container">
     <div class="join_box">
  <!-- 이메일(아이디)입력 폼 -->   
      <label for="email"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="email" required>
  <!-- 비밀번호 입력 폼 -->
      <label for="pass"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="pass" id="myInput" required>
      </div>
  <!-- caps lock -->
     <p id="caps">WARNING! Caps lock is ON.</p> 
  <!-- SNS -->
      <div id="col_box">   
	  <div class="col">
       <!--  <a href="#" class="sns_btn naver">
          <i class="fa fa-twitter fa-fw"></i>Naver</a> -->
<!-- 카카오 연동 로그인 -->
  
<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>
	<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('5bd0699811ddfc0b8ef260a07e7c9163');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    </script> -->
       
      </div>
      <div class="col">
<!--         <a href="#" class="sns_btn google">
          <i class="fa fa-google fa-fw"></i>Google</a> -->
 <!-- 네이버 연동 로그인 -->

  <!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  네이버아이디로로그인 버튼 노출 영역
  <div id="naver_id_login" class="naver_box"></div>
  //네이버아이디로로그인 버튼 노출 영역
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("y_Gput02XwU2j3ZEUW3w", "http://localhost:8080/");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,48);
  	naver_id_login.setDomain("http://localhost:8080/");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script> -->
          
      </div> 
       </div> 
  <!-- 전송버튼 -->     
      <button type="submit" class="subtn"><a>로그인</a></button>
      <br><br>
        <!-- 아이디저장  --> 
<!--       <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label> -->
      <br>
  <!-- 비밀번호 찾기 --> 
   <div id="forget_sh">
 		 <div class="forget">
  		<a href="./find_pw.me">Forget password?</a>
  		</div> 
  
  <!-- 아이디 찾기 -->
 	 	 <div class="forget">
  		<a href="./find_id.me">Forget email?</a>
  		</div><!-- //forget -->
  	</div><!-- //forget_sh --> 
    </div><!-- container -->

<!-- 취소버튼 사용유무    
<div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" 
      class="cancelbtn">Cancel</button> 
    </div> -->
  </form>
 </div><!-- modal_sh -->
</div><!-- modal -->








	<!-- 회원가입 -->
<div id="id02" class="modal">
  <form class="modal-content animate" action="./MemberJoinAction.me" method="post" name="fr" enctype="multipart/form-data">
  <!-- 닫기버튼 -->
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
  <!-- 로고스타일 -->    
      <div id="logo_sh">FUNSTAY</div>
    </div>

    <div class="container">
    <div class="join_box">
<!-- 이메일(아이디)입력 폼 -->    
      <i class="fa fa-envelope icon"></i>
      <label for="email"><b>Email</b></label>
      <input type="email" placeholder="Enter Email" name="email">
<!-- 이메일 중복체크 입력 폼 -->       
      <div>
      <input type="button" value="E-mail중복체크" class="e_check" onclick="idcheck()">
      </div>
<!-- 비밀번호 입력 폼 -->      
<div id="clear"></div>
<i class="fa fa-key icon"></i>
      <label for="pass"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="pass" id="myInput1">
<!-- 비밀번호 보이게
      <input type="checkbox" onclick="myFunction()">Show Password<br> -->
<!-- 비밀번호 확인 폼-->
<i class="fa fa-key icon"></i>
      <label for="psw-repeat"><b>Repeat Password</b></label>
      <input type="password" placeholder="Repeat Password" name="pass2" onblur="passchk()">
	   <input type="text" class="psw-repeat" name="chk" value="비밀번호를 입력하세요" readonly="readonly">
<!-- 이름 폼 -->      
<i class="fa fa-user-o"></i>
      <label for="name"><b>NAME</b></label>
      <input type="text" placeholder="Enter Name" name="name" id="myname">    
<!-- 생년월일 폼 -->      
<i class="fa fa-heart icon"></i>
      <label><b>birth</b></label><br> 
      <select name="birth_yy" class="birth">
<!--년-->      	
      <%for(int i=2018; i>=1900; i--){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
     </select>

      <select name="birth_mm" class="birth">
<!--월-->
      <%for(int i=1; i<=12; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
      </select> 
<!--일-->     
      <select name="birth_dd" class="birth">
      <%for(int i=1; i<=31; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
      </select> 
      <br>
<!-- 폰번호 폼 -->      
<i class="fa fa-phone icon"></i>
      <label for="phone"><b>phone</b></label>
      <input type="text" placeholder="Enter phone number" name="phone"><br>   
      
<!-- 약관동의 -->
       <p>이용약관 및 개인정보 보호 정책에 동의하여 주십시요 <br><input type="checkbox" name="req"> 개인정보 수집 및 이용에 동의합니다. 
       <input type="button" value="동의약관" style="color:dodgerblue" onclick="window.open('./member/agree.jsp','동의약관','top=100, width=1400, height=500')">
       <!-- <a href="./member/agree.jsp" style="color:dodgerblue">동의약관</a>.</p> -->
<!-- 전송버튼 -->
      <div class="clearfix">
        <button type="button" class="subtn" onclick="regChk()"><a>가입완료</a></button>
        </div>
<!-- 취소버튼 사용 유무        
<div class="container" style="background-color:#f1f1f1">
<button type="button" onclick="document.getElementById('id02').style.display='none'" 
 class="cancelbtn">Cancel</button>  -->
      </div><!-- //join_box -->
    </div><!-- //container -->
  </form>
</div><!-- //modal -->
</section>
<div class="clear"></div>
<div class="main_box">
<a href="#" id="pont">FunStay</a>
<nav id="nav_1">
<form action="./MemberSearchAction.me" method="get" name="fff" id="form_2">
<ol>
<li class="tite_text">여행에 필요한 정보를 적으세요.</li>
<li>목적지</li>
<li><input type="text" value="" placeholder="목적지를 적으세요" class="textsize1" name="search_info"></li>
<li><span>체크인</span> <span id="checkout">체크아웃</span></li>
<li>
   <input type='text' id="minMaxExample" class='datepicker-here' data-language='en' data-position="bottom left" placeholder="년 / 월 / 일"/>
   <input type="text" value="" class="textsize2" id="datepicker" data-language='en' placeholder="년 / 월 / 일">

</li>
<li>인원</li>
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
       <input type="button" value="확인" onclick="choice()" id="btn_sh">
     </li>
     </ol>
  </nav>
</li>
<li><input type="submit" value="검색" id="btn1"></li>
</ol>
</form>
</nav>
</div>
<nav>
<p id="font2">지역 추천 여행을 다녀와 보세요<p>


		<!--랜덤으로 사진을 나오게하는 소스 여기서부터시작-->
	
	<table border="0" id="table_1">
		<!--랜덤으로 나올 사진들 배열에 넣음.-->
		<tr>
			<td>
				<div id="img_1"></div>
			</td>
			<td>
				<div id="img_2"></div>
			</td>
			<td>
				<div id="img_3"></div>
			</td>
			<td>
				<div id="img_4"></div>
			</td>
		</tr>
	</table>
	<!--랜덤으로 사진을 나오게하는 소스 여기서 끝-->
 
</nav>
<script src="dist/js/person.js"></script>
</body>
</html>