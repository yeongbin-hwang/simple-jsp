<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8" %>
<%@ page import="dao.UserDAO" %>
<%
  request.setCharacterEncoding("utf-8");

  String uid = request.getParameter("id");
  String jsonstr = request.getParameter("jsonstr");
  
  UserDAO dao = new UserDAO();
  if(dao.exists(uid)){
    out.print("EX");
    return;
  }
  
  if(dao.insert(uid, jsonstr)){
    session.setAttribute("id", uid);
    out.print("OK");
  }
  else {
    out.print("ER");
  }
%>