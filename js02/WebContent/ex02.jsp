<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결 과</h1>
	<p>
		id:<%=request.getParameter("id") %>
	</p>
	<p>
		pw:<%=request.getParameter("pw") %>
	</p>
</body>
</html>