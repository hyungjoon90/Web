package com.gurobit5.controller.bbs.consult;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurobit5.model.bbs.DaoConsult;
import com.gurobit5.model.bbs.entity.DtoConsult;

//2018-05-24 김형준 리스트불러오는 모델
@WebServlet("/sales/list.bit")
public class ConConsultList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		DaoConsult daoConsult =new DaoConsult();
		List<DtoConsult> list=null;
		list = daoConsult.selectAll();
		req.setAttribute("consult_List", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("./consult_list.jsp");
		rd.forward(req, resp);
	}
	
	
}
