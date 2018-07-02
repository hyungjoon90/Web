package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.GuestDao;
import com.bit.model.entity.GuestDto;

@WebServlet("/guest/detail.bit")
public class DetailController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String idx=req.getParameter("idx");
		int sabun=Integer.parseInt(idx);
		
		GuestDao dao = new GuestDao();
		try{
			
			GuestDto dto=dao.selectOne(sabun);
			req.setAttribute("bean", dto);
		}catch(SQLException e){}
		
		RequestDispatcher rd = req.getRequestDispatcher("../detail.jsp");
		rd.forward(req, resp);
	}
}
