<%@page import="net.search.db.SearchBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 	request.setCharacterEncoding("UTF-8");
	SearchBean sc = (SearchBean) request.getAttribute("sc");
	String pageNum = (String) request.getAttribute("pageNum");
	int num = ((Integer) request.getAttribute("num")).intValue();
%>

 
<div id="room_photo" style="width: 90%;margin: 0 auto;">
<table align="center" style="width=100%;border-collapse:collapse;">
<tr>
<th rowspan="3" style="width:50%">
<a href="#"><img class="roomimg_sg" src="./upload/<%=sc.getPhoto().split(",")[0] %>" width="100%" height="700px" style="position:relative;left:2px;"></a></th>
<th style="width:25%"><a href="#"><img class="roomimg_sg" src="./upload/<%=sc.getPhoto().split(",")[1] %>" width="100%" height="350px" style="position:relative;top:3px;"></a></th>
<th style="width:25%"><a href="#"><img class="roomimg_sg" src="./upload/<%=sc.getPhoto().split(",")[2] %>" width="100%" height="350px" style="position:relative;top:3px;right: 2px;"></a></th>
</tr>
<tr>
<th><a href="#"><img class="roomimg_sg" src="./upload/<%=sc.getPhoto().split(",")[3] %>" width="100%" height="350px" style="position:relative;bottom:3px;"></a></th>
<th><a href="#"><img class="roomimg_sg" src="./upload/<%=sc.getPhoto().split(",")[4] %>" width="100%" height="350px" style="position:relative;bottom:3px;right: 2px;"></a></th>
</tr>
</table>
 </div> 