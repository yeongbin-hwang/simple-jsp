<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
  ArrayList<UserObj> users = (new UserDAO()).getList();
  
  String str = "<table align=center>";
  str += "<tr><th colspan=3 align=center>가입자 리스트</th></tr>";
  for(UserObj user: users){
    str += "<tr><td colspan=3><hr></td></tr>";
    str += "<tr>";
    str += "<td>" + user.getId() +"</td>";
    str += "<td>" + user.getName() +"</td>";
    str += "<td>&nbsp;(" + user.getTs() +")</td>";
    str += "</tr>";
  }
  str += "</table>";
  out.print(str);
%>