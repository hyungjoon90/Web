<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글 목록 페이지(JSTL)</h1>
	<a href="../">HOME</a>
	<a href="./list.bit">글목록</a>
	<a href="./add.bit">글쓰기</a>
	<table>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>날짜</th>
			<th>금액</th>
		</tr>
		<c:forEach items="${requestScope.alist }" var="bean">
		<tr>
			<td><a href="detail.bit?idx=${bean.sabun}">${bean.sabun }</a></td>
			<td><a href="detail.bit?idx=${bean.sabun}">${bean.name }</a></td>
			<td><a href="detail.bit?idx=${bean.sabun}">${bean.nalja }</a></td>
			<td><a href="detail.bit?idx=${bean.sabun}">${bean.pay }</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>