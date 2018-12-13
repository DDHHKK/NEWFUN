﻿<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.member.db.MemberBean"%>
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
<link href="./css/mypage/update.css" rel="stylesheet">


<script src="./js/file.js"></script>




</head>
<body>

<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>
<!-- 회원 관리 페이지 왼쪽메뉴바 시작 -->
<jsp:include page="../include/subpage.jsp"></jsp:include>
<!-- 회원 관리 페이지 왼쪽메뉴바 끝 -->
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
	String email = (String) session.getAttribute("email");
	
	if(email == null){	//세션이 없으면 로그인 페이지로.
		response.sendRedirect("../Main.me");
	}

	/* MemberBean mb = (MemberBean)request.getAttribute("mb"); */
	MemberDAO mdao = new MemberDAO();
	MemberBean mb = mdao.getMember(email);
	%>  
<div id="content">
<!-- 페이지내용 시작 -->
 <div class="panel_box_sh">
  <h1>정보수정</h1>
  <!-- 정보수정폼시작 -->
  <form action="./MemberUpdateAction.me" id="join"method="post" enctype="multipart/form-data">
  
   <div id="fileup_sh" name="photo" style="width: 150px; height: 150px;">
  <!-- <p id="status_sh">프로필 사진</p> -->
  
  <img id="preview" src="./upload/<%=mb.getProfile_photo()%>"style="width: 150px; height: 150px; border-radius: 50%;">
	  
   </div>
  <p>
  
  <input type="file" name="profile_photo" id="getfile" accept="image/*"></p>
  <div id="holder_sh"></div>
   
   <div>
    <p><i class="fa fa-envelope icon"></i> <label>E-Mail</label></p>
    <p><input type="text" class="t_box_sh" name="email" value="<%=mb.getEmail()%>" style="border: none;" readonly></p>
   </div>
   
   <div>
    <p><i class="fa fa-key icon"></i><label>Password</label></p>
    <p><input type="password" class="t_box_sh" name="pass" ></p>
   </div>
   
     <div>
    <p><i class="fa fa-key icon"></i><label>Password Check</label></p>
    <p><input type="password" class="t_box_sh" name="pass_check"></p>
   </div>
   
   <div>
   	 <p><i class="fa fa-user-o"></i><label>NAME</label></p>
     <p><input type="text" class="t_box_sh" name="name" value="<%=mb.getName()%>"></p>
   </div>
   
   <div>
    <p><i class="fa fa-phone icon"></i><label>PhoneNumber</label></p>
    <p><input type="text" class="t_box_sh" name="phone" value="<%=mb.getPhone()%>"></p>
   </div>
   
   <div>
    <p><i class="fa fa-heart icon"></i><label>birth</label></p>
    <p>
 
    <input type="text" name="birth" class="t_box_sh" value="<%=mb.getBirth()%>" readonly>
    
    </p>
   </div>
   
   <div id="buttons_sh">
    <input type="submit" value="저장하기" class="btn">
    <input type="button" value="취소하기" class="btn" onclick="history.back()">
    <input type="button" value="탈퇴하기" class="btn1" onclick="location.href='./MemberDelete.me'">
   </div>
   
  </form> 
  <!-- //정보수정폼끝 -->
</div><!-- //panel_box -->

<script>

var file1 = document.querySelector('#getfile');

file1.onchange = function () {
    var fileList = file1.files ;

    // 읽기
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    //로드 한 후
    reader.onload = function  () {
        document.querySelector('#preview').src = reader.result ;
    };
};


</script>


<!-- 페이지내용 끝 -->
</div><!-- content 끝 -->
</div><!-- 회원 관리 페이지 'subpage' include된 페이지의 div끝 !!지우지마세요!!-->
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>