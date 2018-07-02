package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.GuestDao;
import com.bit.model.GuestDto;

public class OneController extends HttpServlet{
	//detail.bit
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String idx = req.getParameter("idx");
		
		//무결성 검증
		int sabun;
		try{
			sabun=Integer.parseInt(idx);
		}catch(NumberFormatException e){
			return;
		}
		GuestDao dao =new GuestDao();
		GuestDto bean=dao.selectOne(sabun);
		
		req.setAttribute("dto", bean);
		
		//view 위임
		RequestDispatcher rd= req.getRequestDispatcher("detail.jsp");
		rd.forward(req, resp);
	}
}
