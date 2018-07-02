package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.GuestDao;
import com.bit.model.GuestDto;

@WebServlet("/guest/list.bit")
public class ListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		GuestDao dao =new GuestDao(req);
		
		ArrayList<GuestDto> list = dao.selectAll();
		
		req.setAttribute("alist", list);
		
		RequestDispatcher rd =req.getRequestDispatcher("../jstl/list.jsp");
		rd.forward(req, resp);
	
	}
}
