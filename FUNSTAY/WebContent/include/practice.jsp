<%@page import="net.host.db.HostBean"%>
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


if(list.size()!=0){
for(int i=0;i<list.size();i++){
	HostBean hb = (HostBean)list.get(i);
%>
<table>
<tr>
<td>지역명</td>
<td>체크인</td>
<td>체크아웃</td>
<td>이미지</td>
</tr>
<tr>
<td><%=hb.getAddress() %></td>
<td><%=hb.getStart_date() %></td>
<td><%=hb.getEnd_date() %></td>

<td><img src="./upload/<%=hb.getPhoto().split(",")[0]%>" width="50" height="50"></td>
</tr>
</table>
 에 대한 결과를 찾으셨나요?
<%
}
}


else if(rest.size()!=0){
HostBean hbb = (HostBean)rest.get(0);
%>

<p align="center"><%=hbb.getAddress() %>에대한 정보를 찾으셨나요?</p>

<%
for(int i=0;i<rest.size();i++){
	HostBean hb1 = (HostBean)rest.get(i);
%>
<table align="center">
<tr>
<td>지역명</td>
<td>체크인</td>
<td>체크아웃</td>
<td>지역이미지</td>
</tr>
<tr>
<td><%=hb1.getAddress() %></td>
<td><%=hb1.getStart_date() %></td>
<td><%=hb1.getEnd_date() %></td>
<td><img src="./upload/<%=hb1.getPhoto().split(",")[0]%>" width="50" height="50"></td>
</tr>
</table>
<%
}
}

else{
	%><p>못찾았습니다</p><%
}
%>


</body>
</html>