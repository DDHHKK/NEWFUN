<%@page import="net.wishlist.db.MyWishBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="net.wishlist.db.MyWishDAO"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
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
	MemberDAO md = new MemberDAO();
	MemberBean mb = new MemberBean(); 
	String email = (String)session.getAttribute("email");
	mb=md.getMember(email);
	Vector vt=md.getheartphoto();
	Vector vt2=md.getsatisfactionphoto();
	List heart=(List)vt.get(0);
	List satisfaction = (List)vt2.get(0);
	
	int hostCheck = 0;
	try{
	hostCheck = (int)session.getAttribute("hostCheck");
	}catch(Exception e){
		hostCheck=0;}

	
	
	
	if(session.getAttribute("email")==null){
	%>
	<!-- 로그인/회원가입 버튼 -->
<button class="btn_remove" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">로그인</button>
<button class="btn_remove" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">회원가입</button>
	<%
	
	}else{
	%>
	
	<div class="log_btn_sh">
	<div class="dropdown">
		<img src="./upload/<%=mb.getProfile_photo()%>" style="border-radius:50%;width:25px;height:25px;float:left;">
		<button class="dropbtn">
			<%=email%>
		</button>
		<div class="dropdown-content">
<%
//id가 admin이면 회원목록 출력 


if (email.equals("admin")) {
%>
 		<a href="./MemberListAction.me">회원목록</a>
 		<a href="./FAQ_boardList.fa">FAQ</a>
		<a href="./MemberLogout.me">로그아웃</a>
 <%}else{%>
		<a href="./MemberUpdate.me">프로필수정</a>
		<a href="./MyReserve.bk">나의 예약</a>
		<a href="./Wishlist.wi">찜한숙소</a>
		<a href="./MemberMileage.me">마일리지</a>
		<a href="./MemberQNAlist.me">문의확인</a>
<%if(hostCheck==1){%>
		<a href="./HostPassCheck.ho">숙소 관리</a>
		<a href="./HostCash.ho">MY CASH</a>
<%}%>
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
      <div id="logo_sh"><i>FUNSTAY</i></div>
    </div>
    <div class="container">
     <div class="join_box">
  <!-- 이메일(아이디)입력 폼 -->   
      <label for="email"><b>Email</b></label>
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
      <button type="submit" class="subtn"><span>로그인</span></button>
      <br><br>
        <!-- 아이디저장  --> 
<!--       <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label> -->
      <br>
  <!-- 비밀번호 찾기 --> 
    <div id="forget_sh">
 		 <div class="forget">
  		
  		</div>  
  
  <!-- 아이디 찾기 -->
 	 	 <div class="forget">
  		<a href="./find_id.me">Forget email / password ?</a>
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
      <div id="logo_sh"><i>FUNSTAY</i></div>
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

       <input type="button" value="동의약관" style="background-color: #cc1d1d; color:#fff; border: 1px solid #cc1d1d; border-radius: 2px;" onclick="window.open('./member/agree.jsp','동의약관','top=200, left=150, width=1400, height=500')"> 
      <!-- <a href="./member/agree.jsp" style="color:dodgerblue">동의약관</a>.</p>  -->

<!-- 전송버튼 -->
      <div class="clearfix">
        <button type="button" class="subtn" onclick="regChk()"><span>가입완료</span></button>
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
<a href="#" id="pont">FUNSTAY</a>
<nav id="nav_1">
<form action="./MemberSearchAction.me" method="post" name="fff" id="form_2">
<ol>
<li class="tite_text">여행에 필요한 정보를 적으세요.</li>
<li>목적지</li>
<li><input type="text" value="" placeholder="목적지를 적으세요" class="textsize1" name="address"></li>
<li><span>체크인</span> <span id="checkout">체크아웃</span></li>
<li>
   <input type='text' id="minMaxExample" class='datepicker-here' name="start_date" data-language='en' data-position="bottom left" placeholder="년 / 월 / 일"/>
   <input type="text" value="" class="textsize2" id="datepicker" name="end_date" data-language='en' placeholder="년 / 월 / 일">

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
<li><input type="submit" value="검색" id="btn1" onclick="fundk()"></li> 
<!-- <li><button type="submit" id="btn1" onclick="fundk()"><span>검색</span></button></li> -->


</ol>
</form>
</nav>
</div>
<nav>
<p id="font2">지역 추천 여행을 다녀와 보세요<p>

<table border="0" id="table_1"> <!--랜덤으로 사진을 나오게하는 소스 여기서부터시작-->
 <script>   <!--랜덤으로 나올 사진들 배열에 넣음.--> 
 var imgUrls = new Array();
 imgUrls.push( "img/photo_1.png" );
 imgUrls.push( "img/photo_2.png" );
 imgUrls.push( "img/photo_3.png" );
 imgUrls.push( "img/photo_4.png" );
 imgUrls.push( "img/photo_5.png" );

 
 var imgUrls2 = new Array();
 imgUrls2.push( "img/photo_7.png" );
 imgUrls2.push( "img/photo_8.png" );
 imgUrls2.push( "img/photo_9.png" );
 imgUrls2.push( "img/photo_10.png" );
 imgUrls2.push( "img/photo_11.png" );

 
 var imgUrls3 = new Array();
 imgUrls3.push( "img/photo_13.png" );
 imgUrls3.push( "img/photo_14.png" );
 imgUrls3.push( "img/photo_15.png" );
 imgUrls3.push( "img/photo_16.png" );
 imgUrls3.push( "img/photo_17.png" );

 var imgUrls4 = new Array();
 imgUrls4.push( "img/photo_19.png" );
 imgUrls4.push( "img/photo_20.png" );
 imgUrls4.push( "img/photo_21.png" );
 imgUrls4.push( "img/photo_22.png" );
 imgUrls4.push( "img/photo_23.png" );

 
 var imgUrls5 = new Array();
 imgUrls5.push( "img/photo_6.png" );
 imgUrls5.push( "img/photo_12.png" );
 imgUrls5.push( "img/photo_18.png" );
 imgUrls5.push( "img/photo_24.png" );
 </script>
   <tr>   
             
    <td>
    <div id= "img_1">
    <script>
document.write( "<img src='" + imgUrls[ Math.floor( Math.random() * 5) ] + "' width=300 height=300>"); //랜덤으로 난수발생하여 배열에사진하나를출력
</script>
</div>
</td>     

   	<td>
   	<div id= "img_2">
   	<script>
document.write( "<img src='" + imgUrls2[ Math.floor( Math.random() * 5) ] + "' width=300 height=300>" ); //랜덤으로 난수발생하여 배열에사진하나를출력
</script>
</div>
</td>

<td>
<div id= "img_3">
<script>
document.write( "<img src='" + imgUrls3[ Math.floor( Math.random() * 5) ] + "' width=300 height=300>" ); //랜덤으로 난수발생하여 배열에사진하나를출력
</script>
</div>
</td>

 <td>
 <div id= "img_4">
 <script>
document.write( "<img src='" + imgUrls4[ Math.floor( Math.random() * 5) ] + "' width=300 height=300>" ); //랜덤으로 난수발생하여 배열에사진하나를출력
</script>
</div>
</td>

<td>
 <div id= "img_5">
 <script>
document.write( "<img src='" + imgUrls5[ Math.floor( Math.random() * 4) ] + "' width=300 height=300>" ); //랜덤으로 난수발생하여 배열에사진하나를출력
</script>
</div>
</td>

</tr>
 </table> <!--랜덤으로 사진을 나오게하는 소스 여기서 끝--> 

</nav>



<nav>
<p id="font2">좋아요 TOP5 지역으로 떠나보세요<p>

<table border="0" id="table_1"> <!--랜덤으로 사진을 나오게하는 소스 여기서부터시작-->

<tr>
<td class="top_pad_ws">TOP1</td>
<td class="top_pad1_ws">TOP2</td>
<td class="top_pad1_ws">TOP3</td>
<td class="top_pad1_ws">TOP4</td>
<td class="top_pad1_ws">TOP5</td>
</tr>

   <tr> 
    <td>
    <div id= "img_1">
    <%MyWishBean sb1 = (MyWishBean)heart.get(0);
    String str=sb1.getHome_photo().split(".png")[0];%>
	<a href="./MemberSearchAction2.me?search_info=<%=str%>"><img src="./upload/<%=sb1.getHome_photo().split(",")[0]%>" width="300" height="300"></a>; 
</div>
</td>     

   	<td>
   	<div id= "img_2">
   	<%MyWishBean sb2 = (MyWishBean)heart.get(1); 
   	String str2=sb2.getHome_photo().split(".png")[0];%>
   	<a href="./MemberSearchAction2.me?search_info=<%=str2%>"><img src="./upload/<%=sb2.getHome_photo().split(",")[0]%>" width="300" height="300"></a>; 
</div>
</td>

<td>
<div id= "img_3">
	<%MyWishBean sb3 = (MyWishBean)heart.get(2);
	String str3=sb3.getHome_photo().split(".png")[0];%>
	<a href="./MemberSearchAction2.me?search_info=<%=str3%>"><img src="./upload/<%=sb3.getHome_photo().split(",")[0]%>" width="300" height="300"></a>; 

</div>
</td>

 <td>
 <div id= "img_4">
	<%MyWishBean sb4 = (MyWishBean)heart.get(3);
	String str4=sb4.getHome_photo().split(".png")[0];%>
	<a href="./MemberSearchAction2.me?search_info=<%=str4%>"><img src="./upload/<%=sb4.getHome_photo().split(",")[0]%>" width="300" height="300"></a>; 

</div>
</td>

<td>
 <div id= "img_5">
 	<%MyWishBean sb5 = (MyWishBean)heart.get(4);
 	String str5=sb5.getHome_photo().split(".png")[0];%>
	<a href="./MemberSearchAction2.me?search_info=<%=str5%>"><img src="./upload/<%=sb5.getHome_photo().split(",")[0]%>" width="300" height="300"></a>; 

</div>
</td>

</tr>
 </table> <!--랜덤으로 사진을 나오게하는 소스 여기서 끝--> 
 

 
</nav>

<nav>
<p id="font2">게스트의 만족도 TOP5 지역으로 떠나보세요<p>

<table border="0" id="table_1"> <!--랜덤으로 사진을 나오게하는 소스 여기서부터시작-->

<tr>
<td class="top_pad_ws">TOP1</td>
<td class="top_pad1_ws">TOP2</td>
<td class="top_pad1_ws">TOP3</td>
<td class="top_pad1_ws">TOP4</td>
<td class="top_pad1_ws">TOP5</td>
</tr>

   <tr> 
    <td>
    <div id= "img_1">
    <%MyWishBean sbb1 = (MyWishBean)satisfaction.get(0); 
    String strr1=sbb1.getHome_photo().split(".png")[0];%>
	<a href="./MemberSearchAction2.me?search_info=<%=strr1%>"><img src="./upload/<%=sbb1.getHome_photo().split(",")[0]%>" width="300" height="300"></a>; 
</div>
</td>     

   	<td>
   	<div id= "img_2">
   	<%MyWishBean sbb2 = (MyWishBean)satisfaction.get(1); 
   	 String strr2=sbb2.getHome_photo().split(".png")[0];%>
   	<a href="./MemberSearchAction2.me?search_info=<%=strr2%>"><img src="./upload/<%=sbb2.getHome_photo().split(",")[0]%>" width="300" height="300"></a>; 
</div>
</td>

<td>
<div id= "img_3">
	<%MyWishBean sbb3 = (MyWishBean)satisfaction.get(2);
	 String strr3=sbb3.getHome_photo().split(".png")[0];%>
	<a href="./MemberSearchAction2.me?search_info=<%=strr3%>"><img src="./upload/<%=sbb3.getHome_photo().split(",")[0]%>" width="300" height="300"></a>; 

</div>
</td>

 <td>
 <div id= "img_4">
	<%MyWishBean sbb4 = (MyWishBean)satisfaction.get(3);
	 String strr4=sbb4.getHome_photo().split(".png")[0];%>
	<a href="./MemberSearchAction2.me?search_info=<%=strr4%>"><img src="./upload/<%=sbb4.getHome_photo().split(",")[0]%>" width="300" height="300"></a>; 

</div>
</td>

<td>
 <div id= "img_5">
 	<%MyWishBean sbb5 = (MyWishBean)satisfaction.get(4);
 	 String strr5=sbb5.getHome_photo().split(".png")[0];%>
	<a href="./MemberSearchAction2.me?search_info=<%=strr5%>"><img src="./upload/<%=sbb5.getHome_photo().split(",")[0]%>" width="300" height="300"></a>; 

</div>
</td>

</tr>
 </table> <!--랜덤으로 사진을 나오게하는 소스 여기서 끝--> 
 
 
 
</nav>

<script src="dist/js/main.js"></script>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5bed14f670ff5a5a3a7243af/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
</body>
</html>