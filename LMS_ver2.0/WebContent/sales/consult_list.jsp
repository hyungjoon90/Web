<%@page import="java.util.ArrayList"%>
<%@page import="com.gurobit5.model.bbs.entity.DtoConsult"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	ArrayList<DtoConsult> list = (ArrayList<DtoConsult>)request.getAttribute("consult_List");
%>
<body>
	<h1>상담게시판</h1>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>신청자</th>
			<th>등록일</th>
		</tr>
		<%for(DtoConsult dtoConsult : list){%>
		<tr>
			<td><%=dtoConsult.getNum() %></td>
			<td><a href="detail.bit?idx=<%=dtoConsult.getNum() %>"><%=dtoConsult.getTitle() %></a></td>
			<td><%=dtoConsult.getName() %></td>
			<td><%=dtoConsult.getNalja() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>