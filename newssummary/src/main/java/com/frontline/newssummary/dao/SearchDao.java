package com.frontline.newssummary.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SearchDao {
	private Connection conn;
	public SearchDao(Connection conn) {
		this.conn = conn;
	}

	public String searchId(String useremail) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			pstmt = conn.prepareStatement(
					"select id from member where email = ? ");
			pstmt.setString(1, useremail);
			rs = pstmt.executeQuery();
			if (rs.next())
				return (rs.getString("id"));
			else
				return "이메일이 틀려";
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}

	public String searchPw(String userId, String useremail2) throws SQLException {

      PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {

        	 pstmt = conn.prepareStatement( 
        			 "select pw from member where id = ? and email = ? ");

        	 pstmt.setString(1, userId);
        	 pstmt.setString(2, useremail2);

        	 rs = pstmt.executeQuery();

             	if( rs.next() )

             		return (rs.getString("pw"));

             	else

             		return "비밀번호가 틀려";

         	} finally {
        	 
        	 	if(rs!=null)try { rs.close(); } catch(SQLException e) {
        	 		e.printStackTrace();
        	 	}

        	 	if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {
        	 		e.printStackTrace();
        	 	}

         	}




  }

}

