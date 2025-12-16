<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! String msg="오늘은 수요일입니다."; 

	public String lunch(){
		 return "오늘의 메뉴는 알빠노!";
	}

%>

<%= msg %>
<marquee scrollamount="10"><%= lunch() %></marquee>
</body>
</html>