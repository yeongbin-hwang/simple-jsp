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
    String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";
    
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, uid);
    stmt.setString(2, ups);
    stmt.setString(3, uname);
    
    int count = stmt.executeUpdate();
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