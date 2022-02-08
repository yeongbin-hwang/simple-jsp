<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
  String uid = (String)session.getAttribute("id");
  if(uid == null){
    response.sendRedirect("../login.html");
    return;
  }
  session.setAttribute("id", uid);
  
  ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
  
  String str = "<table align=center>";
  str += "<tr><td align=left>작성글 리스트</td>";
  str += "<td align=right>";
  str += "<a href='../feedAdd.html'><button>글쓰기</button></a>";
  str += "</td></tr>";
  for(FeedObj feed : feeds){
    str += "<tr><td colspan=2><hr></td></tr>";
    str += "<tr><td>" + feed.getId() +"</td>";
    str += "<td>&nbsp;(" + feed.getTs() +")</td></tr>";
    str += "<tr><td colspan=2>" + feed.getContent() +"</td></tr>";
  }
  str += "</table>";
  out.print(str);
%>