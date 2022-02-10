<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8" %>
<%@ page import="dao.FeedDAO" %>
<%
  request.setCharacterEncoding("utf-8");

  String jsonstr = request.getParameter("jsonstr");
  
  FeedDAO dao = new FeedDAO();
  if(dao.insert(jsonstr)){
    out.print("OK");
  }
  else {
    out.print("ER");
  }
%>