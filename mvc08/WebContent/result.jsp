<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>업로드 결과</h1>
	<p>성공:${result }</p>
	<a href="download.bit?file=${file }&orgin=${filename }">${filename }</a>
</body>
</html>