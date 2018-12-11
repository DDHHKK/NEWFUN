<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List list = (List)session.getAttribute("list");
List rest = (List)session.getAttribute("rest");
if(list.size()==0 && rest.size()==0){
	%>
	
	<P>검색된 내용을 찾지 못하였습니다.</P>
	<% 
	

}

if(list.size()!=0){
for(int i=0;i<list.size();i++){
	MemberBean mb = (MemberBean)list.get(i);
%>
<table>
<tr>
<td>지역명</td>
<td>성인인원수</td>
<td>어린이인원수</td>
<td>체크인</td>
<td>지역이미지</td>
</tr>
<tr>
<td><%=mb.getSearch_info() %></td>
<td><%=mb.getText11() %></td>
<td><%=mb.getText12() %></td>
<td><%=mb.getDate_a() %></td>
<td><img src="./upload/<%=mb.getImage().split(",")[0]%>" width="50" height="50"></td>
</tr>
</table>
에 대한 결과를 찾으셨나요?
<%
}
}


else{
MemberBean mbb = (MemberBean)rest.get(0);
%>

<p align="center"><%=mbb.getSearch_info() %>에대한 정보를 찾으셨나요?</p>

<%
for(int i=0;i<rest.size();i++){
	MemberBean mb1 = (MemberBean)rest.get(i);
%>
<table align="center">
<tr>
<td>지역명</td>
<td>성인인원수</td>
<td>어린이인원수</td>
<td>지역이미지</td>
</tr>
<tr>
<td><%=mb1.getSearch_info() %></td>
<td><%=mb1.getText11() %></td>
<td><%=mb1.getText12() %></td>
<td><img src="./upload/<%=mb1.getImage().split(",")[0]%>" width="50" height="50"></td>
</tr>
</table>
<%
}
}

%>


</body>
</html>