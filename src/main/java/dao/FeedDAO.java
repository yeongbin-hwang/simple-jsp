package dao;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class FeedDAO {
  public boolean insert(String id, String content) throws NamingException, SQLException{
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
      String sql = "INSERT INTO feed(id, content) VALUES (?, ?)";
      conn = ConnectionPool.get();
      stmt = conn.prepareStatement(sql);
      
      stmt.setString(1, id);
      stmt.setString(2, content);
      
      int count = stmt.executeUpdate();
      return (count > 0) ? true:false;
    }
    finally {
      if(conn != null) conn.close();
      if(stmt != null) stmt.close();
    }
  }
  public ArrayList<FeedObj> getList() throws NamingException, SQLException{
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
      String sql = "SELECT * FROM feed ORDER BY ts DESC";
      conn = ConnectionPool.get();
      stmt = conn.createStatement();
      
      rs = stmt.executeQuery(sql);
      
      ArrayList<FeedObj> feeds = new ArrayList<FeedObj>();
      while(rs.next()) {
        feeds.add(new FeedObj(rs.getString("id"), rs.getString("content"), rs.getString("ts")));
      }
      
      return feeds;
    }
    finally {
      if(conn != null) conn.close();
      if(stmt != null) stmt.close();
      if(rs != null) rs.close();
    }
  }
}
