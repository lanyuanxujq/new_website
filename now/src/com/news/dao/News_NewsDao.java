package com.news.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.news.entity.News_News;

public class News_NewsDao {
	BaseDao basedao=new BaseDao();
	public List<News_News> getAllNewss(){
		String sql="select * from news";
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		List<News_News> newss=new ArrayList<News_News>();
		try {
			conn=basedao.getConnection();
			pstm=conn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				News_News news=new News_News();
				news.setNid(rs.getInt("nid"));
				news.setNtitle(rs.getString("ntitle"));
				news.setNcontent(rs.getString("ncontent"));
				news.setNcreatedate(rs.getString("ncreatedate"));
				news.setNcontent(rs.getString("ncontent"));
				news.setNpicpath(rs.getString("npicpath"));
				newss.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newss;
	}
	public boolean deleteNews(int nid){
		String sql="delete from news where nid=?";
		Object[] objs={nid};
		return basedao.executeSql(sql, objs);
	}
	public boolean findNews(News_News news){
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="select * from news where ntitle=?";
		
		try {
			conn=basedao.getConnection();
			pstm=conn.prepareStatement(sql);
			pstm.setString(1, news.getNtitle());
			rs=pstm.executeQuery();
			if(rs.next()){return true;}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{basedao.closeAll(conn, pstm, rs);}
		return false;
	}
	public boolean addNews(News_News news){
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = df.format(d);
		String sql="insert into news values(default,?,?,?,?,?,?,?,?)";
		Object[] objs={news.getNtid(),news.getNtitle(),news.getNauthor(),now,news.getNpicpath(),news.getNcontent(),now,news.getNsummary()};
		return basedao.executeSql(sql, objs);
}
	public List<News_News> getLastlyNewss(int ntid){
		String sql="select * from news where ntid=? order by ncreatedate desc;";
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		List<News_News> newss=new ArrayList<News_News>();
		try {
			conn=basedao.getConnection();
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1, ntid);
			rs=pstm.executeQuery();
			while(rs.next()){
				News_News news=new News_News();
				news.setNid(rs.getInt("nid"));
				news.setNtitle(rs.getString("ntitle"));
				news.setNcontent(rs.getString("ncontent"));
				news.setNcreatedate(rs.getString("ncreatedate"));
				news.setNcontent(rs.getString("ncontent"));
				news.setNpicpath(rs.getString("npicpath"));
				newss.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newss;
	}
	public News_News findNewsByNid(int nid){
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="select * from news where nid=?";
		News_News news=new News_News();
		try {
			conn=basedao.getConnection();
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1, nid);
			rs=pstm.executeQuery();
			if(rs.next()){
				news.setNauthor(rs.getString("nauthor"));
				news.setNcontent(rs.getString("ncontent"));
				news.setNtitle(rs.getString("ntitle"));
				news.setNcreatedate(rs.getString("ncreatedate"));
				news.setNsummary(rs.getString("nsummary"));
				news.setNpicpath(rs.getString("npicpath"));
				news.setNtid(rs.getInt("ntid"));
				return news;
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{basedao.closeAll(conn, pstm, rs);}
		return null;
	}
	public int getPageNum(int pagesize,int ntid){
		String sql="select ceil(count(*)/?) from news where ntid=?";
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		int result=0;
		try {
			conn=basedao.getConnection();
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1, pagesize);
			pstm.setInt(2, ntid);
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
	public List<News_News> getPage(int pagesize,int ntid,int curpage){
		String sql="select * from news where ntid=? limit ?,?;";
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		List<News_News> al=new ArrayList<News_News>();
		try {
			conn=basedao.getConnection();
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1, ntid);
			pstm.setInt(2, (curpage-1)*pagesize);
			pstm.setInt(3, pagesize);
			rs=pstm.executeQuery();
			while(rs.next()){
				News_News news=new News_News();
				news.setNtitle(rs.getString("ntitle"));
				news.setNcreatedate(rs.getString("ncreatedate"));
				news.setNid(rs.getInt("nid"));
				al.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{basedao.closeAll(conn, pstm, rs);}
		return al;
	}
}