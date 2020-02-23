package com.news.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.biz.News_UsersBiz;
import com.news.entity.News_Users;

public class News_UsersServlet extends HttpServlet{
public News_UsersServlet(){
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
	String uname = req.getParameter("uname");
	String upwd = req.getParameter("upwd");
	//调用业务逻辑层的方法，判断用户名和密码是否在数据库中存在
	News_UsersBiz biz = new News_UsersBiz();
	boolean result = biz.login(uname,upwd);
	if(result){
		req.getSession().setAttribute("uname",uname);
		res.sendRedirect("index.jsp");// ../表示返回上一层
	}else{
		out.println("<script>alert('用户名或密码有误！');location.href='index.jsp'</script>");
	}
	out.flush();
	out.close();
}
public void init() throws ServletException {
	// Put your code here
}
}
