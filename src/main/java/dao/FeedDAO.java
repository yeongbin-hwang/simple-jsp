package dao;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import util.ConnectionPool;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class FeedDAO {
  public boolean insert(String jsonstr) throws NamingException, SQLException, ParseException{
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
      synchronized(this) {
        conn = ConnectionPool.get();
        
        // phase 1. add 'no' property
        String sql = "SELECT no from feed ORDER BY no DESC LIMIT 1";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();
        int max = (!rs.next())? 0:rs.getInt("no");
        stmt.close(); rs.close();
        
        JSONParser parser = new JSONParser();
        JSONObject jsonobj = (JSONObject) parser.parse(jsonstr);
        jsonobj.put("no", max + 1);

        // phase 2. add 'user' property
        String uid = jsonobj.get("id").toString();

        sql = "SELECT jsonstr from user WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, uid);
        rs = stmt.executeQuery();

        if(rs.next()){
          String usrstr = rs.getString("jsonstr");
          JSONObject usrobj = (JSONObject) parser.parse(usrstr);
          usrobj.remove("ps");
          usrobj.remove("ts");
          jsonobj.put("user", usrobj);
        }
        stmt.close(); rs.close();

        // phase 3. insert jsonobj to the table
        sql = "INSERT INTO feed(no, id, jsonstr) VALUES (?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, max + 1);
        stmt.setString(2, uid);
        stmt.setString(3, jsonobj.toJSONString());
        
        int count = stmt.executeUpdate();
        return (count > 0) ? true:false;
      }
    }
    finally {
      if(conn != null) conn.close();
      if(stmt != null) stmt.close();
    }
  }
  public String getList() throws NamingException, SQLException{
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
      String sql = "SELECT jsonstr FROM feed ORDER BY no DESC";
      
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
  public String getGroup(String maxNo) throws NamingException, SQLException{
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
      String sql = "SELECT jsonstr FROM feed";
      if(maxNo != null) {
        sql += " WHERE no < " + maxNo;
      }
      sql += " ORDER BY no DESC LIMIT 3";
      
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
