<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%!
public boolean login(String uname,String upwd){
	boolean find=true;
	return find;
}
%>
<%
request.setCharacterEncoding("utf-8");
String username=request.getParameter("uname");
String userpass=request.getParameter("upwd");
if(login(username,userpass)){
	session.setAttribute("uname",username);
	Cookie userCookie=new Cookie("uname",username);
	userCookie.setMaxAge(300);
	Cookie pwdCookie=new Cookie("upwd",userpass);
	pwdCookie.setMaxAge(300);
	response.addCookie(userCookie);
	response.addCookie(pwdCookie);
	request.getRequestDispatcher("index.jsp").forward(request,response);
}else{
out.print("<script>alert('登录失败，请重新登录');location.href='index.jsp';</script>");	
}
%>
</body>
</html>