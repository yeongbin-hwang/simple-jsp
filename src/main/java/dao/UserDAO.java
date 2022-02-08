package dao;

import java.sql.*;
import javax.naming.NamingException;
import util.ConnectionPool;
import java.util.*;

public class UserDAO {
  public boolean insert(String id, String password, String name) throws NamingException, SQLException{
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
      String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";
      conn = ConnectionPool.get();
      stmt = conn.prepareStatement(sql);
      
      stmt.setString(1, id);
      stmt.setString(2, password);
      stmt.setString(3, name);
      
      int count = stmt.executeUpdate();
      return (count > 0) ? true: false;
    }
    finally {
      if(conn != null) conn.close();
      if(stmt != null) stmt.close();
    }
  }
  public boolean exists(String id) throws NamingException, SQLException {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
      String sql = "SELECT id from user where id = ?";
      conn = ConnectionPool.get();
      stmt = conn.prepareStatement(sql);
      
      stmt.setString(1, id);
      
      rs = stmt.executeQuery();      
      return rs.next(); 
    }
    finally {
      if(conn != null) conn.close();
      if(stmt != null) stmt.close();
      if(rs != null) rs.close();
    }
  }
  public boolean delete(String id) throws NamingException, SQLException {
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
      String sql = "DELETE from user where id = ?";
      conn = ConnectionPool.get();
      stmt = conn.prepareStatement(sql);
      
      stmt.setString(1, id);
      
      int count = stmt.executeUpdate();      
      return (count > 0) ? true: false; 
    }
    finally {
      if(conn != null) conn.close();
      if(stmt != null) stmt.close();
    }
  }
  public int login(String id, String password) throws NamingException, SQLException {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
      String sql = "SELECT password from user where id = ?";
      conn = ConnectionPool.get();
      stmt = conn.prepareStatement(sql);
      
      stmt.setString(1, id);
      
      rs = stmt.executeQuery();
      if(!rs.next()) return 1;
      if(!password.equals(rs.getString("password"))) return 2;
      return 0;
    }
    finally {
      if(conn != null) conn.close();
      if(stmt != null) stmt.close();
      if(rs != null) rs.close();
    }
  }
}