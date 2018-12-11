<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

결제 완료!!<br>
room_subject : <%=request.getAttribute("room_subject") %><br>
home_num : <%=request.getAttribute("home_num") %><br>
request_msg : <%=request.getAttribute("request_msg") %><br>
member_email : <%=request.getAttribute("member_email") %><br>
storage_m : <%=request.getAttribute("storage_m") %><br>
used_m : <%=request.getAttribute("used_m") %><br>

<!-- <script type="text/javascript">
//이전 페이지의 url을 불러오는 코드 ->  document.referrer
var x = document.referrer;
alert(x);
location.href=document.referrer;
</script> -->
</body>
</html>