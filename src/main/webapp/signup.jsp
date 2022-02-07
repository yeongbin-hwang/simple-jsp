<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
  request.setCharacterEncoding("utf-8");

  String uid = request.getParameter("id");
  String ups = request.getParameter("ps");
  String ups2 = request.getParameter("ps2");
  String uname = request.getParameter("name");
  
  if(ups.equals(ups2)){
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "dudqls15!!");
    Statement stmt = conn.createStatement();
    String sql = "INSERT INTO user(id, password, name) VALUES";
    sql += "('" + uid +"', '" + ups + "', '" + uname + "')";
    
    int count = stmt.executeUpdate(sql);
    if(count == 1){
      out.print("회원가입에 성공하셨습니다.");
    }
    else {
      out.print("회원가입에 실패하셨습니다.");
    }
    stmt.close();conn.close();
  }
  else {
    out.print("비밀번호가 일치하지 않습니다.");
  }
%>