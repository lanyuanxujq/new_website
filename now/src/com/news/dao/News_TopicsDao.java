package com.news.dao;

import java.util.*;
import java.sql.*;

import com.news.entity.News_News;
import com.news.entity.News_Topics;

public class News_TopicsDao {
BaseDao basedao=new BaseDao();
public List<News_Topics> getAllTopics(){
	String sql="select * from topic";
	Connection conn=null;
	PreparedStatement pstm=null;
	ResultSet rs=null;
	List<News_Topics> topics=new ArrayList<News_Topics>();
	try {
		conn=basedao.getConnection();
		pstm=conn.prepareStatement(sql);
		rs=pstm.executeQuery();
		while(rs.next()){
			News_Topics topic=new News_Topics();
			topic.setTid(rs.getInt("tid"));
			topic.setTname(rs.getString("tname"));
			topics.add(topic);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return topics;
}
public boolean deleteTopic(int tid){
	String sql="delete from topic where tid=?";
	Object[] objs={tid};
	return basedao.executeSql(sql, objs);
}
public boolean findTopic(News_Topics topic){
	Connection conn=null;
	PreparedStatement pstm=null;
	ResultSet rs=null;
	String sql="select * from topic where tname=?";
	
	try {
		conn=basedao.getConnection();
		pstm=conn.prepareStatement(sql);
		pstm.setString(1, topic.getTname());
		rs=pstm.executeQuery();
		if(rs.next()){return true;}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{basedao.closeAll(conn, pstm, rs);}
	return false;
}
public String findTopicTname(int tid){
	Connection conn=null;
	PreparedStatement pstm=null;
	ResultSet rs=null;
	String sql="select * from topic where tid=?";	
	try {
		conn=basedao.getConnection();
		pstm=conn.prepareStatement(sql);
		pstm.setInt(1, tid);
		rs=pstm.executeQuery();
		if(rs.next()){return rs.getString("tname");}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{basedao.closeAll(conn, pstm, rs);}
	return null;
}
public int addTopic(News_Topics topic){
	String sql="insert into topic values(default,?)";
	Object[] objs={topic.getTname()};
	if(findTopic(topic)){return 0;}else{
	boolean result=basedao.executeSql(sql, objs);
	if(result){return 1;}else{return -1;}
	}
}
public int getPageNum(int pagesize){
	String sql="select ceil(count(*)/?) from topic";
	Connection conn=null;
	PreparedStatement pstm=null;
	ResultSet rs=null;
	int result=0;
	try {
		conn=basedao.getConnection();
		pstm=conn.prepareStatement(sql);
		pstm.setInt(1, pagesize);
		rs=pstm.executeQuery();
		if(rs.next()){
			result=rs.getInt(1);
			return result;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{basedao.closeAll(conn, pstm, rs);}
	return result;
}
public List<News_Topics> getPage(int pagesize,int curpage){
	String sql="select * from topic limit ?,?";
	Connection conn=null;
	PreparedStatement pstm=null;
	ResultSet rs=null;
	List<News_Topics> al=new ArrayList<News_Topics>();
	try {
		conn=basedao.getConnection();
		pstm=conn.prepareStatement(sql);
		pstm.setInt(1, (curpage-1)*pagesize);
		pstm.setInt(2, pagesize);
		rs=pstm.executeQuery();
		while(rs.next()){
			News_Topics topic=new News_Topics();
			topic.setTid(rs.getInt("tid"));
			topic.setTname(rs.getString("tname"));
			al.add(topic);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{basedao.closeAll(conn, pstm, rs);}
	return al;
}
}
