<%@page import="net.search.db.SearchBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
img {
    opacity: 0.8;
    filter: alpha(opacity=50); /* For IE8 and earlier */
}

img:hover {
    opacity: 1.5;
    filter: alpha(opacity=100); /* For IE8 and earlier */
}
</style>
</head>
<body>
<%
 	request.setCharacterEncoding("UTF-8");
	SearchBean sc = (SearchBean) request.getAttribute("sc");
	String pageNum = (String) request.getAttribute("pageNum");
	int num = ((Integer) request.getAttribute("num")).intValue();
%>


<div id="room_photo">
 <a name="사진"><h1>사진</h1></a><br>
<table border="4" align="center">
<tr>
<th rowspan="3" >
<a href="#"><img src="./upload/<%=sc.getPhoto().split(",")[0] %>" width="800" height="700"></a></th>
<th><a href="#"><img src="./upload/<%=sc.getPhoto().split(",")[1] %>" width="400" height="350"></a></th>
<th><a href="#"><img src="./upload/<%=sc.getPhoto().split(",")[2] %>" width="400" height="350"></a></th>
</tr>
<tr>
<th><a href="#"><img src="./upload/<%=sc.getPhoto().split(",")[3] %>" width="400" height="350"></a></th>
<th><a href="#"><img src="./upload/<%=sc.getPhoto().split(",")[4] %>" width="400" height="350"></a></th>
</tr>
</table>
 </div> 
 
</body>
</html>