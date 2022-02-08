<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8" %>
<%@ page import="dao.UserDAO" %>
<%
  request.setCharacterEncoding("utf-8");

  String uid = request.getParameter("id");
  String ups = request.getParameter("ps");
  String ups2 = request.getParameter("ps2");
  String uname = request.getParameter("name");
  
  if(ups.equals(ups2)){
    UserDAO dao = new UserDAO();
    
    if(dao.exists(uid)){
      out.print("이미 가입한 회원입니다.");
      return;
    }
    
    if(dao.insert(uid, ups, uname)){
      out.print("회원가입에 성공하셨습니다.");
    }
    else {
      out.print("회원가입에 실패하셨습니다.");
    }
  }
  else {
    out.print("비밀번호가 일치하지 않습니다.");
  }
%>