<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
    <%@ page import="com.news.biz.News_TopicsBiz,java.util.*" %>
    <%@ page import="com.news.entity.News_Topics" %>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<title>新闻发布系统管理后台</title>
<link href="CSS/admin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="header">
  <div id="welcome">欢迎使用新闻管理系统！</div>
  <div id="nav">
    <div id="logo"><img src="topic_list_files/logo.jpg" alt="新闻中国"></div>
    <div id="a_b01"><img src="topic_list_files/a_b01.gif" alt=""></div>
  </div>
</div>
<div id="admin_bar">
  <div id="status">管理员： 登录  &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">退出</a></div>
  <div id="channel"> </div>
</div>






<script language="javascript">
	function clickdel(){
		return confirm("确认删除吗？");
	}	
</script>


<div id="main">
  <div id="opt_list">
  <ul>
    <li><a href="news_add.htm">添加新闻</a></li>
    <li><a href="admin.htm">编辑新闻</a></li>
    <li><a href="topic_add.htm">添加主题</a></li>
    <li><a href="topic_list.htm">编辑主题</a></li>
  </ul>
</div>

  <div id="opt_area">
    <ul class="classlist">
    
    <%
    	News_TopicsBiz control=new News_TopicsBiz();
    	pageContext.setAttribute("control", control);
    	List<News_Topics> al=new ArrayList<News_Topics>();
    	pageContext.setAttribute("al", al);
    %>    
    <%--
    int pagesize=10;
    int pagenum=control.getPageNum(pagesize);
    int curpage=1;
    request.setCharacterEncoding("utf-8");
    if(request.getParameter("curPage")!=null){
    	try{
    	curpage=Integer.parseInt(request.getParameter("curPage"));}catch(Exception e){}
    }
    if(curpage<1){curpage=1;}else if(curpage>pagenum){curpage=pagenum;}
    List<News_Topics> al=new ArrayList<News_Topics>();
    al=control.getPage(pagesize, curpage);
    --%>
    <c:set var="pagesize" value="10"></c:set>
    <c:set var="pagenum" value="${control.getPageNum(pagesize)}"></c:set>
    <c:set var="curpage" value="1"></c:set>
    <c:if test="${param.curPage!=null}">
    <c:set var="curpage" value="${param.curPage}"></c:set>
    </c:if>
    <c:choose>
    <c:when test="${param.curPage<1}">
    <c:set var="curpage" value="1"></c:set>
    </c:when>
    <c:otherwise>
    <c:if test="${param.curpage>pagenum}">
    <c:set var="curpage" value="${pagenum}"></c:set>
    </c:if>
    </c:otherwise>
    </c:choose>
	<c:set var="al" value="${control.getPage(pagesize,curpage)}"></c:set>
    <c:forEach var="t" items="${al}" begin="0" end="${al.size()}"> 
    <c:out escapeXml="Y" value="<li>&nbsp;&nbsp;&nbsp;&nbsp;${t.tname}&nbsp;&nbsp;&nbsp;&nbsp; <a href='#'>修改</a> &nbsp;&nbsp;&nbsp;&nbsp; <a  onclick='return confirm('确定要删除吗？')' href='topic_delete?id=${t.tid}'>删除</a></li>"></c:out>
    </c:forEach>    	    	      

    
    <p align="right"> 当前页数:[${curpage}/${pagenum}]&nbsp;
     

    <c:out escapeXml="Y" value="</a> <a href='topic_listtwo.jsp?curPage=1'>首页</a>"></c:out>
    <c:choose>
    <c:when test="${curpage==1}">
    <c:out escapeXml="Y" value="<a href='topic_listtwo.jsp?curPage=${curpage-1}' style='color:gray' onclick='return false'>上一页</a>&nbsp;&nbsp; "></c:out>
    </c:when>
    <c:otherwise>
    <c:out escapeXml="Y" value="<a href='topic_listtwo.jsp?curPage=${curpage-1}'>上一页</a>&nbsp;&nbsp; "></c:out>
    </c:otherwise>
    </c:choose>
    <c:choose>
    <c:when test="${curpage==pagenum}">
    <c:out escapeXml="Y" value="<a href='topic_listtwo.jsp?curPage=${curpage+1}' style='color:gray' onclick='return false'>下一页</a>&nbsp;&nbsp; "></c:out>
    </c:when>
    <c:otherwise>
    <c:out escapeXml="Y" value="<a href='topic_listtwo.jsp?curPage=${curpage+1}'>下一页</a>&nbsp;&nbsp; "></c:out>
    </c:otherwise>
    </c:choose>
	<c:out escapeXml="Y" value="</a> <a href='topic_listtwo.jsp?curPage=${pagenum}'>末页</a>"></c:out>
    
    
    
    
      	
   <%--  <%
	List<News_Topics> al=new ArrayList<News_Topics>();
	al=control.getAllTopics();	
   for(int i=0;i<al.size();i++){News_Topics u=new News_Topics();u=al.get(i);
    %>  	
      		<li>&nbsp;&nbsp;&nbsp;&nbsp; <%=u.getTname()%>&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">修改</a> &nbsp;&nbsp;&nbsp;&nbsp; <a  onclick="return confirm('确定要删除吗？')" href="topic_deletecopy.jsp?id=<%=u.getTid()%>">删除</a></li>
      		<% }      		%>    	
      		<p align="right"> 当前页数:[1/3]&nbsp; <a href="#">下一页&nbsp;&nbsp;</a> <a href="#">末页</a> </p>
    --%>   		      	
      		

  
    </ul>
  </div>
</div>

<div id="site_link"> <a href="#">关于我们</a><span>|</span> <a href="#">Aboue Us</a><span>|</span> <a href="#">联系我们</a><span>|</span> <a href="#">广告服务</a><span>|</span> <a href="#">供稿服务</a><span>|</span> <a href="#">法律声明</a><span>|</span> <a href="#">招聘信息</a><span>|</span> <a href="#">网站地图</a><span>|</span> <a href="#">留言反馈</a> </div>
<div id="footer">
  <p class="">24小时客户服务热线：010-68988888  &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">常见问题解答</a> &nbsp;&nbsp;&nbsp;&nbsp;  新闻热线：010-627488888<br/>
    文明办网文明上网举报电话：010-627488888  &nbsp;&nbsp;&nbsp;&nbsp;  举报邮箱：<a href="#">jubao@jb-aptech.com.cn</a></p>
  <p class="copyright">Copyright &#169; 1999-2009 News China gov, All Right Reserver<br/>
    新闻中国   版权所有</p>
</div>
</body>
</html>