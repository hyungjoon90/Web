package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.GuestDao;
import com.bit.model.GuestDto;

public class EditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String param = req.getParameter("idx");
		int sabun=0;
		try{
			sabun=Integer.parseInt(param);
		}catch(NumberFormatException e){
			resp.sendRedirect("list.bit");
			return;
		}
		
		GuestDao dao =new GuestDao();
		GuestDto bean= dao.selectOne(sabun);
		
		req.setAttribute("bean", bean);
		RequestDispatcher rd=req.getRequestDispatcher("edit.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String[] params=new String[3];
		params[0]=req.getParameter("sabun");
		params[1]=req.getParameter("name");
		params[2]=req.getParameter("pay");
		int sabun=0;
		String name=null;
		int pay=0;
		try{
			sabun=Integer.parseInt(params[0].trim());	
			name=params[1].trim();
			pay=Integer.parseInt(params[2].trim());
		}catch(NumberFormatException e){
			resp.sendRedirect("edit.bit?idx="+sabun);
		}
		GuestDao dao=new GuestDao();
		int result=dao.updateOne(sabun,name,pay);
		if(result>0)resp.sendRedirect("detail.bit?idx="+sabun);
		else resp.sendRedirect("edit.bit?idx="+sabun);
	}
}
