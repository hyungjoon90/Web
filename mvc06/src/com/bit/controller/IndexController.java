package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		urlPatterns = { "/index.bit","/index.html" }, 
		initParams = { 
				@WebInitParam(name = "msg", value = "abcd1234")
		})
public class IndexController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg=getInitParameter("msg");
		System.out.println(msg);
		RequestDispatcher rd=request.getRequestDispatcher("jsp/main.jsp");
		rd.forward(request, response);
	}

}
