<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션에 로그인한 정보가 있는지?
String sessionId="";		
if(new Random().nextBoolean()){
	sessionId="min";
}else{
//없다면 로그인 페이지로 이동
response.sendRedirect("http://192.168.10.68/jsp_prj/login/loginFrm.jsp");
return;
}//end else
%>