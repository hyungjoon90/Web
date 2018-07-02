<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>ex04 page</h1>
	<h2>id:<%=request.getParameter("id") %></h2>
	<h2>pw:<%=request.getParameter("pw") %></h2>
</body>
</html>