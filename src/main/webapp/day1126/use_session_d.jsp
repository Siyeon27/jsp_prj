<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션의 값을 삭제( 세션은 살아있음 ).
session.removeAttribute("name");
//세션을 무효화
session.invalidate();

response.sendRedirect("use_session_a.jsp");
//System.out.println("-----"+session.getAttribute("name"));
%>
