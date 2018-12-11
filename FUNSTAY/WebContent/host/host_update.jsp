<%@page import="net.host.db.HostDAO"%>
<%@page import="net.bed.db.BedBean"%>
<%@page import="java.util.List"%>
<%@page import="net.host.db.HostBean"%>
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



<link href="./css/host/host_page.css" rel="stylesheet"> 


<!--my_reserve.css  -->
<link href="./css/myinfo/my_reserve.css" rel="stylesheet">
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
request.setCharacterEncoding("utf-8");

int home_num=5;

HostBean hb=new HostBean();
HostDAO hbdo=new HostDAO();

hb=hbdo.getHost(home_num);




%>


<!-- 각 페이지 내용을  content 영역 안에 배치 해주세요.-->
<div id="content_DY">







<!-- 여기서부터 페이지 내용을 적어주세요. -->

<p class="letter1">숙소 정보 수정</p>
 
<form action="./HostUpdatetAction.ho" method="post" enctype="multipart/form-data">


<%-- <input type="hidden" name="bed_type" value="<%= bed_type%>">
<input type="hidden" name="re_room" value="<%= re_room%>"> --%>



<table id="info_check">
<tr><td colspan="2"><b>정보가 정확히 입력되었는지 확인 해주세요.</b></td></tr>

<tr><td class="td1">숙소이름  </td><td class="td2"><input type="text" name="room_subject" size="100" value="<%=hb.getRoom_subject() %>"></td></tr>
<tr><td class="td1">숙소설명  </td><td class="td2"><textarea name="room_content" cols="100" rows="10" id="cc"><%=hb.getRoom_content() %></textarea></td></tr>
<tr><td class="td1">룸타입  </td><td class="td2"><input type="text" name="room_type" value="<%=hb.getRoom_type() %>"></td></tr>
<tr><td class="td1">욕실개수  </td><td class="td2"><input type="text" name="restroom" value="<%=hb.getRestroom()%>"></td></tr>
<tr><td class="td1">1박당 가격  </td><td class="td2"><input type="text" name="price" value="<%=hb.getPrice() %>"></td></tr>
<tr><td class="td1">체크인 가능 시간  </td><td class="td2"><input type="text" name="in_time" value="<%=hb.getIn_time() %>"> </td></tr>
<tr><td class="td1">체크아웃 가능 시간  </td><td class="td2"><input type="text" name="out_time" value="<%=hb.getOut_time() %>"></td></tr>
<tr><td class="td1">호스팅 시작날짜  </td><td class="td2"><input type="text" name="start_date" value="<%=hb.getStart_date() %>"></td></tr>
<tr><td class="td1">호스팅 끝낼날짜  </td><td class="td2"><input type="text" name="end_date" value="<%=hb.getEnd_date() %>"></td></tr>
<%-- <tr><td class="td1">편의시설 </td><td class="td2">
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


</td></tr> --%>
<%-- <tr><td class="td1">총 방개수</td><td class="td2"><input type="text" name="re_room" value="<%=re_room %>"></td></tr> --%>
<tr><td class="td1">주소  </td><td class="td2"><input type="text" name="address" size="100" value="<%=hb.getAddress() %>"></td></tr>

<tr><td><input type="file"name="photo1"><br>
<input type="file"name="photo2"><br>
<input type="file"name="photo3"><br>
<input type="file" name="photo4"><br>
<input type="file" name="photo5"></td></tr>



<tr><td colspan="2"><input type="submit" value="수정완료" id="sub_btn"></td></tr>
</table>
</form>







</div>





  
  
  
  

<!-- content 영역 끝 -->  





<script>


</script> 



<!-- 페이지내용 끝 -->
</div>
</div><!-- 회원 관리 페이지 'subpage' include된 페이지의 div끝 !!지우지마세요!!-->
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>