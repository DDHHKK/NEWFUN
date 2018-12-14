<%@page import="net.member.db.MemberDAO"%>
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
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("me_name"); 
String phone = (request.getParameter("me_hp1")+request.getParameter("me_hp2")+request.getParameter("me_hp3"));

/* System.out.println(name);
System.out.println(phone); */

MemberBean mb = new MemberBean();

mb.setName(name);
mb.setPhone(phone);

MemberDAO mdao = new MemberDAO();
String email = mdao.findid(mb);

/* System.out.println("확인"+email); */

%>
<div class="content_box1">
  <div class="agree">
	
     <div class="srh_box br">
   
      <div class="info in_box1">
      
      <form name="pw_form" method="post" action="">
      
       <fieldset>
       
         <p>
			회원님의 아이디는 <br> <span><%=email %></span> 입니다.
         </p>

         <button type="button" class="btn_2" onclick="location.href='./Main.me'">메인페이지</button>
         <button type="button" class="btn_2" onclick="location.href='./find_id.me'">비밀번호 찾기</button>
       </fieldset>
      </form>
      </div><!-- //info -->
     </div><!-- //srh_box br -->
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