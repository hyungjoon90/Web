<%@page import="com.bit.model.entity.GuestDto"%>
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
	List<GuestDto> list=(List<GuestDto>)request.getAttribute("alist");
%>
<body>
	<h1>비트교육센터</h1>
	<a href="../">HOME</a>
	<a href="list.bit">LIST</a>
	<a href="add.bit">ADD</a>
	<h2>목록 페이지</h2>
	<table>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>날짜</th>
			<th>금액</th>
		</tr>
		<%for(GuestDto bean : list){ %>
		<tr>
			<td><a href="detail.bit?idx=<%=bean.getSabun() %>"><%=bean.getSabun() %></a></td>
			<td><a href="detail.bit?idx=<%=bean.getSabun() %>"><%=bean.getName() %></a></td>
			<td><a href="detail.bit?idx=<%=bean.getSabun() %>"><%=bean.getNalja() %></a></td>
			<td><a href="detail.bit?idx=<%=bean.getSabun() %>"><%=bean.getPay() %></a></td>
		</tr>
		<%} %>
	</table>
	
	
	
</body>
</html>