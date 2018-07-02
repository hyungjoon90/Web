package com.gurobit5.controller.bbs;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurobit5.model.bbs.entity.DtoBbs;

public abstract class ConBBs extends HttpServlet {


	protected HttpServletRequest reqThis;
	protected HttpServletResponse respThis;
	
	public void command(){
		// parameter check 
		// 1. command
		// 2. idx
	}

	private void listRecord(HttpServletRequest req, HttpServletResponse resp){
		
	}
	
	private DtoBbs createRecord(HttpServletRequest req, HttpServletResponse resp ){
		return null;
	} 

	private void readRecord(HttpServletRequest req, HttpServletResponse resp){
		
	} 
	private int updateRecord(HttpServletRequest req, HttpServletResponse resp ){
		return 0;
	} 
	
	private int delRecord(HttpServletRequest req, HttpServletResponse resp){
		return 0;
	} 
	
	private void searchRecord(HttpServletRequest req, HttpServletResponse resp){
		
	}

	
	
	// read list
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doGet(req, resp);
		
		this.reqThis = req;
		this.respThis = resp;
		
		
	}

	// add , mod , del
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		this.reqThis = req;
		this.respThis = resp;
		
		super.doPost(req, resp);
	}
	
	
}
