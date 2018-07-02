<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	ul>li{
		height:50px;
		border-bottom: 1px solid  gray;
		list-style: none;
	}
	ul>li:nth-child(1){
		background-color: #cccccc;
	}
	ul>li>span{
		display: inline-block;
	}
	ul>li>span:nth-child(1){
		width:80px;
	}
	ul>li>span:nth-child(2){
		width:200px;
	}
	ul>li>span:nth-child(3){
		width:120px;
	}
	ul>li>span:nth-child(4){
		width:100px;
	}
	
	h1+div>a{
		display: inline-block;
		width:100px;
		height: 50px;
		background-color: red;
		color:white;
		border-radius: 25px;
		text-align: center;
		line-height:50px;
		text-decoration: none;
		margin-left:150px;
	}
	h1+div>a:hover{
		color:yellow;
		line-height: 55px;
	}
</style>
</head>
<body>
	<h1>리스트 페이지</h1>
	<div>
		<ul>
			<li>
				<span>사번</span>
				<span>이름</span>
				<span>날짜</span>
				<span>금액</span>
			</li>
			<%
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="scott";
			String password="tiger";
			String sql="select * from guest02 order by sabun desc";
			Connection conn=null;
			try{
				conn=DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt=conn.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next()){
			%>
			<li>
				<span><%=rs.getInt("sabun") %></span>
				<span><%=rs.getString("name")%></span>
				<span><%=rs.getDate("nalja") %></span>
				<span><%=rs.getInt("pay") %></span>
			</li>
			<%
				}
			}finally{
				conn.close();
			}
			%>
		</ul>
		<a href="add.jsp">입 력</a>
	</div>
</body>
</html>