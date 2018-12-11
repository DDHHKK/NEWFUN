<%@page import="net.bed.db.BedBean"%>
<%@page import="java.util.List"%>
<%@page import="net.conv.db.ConvBean"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@page import="net.host.db.*"%>
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

<!-- 편의시설 아이콘 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.1/css/all.css'
	integrity='sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz' crossorigin='anonymous'>
	
<!-- css -->
<link href="./css/host/host3.css" rel="stylesheet">



</head>
<body>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->




<%
request.setCharacterEncoding("utf-8");


HostBean hb=new HostBean();


String room_subject = request.getParameter("room_subject");
String room_content = request.getParameter("room_content");
String room_type = request.getParameter("room_type");
int restroom = Integer.parseInt(request.getParameter("restroom"));
int price =  Integer.parseInt(request.getParameter("price"));
String in_time = request.getParameter("in_time");
String out_time = request.getParameter("out_time"); 
int end_date = Integer.parseInt(request.getParameter("end_date")); 
String[] convenience=request.getParameterValues("convenience");
String address = request.getParameter("address"); 


/* List<BedBean> bed_type = (List)request.getAttribute("bed_type"); */

int re_room =  Integer.parseInt(request.getParameter("re_room"))+1;




%>



<!-- 페이지내용 시작 -->


<div id="content">



<form action="./HostInsertAction.ho" method="post" enctype="multipart/form-data">


<%-- <input type="hidden" name="bed_type" value="<%= bed_type%>"> --%>
<input type="hidden" name="re_room" value="<%= re_room%>">



<table id="info_check">
<tr><td colspan="2"><b>정보가 정확히 입력되었는지 확인 해주세요.</b></td></tr>

<tr><td class="td1">숙소이름  </td><td class="td2"><input type="text" name="room_subject" size="100" value="<%=room_subject %>" readonly></td></tr>
<tr><td class="td1">숙소설명  </td><td class="td2"><textarea name="room_content" cols="100" rows="10" id="cc" readonly><%=room_content %></textarea></td></tr>
<tr><td class="td1">룸타입  </td><td class="td2"><input type="text" name="room_type" value="<%=room_type %>" readonly></td></tr>
<tr><td class="td1">욕실개수  </td><td class="td2"><input type="text" name="restroom" value="<%=restroom %>" readonly></td></tr>
<tr><td class="td1">1박당 가격  </td><td class="td2"><input type="text" name="price" value="<%=price %>" readonly></td></tr>
<tr><td class="td1">체크인 가능 시간  </td><td class="td2"><input type="text" name="in_time" value="<%=in_time %>" readonly> </td></tr>
<tr><td class="td1">체크아웃 가능 시간  </td><td class="td2"><input type="text" name="out_time" value="<%=out_time %>" readonly></td></tr>
<tr><td class="td1">호스팅 끝낼 날짜  </td><td class="td2"><input type="text" name="end_date" value="<%=end_date %>" readonly></td></tr>
<tr><td class="td1">편의시설 </td><td class="td2">
<%for(int i=0; i<convenience.length; i++){%>
<%
if(i == (convenience.length-1)){
	out.print(convenience[i]);
			%>
			<input type="hidden" name="<%=i %>" value="<%=convenience[i]%>">
	<%}

else{
	out.print(convenience[i]+",");
%>
	<input type="hidden" name="<%=i %>" value="<%=convenience[i]%>">
<%}
}%>


</td></tr>
<tr><td class="td1">총 방개수</td><td class="td2"><input type="text" name="re_room" value="<%=re_room %>" readonly></td></tr>
<tr><td class="td1">주소  </td><td class="td2"><input type="text" name="address" size="100" value="<%=address %>" readonly></td></tr>





<tr><td colspan="2"><input type="button" value="<<이전페이지" id="back_btn" onclick="history.go(-1)">
<input type="submit" value="숙소등록하기" id="sub_btn"></td></tr>
</table>
	
<table id="photo_up">
<tr><td><b>숙소 사진을 업로드 해주세요.</b></td></tr>
<tr><td><input type="file" name="photo1"></td></tr>
<tr><td><input type="file" name="photo2"></td></tr>
<tr><td><input type="file" name="photo3"></td></tr>
<tr><td><input type="file" name="photo4"></td></tr>
<tr><td><input type="file" name="photo5"></td></tr>
</table>
	
</form>



<!-- 페이지내용 끝 -->
</div>
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>
