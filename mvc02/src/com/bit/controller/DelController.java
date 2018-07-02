package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.GuestDao;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class DelController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String param=req.getParameter("idx");
		int sabun=Integer.parseInt(param);
		
		GuestDao dao=new GuestDao();
		dao.deleteOne(sabun);
		
	}
}
