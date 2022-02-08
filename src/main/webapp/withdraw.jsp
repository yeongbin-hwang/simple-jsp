<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8" %>
<%@ page import="dao.UserDAO" %>
<%
  request.setCharacterEncoding("utf-8");

  String uid = request.getParameter("id");
  
  UserDAO dao = new UserDAO();
  if(dao.exists(uid)){
    if(dao.delete(uid)){
      out.print("회원탈퇴에 성공하셨습니다.");
    }
    else {
      out.print("회원탈퇴에 실패하셨습니다.");
    }
  }
  else {
    out.print("아이디가 존재하지 않습니다.");
  }
%>