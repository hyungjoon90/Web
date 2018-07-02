<%@page import="com.bit.model.GuestBean"%>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	
	String msg="java";
	pageContext.setAttribute("msg", msg);
	
	String[] msgs={"java","web","db","framework"};
	pageContext.setAttribute("msgs", msgs);
	
	ArrayList<String> arr=new ArrayList<String>();
	arr.add("item1");
	arr.add("item2");
	arr.add("item3");
	arr.add("item4");
	pageContext.setAttribute("arr", arr);
	
	HashMap<String,String> map =new HashMap<String,String>();
	map.put("item1","value1");
	map.put("item2","value2");
	map.put("item3","value3");
	map.put("item4","value4");
	pageContext.setAttribute("map", map);
	
	GuestBean bean =new GuestBean();
	bean.setSabun(1111);
	bean.setName("admin");
	bean.setNalja(new Date());
	bean.setPay(1000);
	pageContext.setAttribute("bean", bean);
	
	
%>
<body>
	<h1>el표현식의 활용</h1>
	<p>msg=<%=pageContext.getAttribute("msg") %></p>
	<p>msg=${msg }</p>
	<ol>
		<li>msgs[0]=${msgs[0]}</li>
		<li>msgs[1]=${msgs[1]}</li>
		<li>msgs[2]=${msgs[2]}</li>
		<li>msgs[3]=${msgs[3]}</li>
	</ol>
	<ul>
		<li>${arr.get(0) }</li>
		<li>${arr.get(1) }</li>
		<li>${arr.get(2) }</li>
		<li>${arr.get(3) }</li>
	</ul>
	<ol>
		<li>${map}</li>
		<li>${map.item1 }</li>
		<li>${map.item2 }</li>
		<li>${map.item3 }</li>
		<li>${map.item4 }</li>
	</ol>
	<ul>
		<li>${bean.sabun } </li>
		<li>${bean.name } </li>
		<li>${bean.nalja } </li>
		<li>${bean.pay } </li>
	</ul>
</body>
</html>