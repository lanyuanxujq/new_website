package com.news.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.biz.News_TopicsBiz;
import com.news.entity.News_Topics;

public class News_TopicsServlet extends HttpServlet{
public News_TopicsServlet(){
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
	String tname=req.getParameter("tname");
	News_TopicsBiz biz=new News_TopicsBiz();
	News_Topics topic=new News_Topics();
	topic.setTname(tname);
	int result=biz.addTopic(topic);
	if(result==0){out.print("<script>alert('添加失败，主题已经存在！');location.href='topic_add.jsp'</script>;");
	}else if(result==-1){
	out.print("<script>alert('添加失败！');location.href='topic_add.jsp'</script>;");	
	}else{
		out.print("<script>alert('添加成功！');location.href='topic_add.jsp'</script>;");	
	}
}
public void init() throws ServletException{
	
}
}
