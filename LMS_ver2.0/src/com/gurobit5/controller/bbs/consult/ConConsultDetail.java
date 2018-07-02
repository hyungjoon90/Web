package com.gurobit5.controller.bbs.consult;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurobit5.model.bbs.DaoConsult;
import com.gurobit5.model.bbs.entity.DtoConsult;

//2018-05-24 김형준 상세페이지불러오는 모델
@WebServlet("/sales/detail.bit")
public class ConConsultDetail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String idx = req.getParameter("idx");
		int num =Integer.parseInt(idx);
		
		String answer = req.getParameter("answer");
		
		DtoConsult dtoConsult =null;
		DaoConsult daoConsult = new DaoConsult();
		dtoConsult = daoConsult.selectOne(num);
		
		req.setAttribute("dtoConsult", dtoConsult);
		
		RequestDispatcher rd = req.getRequestDispatcher("./consult_detail.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String answer = req.getParameter("answer");
		
		resp.sendRedirect("./consult_detail.jsp");
	}
}
