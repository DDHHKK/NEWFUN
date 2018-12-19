<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">
#check_box{
text-align: center;
width: 490px;
margin: 0 auto 0 auto;
}

</style> 
</head>
<body>
<%String email = request.getParameter("email");

MemberDAO mdao = new MemberDAO();
int check = mdao.emailCheck(email);
%>

<div id="check_box">
<b><font size="4" color="gray">아이디 중복체크</font></b>
<hr width="300">
<div id="chk">
<form action="./MemberEmailCheckAction.me" method="post" name="wfr" >
   
	<input type="text" name="email" class="email" value="<%=email %>">
	<input type="submit" value="중복확인">
</form>
<div id="msg"></div>	
<br>
<%
if(check==1){
	%>
	<input type="button" value="취소" onclick="window.close()">
<%
}else{
	%>
<!-- 	<input type="button" value="사용하기" onclick="result()"> -->
	<input type="button" value="사용하기" class="test">
	<input type="button" value="취소" onclick="window.close()">
<%	
}
%>      
 
</div>   
</div>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	$('.test').on('click',function(){
		var email = $('form').find('.email').val();
		/* alert(email); */
		window.close();
	});
	
		/* function result(){
			//join_check.jsp 페이지를 열리게 한 페이지(index.jsp 의 중복체크버튼) >>> window.opener
			 
			window.close();
			} */
	});

</script>
</body>
</html>