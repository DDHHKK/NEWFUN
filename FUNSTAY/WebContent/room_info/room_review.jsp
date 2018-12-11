<%@page import="net.review.db.ReviewBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		
<%
	request.setCharacterEncoding("UTF-8");

	List ReviewList = (List) request.getAttribute("boardList");
	int count = ((Integer) request.getAttribute("count")).intValue();
	String pageNum = (String) request.getAttribute("pageNum");
	int pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
%>


<a name="후기"><h1>후기 <%=count%>개(평균 평점 ★★★★★) </h1></a>
	<a href="./ReviewWrite.bk"><h2 align="right">후기쓰기</h2></a>
	<div id="room_review">
	
	
	<%
			for (int i = 0; i < ReviewList.size(); i++) {
				ReviewBean re = (ReviewBean) ReviewList.get(i);
	%>

<table id="" border="1">
	<tr><th class="" rowspan="4"><img src="./img/user.png" alt="img02"></th>
	<th class=""><%=re.getPayment_num() %></th>
   	<th class=""><%=re.getMember_email() %></th>
   	<th class=""><%=re.getHome_num() %></th>
    <tr><th  class="" colspan="3"><%=re.getContent() %></th></tr>
    <tr><th  class="" colspan="3"><%=re.getAccess()%></th></tr>
    <tr><th class="" colspan="3"><%=re.getClean() %></th></tr>  
    <tr><th class="" colspan="3"><%=re.getSatisfaction() %></th></tr>  
</table>

		
		<%
			}
		%>  

<%
		if (count != 0) {
			//전체 페이지수 구하기 게시판 
			//글 50개 한화면에 보여줄 글개수 10개일경우 => 전체 5 페이지
			//글 56개 한화면에 보여줄 글개수 10개일경우 => 전체 6 페이지
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
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
	%><a href="./ReviewList.re?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	<%
		}
			// 1~10
			for (int i = startPage; i <= endPage; i++) {
	%><a href="./ReviewList.re?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			//다음
			if (endPage < pageCount) {
	%><a href="./ReviewList.re?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
		}

		}
	%>

</div>

	
	
	
	
	
	

</body>


</html>