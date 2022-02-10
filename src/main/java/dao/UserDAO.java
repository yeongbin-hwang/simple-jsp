package dao;

import java.sql.*;
import javax.naming.NamingException;
import util.ConnectionPool;
import java.util.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class UserDAO {
  public boolean insert(String id, String jsonstr) throws NamingException, SQLException{
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
      String sql = "INSERT INTO user(id, jsonstr) VALUES(?, ?)";
      conn = ConnectionPool.get();
      stmt = conn.prepareStatement(sql);
      
      stmt.setString(1, id);
      stmt.setString(2, jsonstr);
      
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
  public int login(String id, String password) throws NamingException, SQLException, ParseException{
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
      String sql = "SELECT jsonstr from user where id = ?";
      conn = ConnectionPool.get();
      stmt = conn.prepareStatement(sql);
      
      stmt.setString(1, id);
      
      rs = stmt.executeQuery();
      if(!rs.next()) return 1;
      
      String jsonstr = rs.getString("jsonstr");
      JSONObject obj = (JSONObject) (new JSONParser()).parse(jsonstr);
      String pass = obj.get("password").toString();
      
      if(!password.equals(pass)) return 2;
      return 0;
    }
    finally {
      if(conn != null) conn.close();
      if(stmt != null) stmt.close();
      if(rs != null) rs.close();
    }
  }
  public String getList() throws NamingException, SQLException{
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
      String sql = "SELECT jsonstr FROM user";
      conn = ConnectionPool.get();
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      
      String str = "[";
      int cnt = 0;
      while(rs.next()) {
        if(cnt++ > 0) str += ", ";
        str += rs.getString("jsonstr");
      }
      
      return str + "]";
    }
    finally {
      if(conn != null) conn.close();
      if(stmt != null) stmt.close();
      if(rs != null) rs.close();
    }
  }
}