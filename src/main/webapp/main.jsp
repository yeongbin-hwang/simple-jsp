<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
  String uid = (String)session.getAttribute("id");
  
  if(uid == null){
    out.print("로그인 정보가 없습니다.");
  }
  else {
    out.print("메인페이지입니다.");
    session.setAttribute("id", uid);
  }
%>