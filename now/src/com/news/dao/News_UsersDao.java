package com.news.dao;

import java.sql.*;

public class News_UsersDao {
BaseDao basedao=new BaseDao();
public boolean login(String uname,String upwd){
	String sql="select * from news_users where uname=? and upwd=?";
	Connection conn=null;
	PreparedStatement pstm=null;
	ResultSet rs=null;
	
	try {
		conn=basedao.getConnection();
		pstm=conn.prepareStatement(sql);
		pstm.setString(1, uname);
		pstm.setString(2, upwd);
		rs=pstm.executeQuery();
		if(rs.next()){return true;}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{basedao.closeAll(conn, pstm, rs);}	
	return false;
}		
}
