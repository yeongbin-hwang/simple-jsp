<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
  request.setCharacterEncoding("utf-8");

  String uid = request.getParameter("id");
  
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "dudqls15!!");
  String sql = "DELETE FROM user WHERE id = ?";
  PreparedStatement stmt = conn.prepareStatement(sql);
  
  stmt.setString(1, uid);
  int count = stmt.executeUpdate();
  if(count == 1){
    out.print("회원탈퇴에 성공하셨습니다.");
  }
  else {
    out.print("회원탈퇴에 실패하셨습니다.");
  }
  stmt.close();conn.close();
%>