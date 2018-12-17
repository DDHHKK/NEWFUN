<%@page import="net.search.db.SearchBean"%>
<%@page import="net.review.db.ReviewBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
<%
	request.setCharacterEncoding("UTF-8");

	List ReviewList = (List) request.getAttribute("boardList");
	int count = ((Integer) request.getAttribute("count")).intValue();
	String pageNum = (String) request.getAttribute("pageNum");
	int pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	SearchBean sc = (SearchBean) request.getAttribute("sc");
	int num = ((Integer) request.getAttribute("num")).intValue();
%>


<a name="후기"><h1>후기 <%=count%>개 </h1></a>
	<button class="button_sg button1_sg"
			 onclick="location.href='ReviewWrite.bk?num=<%=num%>&pageNum=<%=pageNum%>'">후기쓰기</button>
	<div id="room_review">
	
	

	<%
			for (int i = 0; i < ReviewList.size(); i++) {
				ReviewBean re = (ReviewBean) ReviewList.get(i);
	%>
  
<table border="1" align="center">
	<tr>
	<th>평점</th> 
	<th colspan="3"> 
	<span class="star-prototype"><%=re.getStar() %></span>  
	</th>  
	</tr>
	<tr>
	<th><img src="./img/user.png" alt="img02" width="50px" height="50px"></th>
	<th> <%=re.getReview_date() %></th>
   	<th colspan="2"><%=re.getMember_email() %></th> 
    <tr><th colspan="5"><%=re.getContent() %></th></tr>
    <tr><th>만족도</th><th colspan="4"><span class="star-prototype"><%=re.getSatisfaction() %></span></th></tr>
    <tr><th>청결함</th><th colspan="4"><span class="star-prototype"><%=re.getClean() %></span></th></tr>
	<tr><th>교통접근성</th><th colspan="4"><span class="star-prototype"><%=re.getAccess()%></span></th></tr>
</table> 
		<script type="text/javascript"> 
				$.fn.generateStars = function() {
  			  return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
			};

			// 숫자 평점을 별로 변환하도록 호출하는 함수
			$('.star-prototype').generateStars();
		</script>
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