<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="dao.UserDAO" %>
<%
  String uid = request.getParameter("id");
  String upass = request.getParameter("ps");
  
  UserDAO dao = new UserDAO();
  int result = dao.login(uid, upass);
  
  if(result == 0){
    session.setAttribute("id", uid);
    response.sendRedirect("main.jsp");
  }
  else if(result == 1){
    out.print("아이디가 존재하지 않습니다.");
  }
  else if(result == 2){
    out.print("비밀번호가 일치하지 않습니다.");
  }
%>