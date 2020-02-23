<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
     <%@ page import="com.news.biz.News_TopicsBiz,java.util.*" %>
    <%@ page import="com.news.entity.News_Topics" %>
     <%@ page import="com.news.biz.News_NewsBiz" %>
    <%@ page import="com.news.entity.News_News" %>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<title>新闻中国</title>
	
	<link href="index_files/main(1).css" rel="stylesheet" type="text/css"/>
	<script language="javascript">
		function check(){			
			return true;
		}
		
		
	</script>
</head>
<body>
<div id="header">
	<div id="top_login">
	<%
	String username=null;
	String userpass=null;
	Cookie[] cookies=request.getCookies();
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("uname")){
				username=cookies[i].getValue();
			}
			if(cookies[i].getName().equals("upwd")){
				userpass=cookies[i].getValue();
			}
		}
	}
	%>
	<% 
	if(session.getAttribute("uname")==null){
	//if(request.getParameter("uname")==null){
	%>
		<form action="logintestcontrol" method="post" onsubmit="return check()">
			用户名：<input id="uname" name="uname" class="login_input" type="text" value="<%=username==null?"":username%>"/>
			<label> 密&nbsp;&nbsp;码 </label>
			<input id="upwd" name="upwd" value="<%=userpass==null?"":userpass %>" class="login_input" type="password"/>
			<input class="login_sub" value="登录" type="submit"/>
			<label id="error"> </label>
			<img src="index_files/friend_logo.gif" alt="Google" id="friend_logo"/>
		</form>
	<% }else{%>
		欢迎你，<%=(String)session.getAttribute("uname") %> | <a href="#">登录控制台</a> | <a href="#">登出</a>
	<% }%>	
  </div>
  <div id="nav">
    <div id="logo"> <img src="index_files/logo.jpg" alt="新闻中国"/> </div>
    <div id="a_b01"> <img src="index_files/a_b01.gif" alt=""/> </div>
    <!--mainnav end-->
  </div>
</div>
<div id="container">
<div class="sidebar">
    <h1> <img src="index_files/title_1.gif" alt="国内新闻"/> </h1>
    <div class="side_list">
      <ul>
      	
<%!
News_NewsBiz controln=new News_NewsBiz();
%>      	
<%
List<News_News> aln=new ArrayList<News_News>();
aln=controln.getLastlyNewss(1);
for(int i=0;i<3;i++){
	News_News n=new News_News();
	n=aln.get(i);%>
     <li> <a href="#"><b><%=n.getNtitle()%></b></a> </li> 		
  <%} %>    	
      	
      </ul>
    </div>
    <h1> <img src="index_files/title_2.gif" alt="国际新闻"/> </h1>
    <div class="side_list">
      <ul>
      	
      	
     		<%
//List<News_News> aln=new ArrayList<News_News>();
aln=controln.getLastlyNewss(2);
for(int i=0;i<3;i++){
	News_News n=new News_News();
	n=aln.get(i);%>
     <li> <a href="#"><b><%=n.getNtitle()%></b></a> </li> 		
  <%} %>    	
      	
      </ul>
    </div>
    <h1> <img src="index_files/title_3.gif" alt="娱乐新闻"/> </h1>
    <div class="side_list">
      <ul>
      	
      	
     		     		<%
//List<News_News> aln=new ArrayList<News_News>();
aln=controln.getLastlyNewss(5);
for(int i=0;i<3;i++){
	News_News n=new News_News();
	n=aln.get(i);%>
     <li> <a href="#"><b><%=n.getNtitle()%></b></a> </li> 		
  <%} %>    	
      	
      </ul>
    </div>
  </div>


  <div class="main">
    <div class="class_type"> <img src="index_files/class_type.gif" alt="新闻中心"/> </div>
    <div class="content">
      <ul class="class_date">
      	<li id="class_month">

<%News_TopicsBiz control=new News_TopicsBiz();
List<News_Topics> al=new ArrayList<News_Topics>();
al=control.getAllTopics();
pageContext.setAttribute("al",al);
%>
<c:forEach var="t" items="${al}" begin="0" end="${al.size()}">
<c:out escapeXml="Y" value="<a href='indextwo.jsp?ntid=${t.tid}'><b>${t.tname}</b></a>"></c:out>
</c:forEach>



      </li></ul>

      	

      <ul class="classlist">

