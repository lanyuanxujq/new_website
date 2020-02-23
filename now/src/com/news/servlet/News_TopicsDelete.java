package com.news.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.biz.News_TopicsBiz;

public class News_TopicsDelete extends HttpServlet{
public News_TopicsDelete(){
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
	req.setCharacterEncoding("utf-8");
	int tid=Integer.parseInt(req.getParameter("id"));
	News_TopicsBiz control=new News_TopicsBiz();
	boolean result=control.deleteTopic(tid);
	if(result){
		out.print("<script>alert('删除成功!');location.href='topic_list.jsp'</script>");
	}else{
		out.print("<script>alert('删除失败!');location.href='topic_list.jsp'</script>");
	}

}
}
