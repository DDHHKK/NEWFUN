<%@page import="net.member.db.QnaBean"%>
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
<script src="./js/default/jquery-3.3.1.js"></script>
<!-- 페이지 default 링크 끝-->

<link href="./css/mypage/QnAcheck.css" rel="stylesheet">

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


<h1>문의 확인</h1>


<div class="QnAcheckList_sg">
	<table class="QnAcheck_table_sg" border="1">
	<!-- <tr>
		<td class="qnaheadtd_sg">번호</td>
		<td class="qnaheadtd_sg">제목</td>
		<td class="qnaheadtd_sg">등록일</td>
		<td class="qnaheadtd_sg">답변여부</td>
	</tr> -->
<%
List<QnaBean> q_list = (List)request.getAttribute("q_list");
for(int i=0;i<q_list.size();i++){
	QnaBean qb = (QnaBean)q_list.get(i);
	if(i==0 || i%2==0){%>
		<tr>
			<td>번호</td><td><%=qb.getQnA_num() %></td>
			<td>등록일</td><td><%=qb.getQnA_date() %></td>
			<td>답변여부</td><td>
				<%if(qb.getRe_seq()==1){%>답변완료
				<%}else{%>답변중<%}%>
				</td>
		</tr>
		<tr>
			<td>제목</td><td class="qnaopensub" colspan="5"><%=qb.getSubject() %></td>
		</tr>
		<tr>
			<td>룸정보</td><td colspan="5"><a href="#"><%=qb.getHome_subject() %></a></td>
		</tr>
	<%}if(i%2==1){%>
		<tr><td colspan="6">문의에 대한 답변</td></tr>
	<%} %>
	
	<tr class="qnacontent"><td colspan="6"><%=qb.getContent() %></td></tr>
<%} %>
	</table>
	<input type="button" value="목록" onclick='location.href="./MemberQNAlist.me"'>
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