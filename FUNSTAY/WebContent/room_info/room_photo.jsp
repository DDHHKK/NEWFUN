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

 
<div id="room_photo" style="width=100%;">
<table align="center" style="width=100%;border-collapse:collapse;">
<tr>
<th rowspan="3" style="width:50%">
<a href="#"><img src="./upload/<%=sc.getPhoto().split(",")[0] %>" width="100%" height="700px" style="position:relative;left:2px;"></a></th>
<th style="width:25%"><a href="#"><img src="./upload/<%=sc.getPhoto().split(",")[1] %>" width="100%" height="350px" style="position:relative;top:3px;"></a></th>
<th style="width:25%"><a href="#"><img src="./upload/<%=sc.getPhoto().split(",")[2] %>" width="100%" height="350px" style="position:relative;top:3px;right: 2px;"></a></th>
</tr>
<tr>
<th><a href="#"><img src="./upload/<%=sc.getPhoto().split(",")[3] %>" width="100%" height="350px" style="position:relative;bottom:3px;"></a></th>
<th><a href="#"><img src="./upload/<%=sc.getPhoto().split(",")[4] %>" width="100%" height="350px" style="position:relative;bottom:3px;right: 2px;"></a></th>
</tr>
</table>
 </div> 
 
</body>
</html>