package com.gurobit5.controller.bbs.jobaf;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gurobit5.model.bbs.DaoJobAf;
import com.gurobit5.model.bbs.entity.DtoJobAf;

@WebServlet("/jobaf/form.bit")
public class ConJobAfForm extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		int num =Integer.parseInt(req.getParameter("num"));
		
		DtoJobAf dtoJobAf =null;
		DaoJobAf daoJobAf =new DaoJobAf();
		dtoJobAf=daoJobAf.selectOne(num);
		req.setAttribute("dtoJobAf", dtoJobAf);
		
		RequestDispatcher rd =req.getRequestDispatcher("./jobaf_form.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		if(id==null){id="id";}
		
		String company=req.getParameter("company");
		int lec_code=Integer.parseInt(req.getParameter("lec_code"));
		String title=req.getParameter("title");
		String name=req.getParameter("name");
		String field=req.getParameter("field");
		String contents=req.getParameter("contents");
		
		DaoJobAf daoJobAf=new DaoJobAf();
		daoJobAf.insertOne(name, company, lec_code, title, field, contents, id);
		
		
		resp.sendRedirect("./jobaf_form.jsp");
	}
	
}
