<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	System.out.println(request.getMethod());
	String id=null;
	String pw=null;
	if(request.getMethod().equals("POST")){
		id=request.getParameter("id");
		pw=request.getParameter("pw");
	}
%>
<body>
	<h1><%=id %>님의 패스워드는 <%=pw %>입니다.</h1>
</body>
</html>