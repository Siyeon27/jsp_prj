<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    errorPage="isErrorPage.jsp"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(new Random().nextBoolean()){
	throw new Exception("문제 발생!!!");
}
%>
정상동작
</body>
</html>