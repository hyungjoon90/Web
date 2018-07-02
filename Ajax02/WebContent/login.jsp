<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%><%
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="scott";
	String password="tiger";
	String sql="select count(*) as cnt from guest30 where id=? and pw=?";
	Connection conn=null;
	PreparedStatement pstmt=null;
	int result=0;
 	String msg="{\"root\":[{\"id\":\""
		+request.getParameter("id")+"\",\"result\":";
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("id"));
		pstmt.setString(2, request.getParameter("pw"));
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			result=rs.getInt("cnt");
		}
	}finally{
		conn.close();
	}
	if(result>0){msg+="true";}else{msg+="false";}
	msg+="}]}";
	out.print(msg);
%>