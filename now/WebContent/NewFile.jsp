<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ page import="com.news.biz.News_TopicsBiz,java.util.*" %>
    <%@ page import="com.news.entity.News_Topics" %>
     <%@ page import="com.news.biz.News_NewsBiz" %>
    <%@ page import="com.news.entity.News_News" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%!News_NewsBiz controln=new News_NewsBiz();
%>
 <%

int pagesize=5;
int pagenum;
int curpage=1;
int ntid=1;
pagenum=controln.getPageNum(pagesize, ntid);
if(request.getParameter("curPagepost")!=null){curpage=Integer.parseInt(request.getParameter("curPagepost"));}
if(curpage<1){curpage=1;}else if(curpage>pagenum){curpage=pagenum;}
List<News_News> alnn=new ArrayList<News_News>();
alnn=controln.getPage(pagesize, ntid, curpage);
for(News_News news:alnn){
%>      	
<li><a href="news_read.jsp?nid=<%=news.getNid()%>"> <%= news.getNtitle()%> </a>
      		<span> <%=news.getNcreatedate() %></span></li>
    <%} %>  
<p align="right"> 当前页数:[1/1]&nbsp;&nbsp; <a href="#">首页</a><a href="#">&nbsp;&nbsp;上一页</a><a href="#">&nbsp;&nbsp;下一页</a> <a href="#">&nbsp;&nbsp;末页</a></p>    	
   
</body>
</html>