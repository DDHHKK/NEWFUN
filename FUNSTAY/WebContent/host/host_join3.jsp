<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
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


<script src="./js/default/jquery-3.3.1.js"></script>

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
String [] num_conv = request.getParameterValues("num_conv");
/* List<BedBean> bed_type = (List)request.getAttribute("bed_type"); */

int re_room =  Integer.parseInt(request.getParameter("re_room"));

// 호스팅 시작날짜 끝나는 날짜 계산
Calendar cal = Calendar.getInstance();
cal.setTime(new Date());
cal.add(Calendar.DATE, 3);
 
// 지정된 형태의 날짜로 출력
DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
String strDate = df.format(cal.getTime());
cal.setTime(new Date());
cal.add(Calendar.DATE, end_date);
String endDate = df.format(cal.getTime());


%>



<!-- 페이지내용 시작 -->


<div id="content">



<form action="./HostInsertAction.ho" method="post" enctype="multipart/form-data">


<input type="hidden" name="re_room" value="<%=re_room%>">

<table id="info_check">
<tr><td colspan="2"><b>정보가 정확히 입력되었는지 확인 해주세요.</b></td></tr>

<tr><td class="td1">숙소이름  </td><td class="td2"><input type="text" name="room_subject" size="100" value="<%=room_subject %>" readonly></td></tr>
<tr><td class="td1">숙소설명  </td><td class="td2"><textarea name="room_content" cols="100" rows="10" id="cc" readonly><%=room_content %></textarea></td></tr>
<tr><td class="td1">룸타입  </td><td class="td2"><input type="text" name="room_type" value="<%=room_type %>" readonly></td></tr>
<tr><td class="td1">욕실개수  </td><td class="td2"><input type="text" name="restroom" value="<%=restroom %>" readonly></td></tr>
<tr><td class="td1">1박당 가격  </td><td class="td2"><input type="text" name="price" value="<%=price %>" readonly></td></tr>
<tr><td class="td1">체크인 가능 시간  </td><td class="td2"><input type="text" name="in_time" value="<%=in_time %>" readonly> </td></tr>
<tr><td class="td1">체크아웃 가능 시간  </td><td class="td2"><input type="text" name="out_time" value="<%=out_time %>" readonly></td></tr>
<tr><td class="td1">호스팅 기간  </td><td class="td2"><input type="text" name="end_date" value="<%=strDate%> ~ <%=endDate%>" readonly><input type="hidden" name="end_date" value="<%=end_date %>" readonly></td></tr>
<tr><td class="td1">편의시설 </td><td class="td2">
<%
try{

	for(int i=0; i<convenience.length; i++){%>
	<%
	if(i == (convenience.length-1)){
		out.print(convenience[i]);
			%>
			
		<%}

	else{
		out.print(convenience[i]+",");
	%>
	
	<%}
	}
}
catch(Exception e)
{
	e.printStackTrace();
}

for(int i=0; i<num_conv.length; i++)
{
	%>
	<input type="hidden" name="num_conv" value="<%=num_conv[i] %>">
	<%
}

%>

</td></tr>
<tr><td class="td1">총 방개수</td><td class="td2"><input type="text" name="re_room" value="<%=re_room %>" readonly></td></tr>
<tr><td class="td1">주소  </td><td class="td2"><input type="text" name="address" size="100" value="<%=address %>" readonly></td></tr>



<tr><td colspan="2"><input type="button" value="<<이전페이지" id="back_btn" onclick="history.go(-1)">
<input type="submit" value="숙소등록하기" id="sub_btn"></td></tr>
</table>
	
<div id="photo_up">
<div id="photo_subject"><b>숙소 사진을 업로드 해주세요.</b></div>
<div class="ptouterbox_1">
	<div class="ptinnerbox_1">
		<div class="inner_subject">
			<label for="photo1">업로드1</label>
			<input type="file" name="photo1" id="photo1">
		</div>
		<div class="inner_img">
			<img id="img_shj1">
		</div>
	</div>
	<div class="ptinnerbox_2">
		<div class="inner_subject">
			<label for="photo1">업로드1</label>
			<input type="file" name="photo2" id="photo2">
		</div>
		<div class="inner_img">
			<img id="img_shj2">
		</div>
	</div>
</div>

<div class="ptouterbox_2">
	<div class="ptinnerbox_1">
		<div class="inner_subject">
			<label for="photo1">업로드1</label>
			<input type="file" name="photo3" id="photo3">
		</div>
		<div class="inner_img">
			<img id="img_shj3">
		</div>
	</div>
	
	<div class="ptinnerbox_2">
		<div class="inner_subject">
			<label for="photo1">업로드1</label>
			<input type="file" name="photo4" id="photo4">
		</div>
		<div class="inner_img">
			<img id="img_shj4">
		</div>
	</div>
</div>

<div class="ptouterbox_3">
	<div class="inner_subject">
		<label for="photo1">업로드1</label>
		<input type="file" name="photo5" id="photo5">
	</div>
	<div class="inner_img">
		<img id="img_shj5">
	</div>
</div>

<script type="text/javascript">
var sel_files;
var id;
$(document).ready(function(){
	//path = $(this);
	$(this).on("change",handleImgFileSelect);
});
	
	function handleImgFileSelect (e)
	{
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		id =e.target.id;
		filesArr.forEach(function(f){
			if(!f.type.match("image.*"))	{alert("확장자는 이미지 확장자만 가능합니다.");return;}		
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e)
		{
			if(id=="photo1"){$("#img_shj1").attr("src",e.target.result);}
			else if(id=="photo2"){	$("#img_shj2").attr("src",e.target.result);}
			else if(id=="photo3"){
				$("#img_shj3").attr("src",e.target.result);}
			else if(id=="photo4"){
				$("#img_shj4").attr("src",e.target.result);}
			else if(id=="photo5"){
				$("#img_shj5").attr("src",e.target.result);}
		}
		reader.readAsDataURL(f);
		});
	}

</script>
<!-- <label for="photo1">업로드1</label>
<tr><td><input type="file" name="photo1" id="photo1"></td></tr>
<div></div>
<label for="photo2">업로드2</label>
<tr><td><input type="file" name="photo2" id="photo2"></td></tr>

<label for="photo3">업로드3</label>
<tr><td><input type="file" name="photo3" id="photo3"></td></tr>

<label for="photo4">업로드4</label>
<tr><td><input type="file" name="photo4" id="photo4"></td></tr>

<label for="photo5">업로드5</label>
<tr><td><input type="file" name="photo5" id="photo5"></td></tr> -->
</div>
	
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
