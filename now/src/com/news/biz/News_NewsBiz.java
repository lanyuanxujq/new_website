package com.news.biz;

import java.util.List;

import com.news.dao.News_NewsDao;
import com.news.entity.News_News;

public class News_NewsBiz {
	News_NewsDao dao=new News_NewsDao();
	public List<News_News> getAllNewss(){
		return dao.getAllNewss();
	}
	public int addNews(News_News news){
		if(dao.findNews(news)){return 0;}else{
	 boolean result=dao.addNews(news);	
	 if(result){return 1;}else{return -1;}
	 }
	}
	public boolean deleteTopic(int nid){
		return dao.deleteNews(nid);
	}
	public boolean findTopic(News_News news){
		return dao.findNews(news);
	}
	public List<News_News> getLastlyNewss(int ntid){
		return dao.getLastlyNewss(ntid);
	}
	public News_News findNewsByNid(int nid){
		return dao.findNewsByNid(nid);
	}
	public List<News_News> getPage(int pagesize,int ntid,int curpage){
		return dao.getPage(pagesize, ntid,curpage);
	}
	public int getPageNum(int pagesize,int ntid){
		return dao.getPageNum(pagesize, ntid);
	}
}
