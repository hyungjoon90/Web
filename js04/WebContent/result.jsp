<%@page import="java.util.Enumeration"%>
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
	String sabun =request.getParameter("sabun");
	//String file1 =request.getParameter("file1");
	Enumeration<String> params=request.getParameterNames();
	while(params.hasMoreElements()){
		String name=params.nextElement();
		out.println("<h1>"+request.getParameter(name)+"</h1>");
	}
	%>
</body>
</html>