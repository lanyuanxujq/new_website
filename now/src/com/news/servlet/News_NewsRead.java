package com.news.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class News_NewsRead extends HttpServlet{
public News_NewsRead(){
	super();
}
public void destroy(){
	super.destroy();
}
public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
	doPost(req,res);
}
public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
	res.setContentType("text/html");
	req.setCharacterEncoding("utf-8");
	res.setCharacterEncoding("utf-8");
	PrintWriter out = res.getWriter();
	

}
}
