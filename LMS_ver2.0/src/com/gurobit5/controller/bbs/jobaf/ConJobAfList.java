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

@WebServlet("/jobaf/list.bit")
public class ConJobAfList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		DaoJobAf daoJobAf =new DaoJobAf();
		List<DtoJobAf> list =null;
		list=daoJobAf.selectList();
		req.setAttribute("jobaf_list", list);
		
		RequestDispatcher rd =req.getRequestDispatcher("./jobaf_list.jsp");
		rd.forward(req, resp);
	}

	
}
