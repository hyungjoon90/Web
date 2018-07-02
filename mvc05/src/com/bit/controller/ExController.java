package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ExController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String msg="controllerData";
		String msg2="sessionData";
		HttpSession session= req.getSession();
		
		req.setAttribute("msg", msg);
		
		session.setAttribute("msg", msg2);
		
		RequestDispatcher rd=req.getRequestDispatcher("el/el04.jsp");
		rd.forward(req, resp);
	}
}
