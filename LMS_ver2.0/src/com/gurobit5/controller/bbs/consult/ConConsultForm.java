package com.gurobit5.controller.bbs.consult;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurobit5.model.bbs.DaoConsult;

//2018-05-24 김형준 상담신청 폼 모델
@WebServlet("/sales/form.bit")
public class ConConsultForm extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		RequestDispatcher rd =req.getRequestDispatcher("./consult_form.jsp");
		rd.forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String title = req.getParameter("title");
		String name = req.getParameter("name");
		String gen = req.getParameter("gen");
		String email = req.getParameter("email");
		String purpose = req.getParameter("purpose");
		String contents= req.getParameter("contents");
		int phone = Integer.parseInt(req.getParameter("phone"));
		
		DaoConsult daoConsult = new DaoConsult();
		daoConsult.insertOne(title, name, gen, email, purpose, contents, phone);
		
		resp.sendRedirect("./consult_form.jsp");
	}
}
