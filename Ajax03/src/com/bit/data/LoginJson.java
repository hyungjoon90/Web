package com.bit.data;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginJson extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String id=req.getParameter("id");
		String pw=req.getParameter("pw");
		String sql="select count(*) form 테이블명 where id=? and pw=?";
		int cnt=0;
		if("admin".equals(id) && "1234".equals(pw)){
			cnt=1;
		}
		String json="{\"login\":[{\"user\":\""+id+"\",\"result\":";
		if(cnt>0){
			json+="true";
		}else{
			json+="false";
		}
		json+= "}]}";
		System.out.println(json);
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter out =resp.getWriter();
		out.print(json);
		out.flush();
	}
}
