<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
         <%@ page import="com.news.biz.News_NewsBiz,java.util.*" %>
    <%@ page import="com.news.entity.News_News" %>
     <%@ page import="com.news.biz.News_TopicsBiz" %>
    <%@ page import="com.news.entity.News_Topics" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<title>新闻中国</title>
	
	<link href="news_read_files/main.css" rel="stylesheet" type="text/css"/>
	<script language="javascript">
		function check(){
			return false;
		}
		
		
	</script>
</head>
<body>
<div id="header">
	<div id="top_login">	
		<form action="" method="post" onsubmit="return check()">
			用户名<input id="uname" name="uname" class="login_input" type="text"/>
			<label> 密&nbsp;&nbsp;码 </label>
			<input id="upwd" name="upwd" value="" class="login_input" type="password"/>
			<input class="login_sub" value="登录" type="submit"/>
			<label id="error"> </label>
			<img src="news_read_files/friend_logo.gif" alt="Google" id="friend_logo"/>
		</form>
  </div>
  <div id="nav">
    <div id="logo"> <img src="news_read_files/logo.jpg" alt="新闻中国"/> </div>
    <div id="a_b01"> <img src="news_read_files/a_b01.gif" alt=""/> </div>
    <!--mainnav end-->
  </div>
</div>


<link href="news_read_files/read.css" rel="stylesheet" type="text/css"/>
<link href="news_read_files/news_read_main.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	function checkComment(){
		var cauthor = document.getElementById("cauthor");
		var content = document.getElementById("ccontent");
		if(cauthor.value == ""){
			alert("用户名不能为空！！");
			return false;
		}else if(content.value == ""){
			alert("评论内容不能为空！！");
			return false;
		}
		return true;
	}
</script>


<div id="container">
  




<div class="sidebar">
    <h1> <img src="news_read_files/title_1.gif" alt="国内新闻"/> </h1>
    <div class="side_list">
      <ul>
      	    	<%!News_NewsBiz controln=new News_NewsBiz();
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
    <h1> <img src="news_read_files/title_2.gif" alt="国际新闻"/> </h1>
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
    <h1> <img src="news_read_files/title_3.gif" alt="娱乐新闻"/> </h1>
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


  
  <%
  request.setCharacterEncoding("utf-8");
	int nid=Integer.parseInt(request.getParameter("nid"));
  News_News ne=controln.findNewsByNid(nid);

  %>
  <div class="main">
    <div class="class_type"> <img src="news_read_files/class_type.gif" alt="新闻中心"/> </div>
    <div class="content">
      <ul class="classlist">
        <table align="center" width="80%">
          <tbody><tr width="100%">
            <td colspan="2" align="center"><%=ne.getNtitle() %></td>
          </tr>
          <tr>
            <td colspan="2"><hr/>
            </td>
          </tr>
          <tr>
            <td align="center">作者：<%=ne.getNauthor() %>                                   
            
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

              类型：<a href="#"><%News_TopicsBiz tbiz=new News_TopicsBiz(); %><%=tbiz.findTopicTname(ne.getNtid()) %></a></td>
            <td align="left" width="25%">发布时间：<%=ne.getNcreatedate() %></td>
          </tr>
          <tr bgcolor="aliceblue">
            <td colspan="2" align="left"><strong>摘要：<%=ne.getNsummary() %></strong></td>
          </tr>
          <tr>
            <td colspan="2" align="center"></td>
          </tr>
          <tr>
            <td colspan="2">　<%=ne.getNcontent() %></td>
          </tr>
          <tr>
            <td colspan="6">&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="2"><hr/>
            </td>
          </tr>
        </tbody></table>
      </ul>
      <ul class="classlist">
        <table align="center" width="80%">
        
        
        
        	
				<tbody><tr>
				    <td> 留言人： </td>
				    <td>风过无痕</td>
					<td> IP： </td>
					<td>127.0.0.1</td>
					<td> 留言时间： </td>
					<td>11-07-26 10:36</td>
				</tr>
				<tr>
					<td colspan="6">支持，强烈支持！</td>
				</tr>
				<tr>
					<td colspan="6"><hr/>
					</td>
				</tr>
        	
				<tr>
				    <td> 留言人： </td>
				    <td>不知道我呀!</td>
					<td> IP： </td>
					<td>127.0.0.1</td>
					<td> 留言时间： </td>
					<td>11-07-26 10:33</td>
				</tr>
				<tr>
					<td colspan="6">什么玩意儿！</td>
				</tr>
				<tr>
					<td colspan="6"><hr/>
					</td>
				</tr>
        	
        
        </tbody></table>
      </ul>
      <ul class="classlist">
        <form action="" method="post" onsubmit="return checkComment()">
          <table align="center" width="80%">
            <tbody><tr>
              <td> 评 论 </td>
            </tr>
            <tr>
              <td> 用户名： </td>
              <td><input id="cauthor" name="cauthor" value="这家伙很懒什么也没留下"/>
                IP：
                <input name="cip" value="127.0.0.1" readonly="readonly"/>
              </td>
            </tr>
            <tr>
              <td colspan="2"><textarea name="ccontent" cols="70" rows="10"></textarea>
              </td>
            </tr>
            <tr><td><input name="submit" value="发  表" type="submit"/>
              </td>
          </tr></tbody></table>
        </form>
      </ul>
    </div>
  </div>
</div>
  
  
  
  
  
  
  
  

<div id="friend">
  <h1 class="friend_t"><img src="news_read_files/friend_ico.gif" alt="合作伙伴"></h1>
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