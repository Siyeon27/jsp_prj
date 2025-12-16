<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.getColor{ color:  #0000FF }
.postColor{ color:  #FF0000 }
</style>
</head>
<body>
<%
 String requestColorCss="getColor";
if("POST".equals(request.getMethod())){
	requestColorCss="postColor";
}//end if
%>
<strong><span class="<%= requestColorCss %>"><%= request.getMethod()%></span></strong> 방식의 요청.
<br>
<a href="javascript:history.back();">뒤로</a>
</body>
</html>