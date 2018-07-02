package com.gurobit5.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurobit5.model.DaoMember;

@WebServlet("/join.bit")
public class ConJoin extends HttpServlet {
	// 2018-05-25 재환사장님 / 하는중
	// 2018-05-26 김수성 / 일부 수정 : 경로
	
	
	private String goRoot = "./";
	private String viewPath = "view/join/";
	private String urlThis = "/join.bit";
	//private String[] lecMode = {"list", "detail", "add", "edit", "del"};
	//private String[] attendMode = {"list","detail", "add", "edit", "del"};
	

	// my메뉴의 경우 메소드가 곧 클래스 같은놈이라... view 경로가 다를수 있음
	// 그래서 각 comandLecCon 등 안에서 viewPath를 꼭 설정해야됨.
	
	private HttpServletRequest reqThis;
	private HttpServletResponse respThis;
	private RequestDispatcher rd;
	
	private String method_type;
	private String pageid;
	private String modeP;
	
	private String id; // id값

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		RequestDispatcher rd=req.getRequestDispatcher(goRoot+viewPath+"JoinForm.jsp");
		rd.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String id=req.getParameter("id");
		String password=req.getParameter("password");
		String pwchk=req.getParameter("pwchk"); // ?
		String name=req.getParameter("name");
		int both=Integer.parseInt(req.getParameter("both"));
		String email=req.getParameter("email");
		int phone=Integer.parseInt(req.getParameter("phone"));
		
		DaoMember myjoin = null;
		try {
			myjoin = new DaoMember();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		myjoin.insertJoin(id, password, pwchk, name, both, email, phone);
		
		resp.sendRedirect("/");
	}
}
