<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "dudqls15!!");
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery("SELECT id, name, ts FROM user");
  
  String str = "<table align=center>";
  str += "<tr><th colspan=3 align=center>가입자 리스트</th></tr>";
  while(rs.next()){
    str += "<tr><td colspan=3><hr></td></tr>";
    str += "<tr>";
    str += "<td>" + rs.getString("id") +"</td>";
    str += "<td>" + rs.getString("name") +"</td>";
    str += "<td>" + rs.getString("ts") +"</td>";
    str += "</tr>";
  }
  str += "</table>";
  out.print(str);
  conn.close();stmt.close();rs.close();
%>