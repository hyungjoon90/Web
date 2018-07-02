<%@page import="java.util.ArrayList"%>
<%@page import="com.gurobit5.model.bbs.entity.DtoJobAf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	ArrayList<DtoJobAf> list = (ArrayList<DtoJobAf>)request.getAttribute("jobaf_list");
%>
<body>
	<h1>취업현황게시판</h1>
	<table>
		<tr>
			<th>글번호</th>
			<th>취업자명</th>
			<th>제목</th>
			<th>교육과정</th>
			<th>취업업체명</th>
			<th>취업분야</th>
			<th>등록일</th>
		</tr>
		<%for(DtoJobAf dtoJobAf : list){%>
		<tr>
			<td><%=dtoJobAf.getNum() %></td>
			<td><%=dtoJobAf.getName() %></td>
			<td><a href="detail.bit?num=<%=dtoJobAf.getNum() %>"><%=dtoJobAf.getTitle() %></a></td>
			<td><%=dtoJobAf.getLec_code() %></td>
			<td><%=dtoJobAf.getCompany() %></td>
			<td><%=dtoJobAf.getField() %></td>
			<td><%=dtoJobAf.getNalja() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>