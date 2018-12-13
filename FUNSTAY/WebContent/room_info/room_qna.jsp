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

</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	List QnAList = (List) request.getAttribute("QnAList");
	int count1 = ((Integer) request.getAttribute("count1")).intValue();
	String pageNum = (String) request.getAttribute("pageNum");
	int pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	QnaBean qa = (QnaBean) request.getAttribute("qa");
	int num = ((Integer) request.getAttribute("num")).intValue();
	 %>

<a name="QnA"><h1>QnA <%=count1%>개 </h1></a>

<button class="button button1"
			 onclick="location.href='ReviewWrite.bk?num=<%=num%>&pageNum=<%=pageNum%>'">후기쓰기</button>
	<div id="room_review">
	
	

	<%
			for (int i = 0; i < QnAList.size(); i++) {
				QnaBean qn = (QnaBean) QnAList.get(i);
	%>
  
<table border="1" align="center">
	<tr>
	<th>Content</th> 
	<th colspan="3"> 
	<%=qn.getContent() %>
	</th>  
	</tr>
	<tr>
	<th><img src="./img/user.png" alt="img02" width="50px" height="50px"></th>
	<th> <%=qn.getHome_num()%></th>
   	<th colspan="2"><%=qn.getSubject() %></th> 
    <tr><th colspan="5"><%=qn.getMember_email() %></th></tr>
    <tr><th>QnA_num</th><th colspan="4"><%=qn.getQnA_num()%></th></tr>
    <tr><th>QnA_pass</th><th colspan="4"><%=qn.getQnA_pass()%></th></tr>
</table> 
		<% 
			}   
		%>  

<%
		if (count1 != 0) {
			//전체 페이지수 구하기 게시판 
			//글 50개 한화면에 보여줄 글개수 10개일경우 => 전체 5 페이지
			//글 56개 한화면에 보여줄 글개수 10개일경우 => 전체 6 페이지
			int pageCount = count1 / pageSize + (count1 % pageSize == 0 ? 0 : 1);
			//한 화면에 보여줄 페이지 번호 개수
			int pageBlock = 10;
			//시작페이지 번호 1~10 => 1    11~20 => 11   21~30 => 21
			int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
			//		1		  = ((     2          - 1)/pageBlock)*pageBlock+1;
			//		1		  = ((     9          - 1)/pageBlock)*pageBlock+1;
			//		11		  = ((     12          - 1)/pageBlock)*pageBlock+1;
			//		11		  = ((     19          - 1)/pageBlock)*pageBlock+1;
			//끝페이지 번호
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			//이전
			if (startPage > pageBlock) {
	%><a href="./QnAList.qn?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	<%
		}
			// 1~10
			for (int i = startPage; i <= endPage; i++) {
	%><a href="./QnAList.qn?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			//다음
			if (endPage < pageCount) {
	%><a href="./QnAList.qn?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
		}

		}
	%>

</div>
 
 



</body>
</html>