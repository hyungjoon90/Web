package com.gurobit5.controller.bbs.consult;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurobit5.model.bbs.DaoConsult;

//2018-05-24 김형준 게시글삭제 모델
@WebServlet("/sales/delete.bit")
public class ConConsultDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(req.getParameter("num"));

		RequestDispatcher rd =req.getRequestDispatcher("./consult_delete.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(req.getParameter("num"));
		DaoConsult daoConsult = new DaoConsult();
		daoConsult.deleteOne(num);
		
		resp.sendRedirect("./consult_delete.jsp");
	}
}
