<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="com.news.biz.News_TopicsBiz,java.util.*" %>
    <%@ page import="com.news.entity.News_Topics" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int tid=Integer.parseInt(request.getParameter("id"));
News_TopicsBiz control=new News_TopicsBiz();
boolean result=control.deleteTopic(tid);
if(result){
	out.print("<script>alert('删除成功!');</script>");
}else{
	out.print("<script>alert('删除失败!');</script>");
}
%>
</body>
</html>