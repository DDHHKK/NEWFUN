<%@page import="net.member.db.QnaBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<button class="button"
			 onclick="location.href='Qna_boardWrite.sc?num=<%=num%>&pageNum=<%=pageNum%><%-- &room_subject=<%=room_subject %> --%>'" style="background-color:white;color:gray;float:right;font-weight:bold;border:1px solid gray;">호스트에게 문의하기</button>

	<div id="room_qna">
	<% for (int i = 0; i < QnAList.size(); i++) {
		QnaBean qn = (QnaBean) QnAList.get(i);
	%>
		<button class="accordion_sg">
	
			<table>
				<tr>
					<td style="width:500px;"><%=qn.getSubject() %></td><td style="width:200px;"><%=qn.getMember_email() %></td><td style="width:200px;">등록 날짜표시</td><td style="width:200px;">답변여부표시</td>
				</tr>
			</table>
		</button>
		<div class="panel_sg">
  			<p>
  				<img src="./img/user.png" alt="img02" width="50px" height="50px">
				<%=qn.getSubject() %>
				<hr>
				답글이 있다면 출력하기
  			</p>
		</div>

	<% } %>
		<div style="text-align: center;">
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
</div>

<script>
var acc = document.getElementsByClassName("accordion_sg");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>
