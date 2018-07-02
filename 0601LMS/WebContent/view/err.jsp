<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러페이지</title>
</head>
<body>
	<div style="width: 500px; margin: 10px auto;">
		<img style="width: 200px; margin :5px auto; display: block;" src="${rootPath }img/category/error.png"><br/>
		<h2  style="width: 400px; margin :0px auto; display: block; text-align: center;">${err }</h2>
	</div>
</body>
</html>