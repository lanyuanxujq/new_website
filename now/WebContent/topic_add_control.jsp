<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.news.biz.News_TopicsBiz" %>
<%@ page import="com.news.entity.News_Topics" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%!News_Topics topic=new News_Topics();
News_TopicsBiz control=new News_TopicsBiz();
public boolean getTopicByName(String title){
	topic.setTname(title);
	return control.findTopic(topic);
}
public int insertTopic(String title){	
	topic.setTname(title);	
	return control.addTopic(topic);
}
%>
<%
request.setCharacterEncoding("utf-8");
String title=request.getParameter("tname");
if(!(getTopicByName(title))){
int line=insertTopic(title);
String message = line>0?"新增主题成功":"新增主题失败";
out.print("<script>alert('"+message+"');location.href='topic_add.jsp'</script>");}
out.print("<script>alert('主题名已经存在');location.href='topic_add.jsp'</script>");
%>
</body>
</html>