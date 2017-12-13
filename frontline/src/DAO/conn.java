package DAO;
import java.sql.*;
public class conn {

 

 public static void main(String[] args) {
  String driver = "com.mysql.jdbc.Driver";
  String user = "root";
  String pass = "tiger";
  String dbURL = "jdbc:mysql://localhost:3306/mysql";
  Connection conn;
  try{
   Class.forName(driver);
   conn = DriverManager.getConnection(dbURL, user, pass);
   System.out.println("Driver found! Connection Good!");
  }catch(SQLException se){
   System.out.println("sql error");
  }catch(ClassNotFoundException cne){
   System.out.println("jdbc driver not founded!");
  }

 }
}
