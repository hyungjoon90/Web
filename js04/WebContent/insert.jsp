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
	<%
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="scott";
	String password="tiger";
	String sql="insert into guest02 values(guest02_seq.nextval,?,sysdate,?)";
	
	Connection conn=null;
	int result=0;
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setInt(2, Integer.parseInt(request.getParameter("pay")));
		result=pstmt.executeUpdate();
	}finally{
		conn.close();
	}
	%>
		<script type="text/javascript">
	<%if(result>0){%>
			window.location.replace("list.jsp");
	<%}else{%>
			windoe.history.back();
	<%}%>
		</script>
</head>
<body>
</body>
</html>