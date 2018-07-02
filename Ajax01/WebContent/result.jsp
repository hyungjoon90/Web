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
</head>
<body>
	<%
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String sql="select count(*) as cnt from guest30 where id=? and pw=?";
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		int result=0;
	
		Connection conn=null;
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs= pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt("cnt");
			}
		}finally{
			conn.close();
		}
	%>
	<%if(result>0){%>
		<h1><%=id %>님 환영합니다.</h1>
	<%}else{ %>
		<h1>로그인 실패</h1>
	<%} %>
</body>
</html>