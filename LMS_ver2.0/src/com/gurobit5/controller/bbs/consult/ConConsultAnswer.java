package com.gurobit5.controller.bbs.consult;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurobit5.model.bbs.DaoConsult;

//2018-05-24 김형준 상담답변입력하는 모델
@WebServlet("/sales/answer.bit")
public class ConConsultAnswer extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String answer = req.getParameter("answer");
		req.setAttribute("answer", answer);
		RequestDispatcher rd =req.getRequestDispatcher("./consult_answer.jsp");
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
		
		resp.sendRedirect("./consult_answer.jsp");
	}
}
