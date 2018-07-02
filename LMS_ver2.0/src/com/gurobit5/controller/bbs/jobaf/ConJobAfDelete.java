package com.gurobit5.controller.bbs.jobaf;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurobit5.model.bbs.DaoJobAf;
import com.gurobit5.model.bbs.entity.DtoJobAf;

@WebServlet("/jobaf/delete.bit")
public class ConJobAfDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		int num =Integer.parseInt(req.getParameter("num"));
		
		RequestDispatcher rd =req.getRequestDispatcher("./jobaf_detail.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int num =Integer.parseInt(req.getParameter("num"));
		DaoJobAf daoJobAf =new DaoJobAf();
		daoJobAf.deleteOne(num);
		
		resp.sendRedirect("./jobaf_detail.jsp");
	}
	
}
