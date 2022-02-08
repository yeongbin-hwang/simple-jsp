<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
  session.invalidate();

  String str = "<p align=center>";
  str += "<br>로그아웃을 완료하였습니다.<br><br>";
  str += "<a href='../login.html'><button>로그인하기</button></a>";
  out.print(str);
%>