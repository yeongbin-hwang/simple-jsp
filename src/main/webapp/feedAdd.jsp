<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
  request.setCharacterEncoding("utf-8");

  String uid = request.getParameter("id");
  String ucontent = request.getParameter("content");
  
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "dudqls15!!");
  Statement stmt = conn.createStatement();
  String sql = "INSERT INTO feed(id, content) VALUES";
  sql += "('" + uid +"', '" + ucontent + "')";
  
  int count = stmt.executeUpdate(sql);
  if(count == 1){
    out.print("글 업로드에 성공하셨습니다.");
  }
  else {
    out.print("글 업로드에 실패하셨습니다.");
  }
  stmt.close();conn.close();
%>