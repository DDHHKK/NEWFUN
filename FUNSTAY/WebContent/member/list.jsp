<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
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
<!-- 페이지 default 링크 끝-->

<!-- 
	.css파일 연결할때 예시 
	<link href="../css/jsp파일이 있는 폴더와 동일한 폴더를 css폴더 안에 만들고 폴더의 이름을 이곳에 써주세요/css파일 이름.css" rel="stylesheet"> 
	[예시] : message폴더에 message_list.jsp파일을 만들었을 경우
		css>message>message_list.css 파일이있어야합니다. 아래는 적용 link코드 입니다.
		<link href="../css/message/message_list.css" rel="stylesheet">	
	** .js파일 적용방법도 동일합니다.
	 	<script src="../js/mypage/message_list.js"></script>
	** 해당 페이지의 연결링크와 스크립트를 head에 넣을때 default링크와 섞이지 않도록 주석으로 구분해서 넣어주세요.
-->
<style type="text/css">
*{margin: auto;}
#title_h1{
	text-align: center;
	margin: 30px;
}
#title_table{
	border: 1px solid #c7c7c7;
    border-collapse: collapse;
    text-align: center;
    margin-bottom: 30px;
}
table tr th{
	padding:10px 10px;
	border: 1px solid #c7c7c7;
	background-color: #eaeaea;
}
table tr td{
	padding: 10px;
}
#sbtn{
	text-align: center;
}
#pagecont{
text-align: center;
}
</style>
</head>
<body>
<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->
<hr>
<!-- 회원 관리 페이지 왼쪽메뉴바 시작 -->
<jsp:include page="../include/subpage.jsp"></jsp:include>
<!-- 회원 관리 페이지 왼쪽메뉴바 끝 -->

<div id="content">
<!-- 페이지내용 시작 -->
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		String admin = (String) session.getAttribute("email");

		if (admin == null) {
			response.sendRedirect("./MemberLogin.me");
		}
		String email = (String) session.getAttribute("email");
		if(email == null){	//세션이 없으면 로그인 페이지로.
			response.sendRedirect("../Main.me");
		}
		List MemberList = (List)request.getAttribute("MemberList");
	%>
	<h1 id="title_h1">회원목록</h1>
	<table border="1" id="title_table">
		
		<tr class="title_tr">
		
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>프로필사진</th>
			<th>휴대폰번호</th>
			<th>생일</th>
			<th>마일리지</th>
			<th>비고</th>
		
		</tr>
		
		<% for (int i = 0; i < MemberList.size(); i++) {
			MemberBean mb = (MemberBean)MemberList.get(i);	
		%>
		<tr>
			<td class="p_td"><%=mb.getMember_num()%></td>
			<td class="p_td"><%=mb.getEmail()%></td>
			<td class="p_td"><%=mb.getPass()%></td>
			<td class="p_td"><%=mb.getName()%></td>
			<td class="p_td"><%=mb.getProfile_photo()%></td>
			<td class="p_td"><%=mb.getPhone()%></td>
			<td class="p_td"><%=mb.getBirth()%></td>
			<td class="p_td"><%=mb.getMileage()%></td>
			<td class="p_td">
			<%if(mb.getEmail().equals("admin")){
				%>
				추방불가
				<%
			}else{
				%>
			<a href="./DeleteListAction.me?member_num=<%=mb.getMember_num()%>">추방</a></td>
				<%
			}
			%>
		</tr>
		<%
			}
		%>
		
	</table>
		
	<%
	int count= ((Integer)request.getAttribute("count")).intValue();
	String pageNum= (String)request.getAttribute("pageNum");
	int pageCount= ((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock= ((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage= ((Integer)request.getAttribute("startPage")).intValue();
	int endPage= ((Integer)request.getAttribute("endPage")).intValue();
	List<MemberBean> bl =(List<MemberBean>)request.getAttribute("bl");
	
	System.out.println(startPage);
	System.out.println(endPage);
	System.out.println(endPage);
	
	%>
	<div id="pagecont">
	<%
	if(endPage > pageCount){
		endPage=pageCount;//전체 페이지 개수
	}
	
	if(startPage>pageCount)
	{	%> <a href="MemberListAction.me?pageNum=<%=startPage-pageBlock%>">[이전]</a>	<%}

	for(int i = startPage; i<=endPage; i++ )
	{
		%> <a href="MemberListAction.me?pageNum=<%=i%>">[<%=i%>]</a> <%
	}

	if(endPage>pageCount)
	{	%> <a href="MemberListAction.me?pageNum=<%=startPage+pageBlock%>">[다음]</a>	<%	}

	%></div><!-- //pageCont -->
	<br><br>
	<hr>
	<br><br>
	<div id="sbtn">
	<input type="button" class="in_btn" value="메인이동" onclick="location.href='./Main.me'">
	<input type="button" class="in_btn" value="취소" onclick="location.href='./Main.me'">
	</div>




 



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