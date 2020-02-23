<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
SmartUpload su=new SmartUpload();
su.setCharset("utf-8");
su.initialize(pageContext);
su.setMaxFileSize(2*1024*1024);
su.setTotalMaxFileSize(10*1024*1024);
su.setAllowedFilesList("jpg,gif");
su.upload();
String savePath="upload/";
Files files=su.getFiles();
String[] filenames=new String[files.getCount()];
for(int i=0;i<files.getCount();i++){
File file=files.getFile(i);
filenames[i]=file.getFileName();
filenames[i]=savePath+filenames[i];
file.saveAs(filenames[i]);}
String username = su.getRequest().getParameter("username");
out.println("用户"+username+"上传"+files.getCount()+"个文件成功！");
}catch(Exception e){
out.println("上传异常："+e.getMessage());
}
%>

<%--
	try{
		SmartUpload smartUpload = new SmartUpload();//创建上传工具对象
		smartUpload.setCharset("utf-8");//设置编码
		smartUpload.initialize(pageContext);//初始化上传工具
		smartUpload.setAllowedFilesList("jpg,gif");//设置允许的文件扩展名，如果有多个用逗号隔开
		smartUpload.setMaxFileSize(2*1024*1024);//设置单个文件允许的最大大小(单位：字节) 2mb
		smartUpload.setTotalMaxFileSize(10*1024*1024);//设置所有上传文件的总大小(单位：字节)
		smartUpload.upload();//将文件的数据进行上传
		String savePath = "upload/";//文件保存的路径
		File f = smartUpload.getFiles().getFile(0);//获取上传的第一个文件
		String fileName = f.getFileName();//获取文件的文件名称
		savePath = savePath+fileName;//构建文件要保存的服务器路径
		f.saveAs(savePath);//保存操作
		
		String username = smartUpload.getRequest().getParameter("username");//使用了SmartUpload上传，要用smartUpload.getRequest()获取request对象
		out.println("用户"+username+"上传文件成功！");
	}catch(Exception ex){
		out.println("上传异常："+ex.getMessage());
	}
--%>
</body>
</html>