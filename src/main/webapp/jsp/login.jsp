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
    out.print("OK");
  }
  else if(result == 1){
    out.print("NE");
  }
  else if(result == 2){
    out.print("PE");
  }
%>