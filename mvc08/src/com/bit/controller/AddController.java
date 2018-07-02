package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/guest/add.bit")
public class AddController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		RequestDispatcher rd = req.getRequestDispatcher("../add.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
//		<form method="post" enctype="multipart/form-data">
		String path=req.getRealPath("/upload");
		int fsize=1024*1024*2;//2M=2*1024Kbyte=2*1024*1024byte
		System.out.println(path);
		DefaultFileRenamePolicy dfnp = new DefaultFileRenamePolicy();
		MultipartRequest mreq = new MultipartRequest(req,path,fsize,"UTF-8",dfnp);
		String pay=mreq.getParameter("pay");
		String name=mreq.getFilesystemName("name");
		String fname=mreq.getOriginalFileName("name");
		
		System.out.println(name);
		req.setAttribute("result", true);
		req.setAttribute("file", name);
		req.setAttribute("filename", fname);
		
		RequestDispatcher rd = req.getRequestDispatcher("../result.jsp");
		rd.forward(req, resp);
	}
}