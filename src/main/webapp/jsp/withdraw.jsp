<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8" %>
<%@ page import="dao.UserDAO" %>
<%
  request.setCharacterEncoding("utf-8");

  String uid = request.getParameter("id");
  
  UserDAO dao = new UserDAO();
  if(!dao.exists(uid)){
    out.print("아이디가 존재하지 않습니다.");
    return ;
  }
  
  if(dao.delete(uid)){
    String str = "<p align=center>";
    str += "<br>회원탈퇴에 성공하셨습니다.<br>";
    str += "그동안 이용해주셔서 감사합니다.<br>";
    out.print(str);
    session.removeAttribute("id");
  }
  else {
    out.print("회원탈퇴에 실패하셨습니다.");
  }

%>