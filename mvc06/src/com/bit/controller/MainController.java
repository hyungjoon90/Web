package com.bit.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//String msg = getInitParameter("msg");
		ServletContext sc= req.getServletContext();
		Enumeration<String> ipn = sc.getInitParameterNames();
		while(ipn.hasMoreElements()){
			String name=ipn.nextElement();
			String value=sc.getInitParameter(name);
			System.out.println(name+"="+value);
		}
		
		
		RequestDispatcher rd = req.getRequestDispatcher("jsp/main.jsp");
		rd.forward(req, resp);
	}
}
