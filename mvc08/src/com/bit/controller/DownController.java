package com.bit.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/guest/download.bit")
public class DownController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String path=req.getRealPath("/upload");
		String file=req.getParameter("file");
		String orgin=req.getParameter("orgin");
		
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Disposition", "attachment;filename="+orgin+";");
		File f=new File(path+"\\"+file);
		FileInputStream fis=null;
		BufferedInputStream bis=null;
		ServletOutputStream out=null;
		try{
			fis= new FileInputStream(f);
			bis= new BufferedInputStream(fis);
			out= resp.getOutputStream();
			byte[] buf=new byte[1024];
			int cnt=0;
			while((cnt = bis.read(buf, 0, buf.length))>0){
				System.out.println(cnt);
				out.write(buf, 0, cnt);
			}
			out.flush();
		}finally{
			bis.close();
			fis.close();
			out.close();
		}
	}
}