<%--       	<%!News_NewsBiz controln=new News_NewsBiz();
%>
<%
//List<News_News> aln=new ArrayList<News_News>();
aln=controln.getAllNewss();
for(int i=0;i<aln.size();i++){
	News_News n=new News_News();
	n=aln.get(i);%>
      		<li><a href="news_read.jsp?nid=<%=n.getNid()%>"> <%= n.getNtitle()%> </a>
      		<span> <%=n.getNcreatedate() %></span></li>
  <%} %>
  <p align="right"> 当前页数:[1/1]&nbsp;&nbsp; <a href="#">首页</a><a href="#">&nbsp;&nbsp;上一页</a><a href="#">&nbsp;&nbsp;下一页</a> <a href="#">&nbsp;&nbsp;末页</a></p>    	
--%>      		
 
 <%

int pagesize=5;
int pagenum;
int curpage=1;
int ntid=1;
if(request.getParameter("ntid")!=null){ntid=Integer.parseInt(request.getParameter("ntid"));}
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
 
 <p align="right"> 当前页数:[<%=curpage %>/<%=pagenum %>]&nbsp;
     </a> <a href="index.jsp?curPagepost=1">首页</a> 
     <% if(curpage==1){ %>
    <a href="index.jsp?curPagepost=<%=curpage-1 %>" style="color:gray" onclick="return false">上一页</a>&nbsp;&nbsp;     
     <% }else{ %>
     <a href="index.jsp?curPagepost=<%=curpage-1 %>">上一页</a>&nbsp;&nbsp;
     <% } %>
     <% if(curpage==pagenum){ %>
     <a href="index.jsp?curPagepost=<%=curpage+1 %>" style="color:gray" onclick="return false">下一页</a>&nbsp;&nbsp;
     <% }else{ %>
     <a href="index.jsp?curPagepost=<%=curpage+1 %>">下一页</a>&nbsp;&nbsp;
     <% } %>
     <a href="index.jsp?curPagepost=<%=pagenum %>">末页</a> </p>
     
      	
      		
      		
       </ul>
    </div>
    <div class="picnews">
  <ul>
    <li> <a href="#"><img src="index_files/Picture1.jpg" alt="" width="249"/> </a><a href="#">幻想中穿越时空</a> </li>
    <li> <a href="#"><img src="index_files/Picture2.jpg" alt="" width="249"/> </a><a href="#">国庆多变的发型</a> </li>
    <li> <a href="#"><img src="index_files/Picture3.jpg" alt="" width="249"/> </a><a href="#">新技术照亮都市</a> </li>
    <li> <a href="#"><img src="index_files/Picture4.jpg" alt="" width="249"/> </a><a href="#">群星闪耀红地毯</a> </li>
  </ul>
</div>
  </div>
</div>

<div id="friend">
  <h1 class="friend_t"><img src="index_files/friend_ico.gif" alt="合作伙伴"></h1>
  <div class="friend_list">
    <ul>
      <li> <a href="#">中国政府网</a> </li>
      <li> <a href="#">中国政府网</a> </li>
      <li> <a href="#">中国政府网</a> </li>
      <li> <a href="#">中国政府网</a> </li>
      <li> <a href="#">中国政府网</a> </li>
      <li> <a href="#">中国政府网</a> </li>
      <li> <a href="#">中国政府网</a> </li>
    </ul>
	<div style="margin-left:300px;">
    	<br/>
   </div>
  </div>
</div>
<div id="footer">
  <p class=""> 24小时客户服务热线：010-68988888 &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">常见问题解答</a> &nbsp;&nbsp;&nbsp;&nbsp; 新闻热线：010-627488888 <br/>
    文明办网文明上网举报电话：010-627488888 &nbsp;&nbsp;&nbsp;&nbsp; 举报邮箱： <a href="#">jubao@jb-aptech.com.cn</a> </p>
  <p class="copyright"> Copyright &#169; 1999-2009 News China gov, All Right Reserver <br/>
    新闻中国 版权所有 </p>
</div>

</body>
</html>