package com.news.biz;

import com.news.dao.*;
import com.news.entity.News_News;
import com.news.entity.News_Topics;
import java.util.*;

public class News_TopicsBiz {
News_TopicsDao dao=new News_TopicsDao();
public List<News_Topics> getAllTopics(){
	return dao.getAllTopics();
}
public int addTopic(News_Topics topic){
return dao.addTopic(topic);	
}
public boolean deleteTopic(int tid){
	return dao.deleteTopic(tid);
}
public boolean findTopic(News_Topics topic){
	return dao.findTopic(topic);
}
public String findTopicTname(int tid){
	return dao.findTopicTname(tid);
}
public List<News_Topics> getPage(int pagesize,int curpage){
	return dao.getPage(pagesize,curpage);
}
public int getPageNum(int pagesize){
	return dao.getPageNum(pagesize);
}
}
