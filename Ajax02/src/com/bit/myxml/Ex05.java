package com.bit.myxml;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex05 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		URL url=new URL("http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109");
		InputStream is = null;
		InputStreamReader isr = null;
		BufferedReader br =null;
		String msg = "";
		String result="";
		
		try{
			is = url.openStream();
			isr = new InputStreamReader(is,"UTF-8");
			br= new BufferedReader(isr);
			while((msg=br.readLine())!=null){
				result+=msg;
				result+="\n";
			}
		}finally{
			br.close();
			isr.close();
			is.close();
		}
		System.out.println(result);
		resp.setContentType("application/xml; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(result);
	}
}
