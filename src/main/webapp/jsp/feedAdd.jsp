<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8" %>
<%@ page import="dao.FeedDAO" %>
<%
  request.setCharacterEncoding("utf-8");

  String uid = request.getParameter("id");
  String ucontent = request.getParameter("content");
  
  FeedDAO dao = new FeedDAO();
  if(dao.insert(uid, ucontent)){
    out.print("글 업로드에 성공하셨습니다.");
  }
  else {
    out.print("글 업로드에 실패하셨습니다.");
  }
%>