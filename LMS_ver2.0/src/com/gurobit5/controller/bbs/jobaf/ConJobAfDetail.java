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

@WebServlet("/jobaf/detail.bit")
public class ConJobAfDetail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		int num =Integer.parseInt(req.getParameter("num"));
		
		DtoJobAf dtoJobAf =null;
		DaoJobAf daoJobAf =new DaoJobAf();
		dtoJobAf=daoJobAf.selectOne(num);
		req.setAttribute("dtoJobAf", dtoJobAf);
		
		RequestDispatcher rd =req.getRequestDispatcher("./jobaf_detail.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int num =Integer.parseInt(req.getParameter("num"));
		
		resp.sendRedirect("./jobaf_detail.jsp");
	}
	
}
