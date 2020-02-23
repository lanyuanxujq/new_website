package com.news.biz;

import com.news.dao.News_UsersDao;

public class News_UsersBiz {
News_UsersDao dao=new News_UsersDao();
public boolean login(String uname,String upwd){
	return dao.login(uname, upwd);
}
}
