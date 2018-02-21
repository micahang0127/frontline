package com.frontline.newssummary.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.frontline.newssummary.dao.SearchDao;


public class SearchService {

	private static SearchService instance =  new SearchService();

	public static SearchService getInstance() {
		return instance;
	}

	private SearchService() {
		
	}

	public String searchId(String useremail) throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		try {

			String jdbcDriver = "jdbc:mysql://localhost:3306/newssummary?" + "useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "tiger";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			
			SearchDao SearchDao = new SearchDao(conn);
			String userId = SearchDao.searchId(useremail);

			return (userId);
		}
		finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
			;
		}
	}

	public String  searchPw(String userId, String useremail2) throws Exception {
	  Connection conn = null;
	        Class.forName("com.mysql.jdbc.Driver");
	  try {
	            String jdbcDriver = "jdbc:mysql://localhost:3306/newssummary?" + "useUnicode=true&characterEncoding=euckr";
	            String dbUser = "root";
	            String dbPass = "tiger";
	            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

	            
	            SearchDao SearchDao = new SearchDao(conn);
	            String userPw = SearchDao.searchPw(userId, useremail2);

	            return (userPw);
	   } 
	  finally {
	   if (conn != null) try { 
		   conn.close();
	  } catch(SQLException ex) {
		  
	  };

	  }

	 }

}


