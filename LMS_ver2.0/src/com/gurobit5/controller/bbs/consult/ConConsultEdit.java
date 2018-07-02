package com.gurobit5.controller.bbs.consult;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurobit5.model.bbs.DaoConsult;

//2018-05-24 김형준 상담답변수정 모델(아직 미완성 기존 상담내역을 못불러옴.)
@WebServlet("/sales/edit.bit")
public class ConConsultEdit extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		RequestDispatcher rd =req.getRequestDispatcher("./consult_edit.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String answer =req.getParameter("answer");
		int num = Integer.parseInt(req.getParameter("num"));
		DaoConsult daoConsult = new DaoConsult();
		daoConsult.answer(answer, num);
		
		resp.sendRedirect("./consult_edit.jsp");
	}
}
