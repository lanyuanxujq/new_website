package com.news.dao;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class BaseDao {
private static final String DRIVER="com.mysql.jdbc.Driver";
private static final String URL="jdbc:mysql://localhost:3306/newsmanagersystem?characterEncoding=utf-8";
private static final String USER="root";
private static final String PSW="sunsun";
public Connection getConnection(){
	Connection conn=null;
	try {
		Context ctx = new InitialContext();
		//通过JNDI获得DataSource
		DataSource source = (DataSource)ctx.lookup("java:comp/env/jdbc/news");
		//通过DataSource获取连接
		conn = source.getConnection(); 
	} catch (Exception e) {
		e.printStackTrace();
	}		return conn;
}
public void closeAll(Connection conn,PreparedStatement pstm,ResultSet rs){
	try {
		if(conn!=null){
		conn.close();
		}
		if(pstm!=null){
			pstm.close();
		}
		if(rs!=null){
			rs.close();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
public boolean executeSql(String sql,Object[] objs){
	Connection conn=null;
	PreparedStatement pstm=null;
	
	try {
		conn=getConnection();
		pstm=conn.prepareStatement(sql);
		for(int i=0;i<objs.length;i++){
			pstm.setObject(i+1, objs[i]);
		}
		int result=pstm.executeUpdate();
		if(result>0){return true;}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		closeAll(conn,pstm,null);
	}
	return false;
}
}
