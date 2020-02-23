<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@ page import="com.news.biz.News_NewsBiz,java.util.*" %>
    <%@ page import="com.news.entity.News_News,com.jspsmart.upload.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%		String savePath=null;
		SmartUpload smartUpload = new SmartUpload();//创建上传工具对象
		smartUpload.setCharset("utf-8");//设置编码
		smartUpload.initialize(pageContext);//初始化上传工具
		smartUpload.setAllowedFilesList("jpg,gif");//设置允许的文件扩展名，如果有多个用逗号隔开
		smartUpload.setMaxFileSize(2*1024*1024);//设置单个文件允许的最大大小(单位：字节) 2mb
		smartUpload.setTotalMaxFileSize(10*1024*1024);//设置所有上传文件的总大小(单位：字节)
		smartUpload.upload();//将文件的数据进行上传
		try{
		savePath = "E:/qq/ECLIPSE/now/WebContent/upload/";//文件保存的路径
		File f = smartUpload.getFiles().getFile(0);//获取上传的第一个文件
		if(!f.isMissing()){
		String fileName = f.getFileName();//获取文件的文件名称
		savePath = savePath+fileName;//构建文件要保存的服务器路径
		f.saveAs(savePath);//保存操作
		}
		//String ntitle = smartUpload.getRequest().getParameter("ntitile");//使用了SmartUpload上传，要用smartUpload.getRequest()获取request对象
		out.println("用户图片上传文件成功！");
		
	}catch(Exception ex){
		out.println("上传异常："+ex.getMessage());
	}
String nsummary=smartUpload.getRequest().getParameter("nsummary");
String ntitle=smartUpload.getRequest().getParameter("ntitle");
String ncontent=smartUpload.getRequest().getParameter("ncontent");
String nauthor=smartUpload.getRequest().getParameter("nauthor");
int ntid=Integer.parseInt(smartUpload.getRequest().getParameter("ntid"));
News_NewsBiz control=new News_NewsBiz();
News_News n=new News_News();
n.setNcontent(ncontent);
n.setNtitle(ntitle);
n.setNsummary(nsummary);
n.setNauthor(nauthor);
n.setNtid(ntid);
n.setNpicpath(savePath);
int result=control.addNews(n);
if(result==0){
out.print("<script>alert('标题已经存在!');location.href='news_add.jsp'</script>");	
}
if(result==1){
out.print("<script>alert('新闻创建成功!');location.href='news_add.jsp'</script>");	
}
if(result==-1){
out.print("<script>alert('新闻创建失败!');location.href='news_add.jsp'</script>");	
}
%>
</body>
</html>