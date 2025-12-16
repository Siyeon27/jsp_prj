<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 내장 객체는 scriptlet이나 expression에서 사용할 수 있다. -->
<div>
<strong>요청 정보</strong>
<ul>
<li>요청방식 : <%= request.getMethod() %></li>
<li>요청URL : <%= request.getRequestURL() %></li>
<li>요청URI : <%= request.getRequestURI() %></li>
<li>요청QueryString : <%= request.getQueryString() %></li>
<li>요청프로토콜 : <%= request.getProtocol() %></li>
<li>요청서버명 : <%= request.getServerName() %></li>
<li>요청서버포트 : <%= request.getServerPort() %></li>
<li>요청서블렛 경로 : <%= request.getServletPath() %></li>
<li>요청파라메터값 : <%= request.getParameter("nick") %></li>
<li>요청파라메터값 : <%= request.getParameter("age") %></li>
<li>
파라메터명이 같음. ( 웹 이름이 같으면 배열.)<br>
<%
String[] ageArr=request.getParameterValues("age");
if( ageArr != null ){
	for(int i=0 ; i < ageArr.length ;i++){
		out.print( ageArr[i] );
		out.print( " " );
	}//end for
}//end if
%>
</li>
<li>접속자 ip address : <%= request.getRemoteAddr() %></li>
<li>접속자 port : <%= request.getRemotePort() %></li>
<li>
<%
Enumeration<String> en=request.getHeaderNames();
String headerName="";
String value="";
while(en.hasMoreElements()){
	headerName=en.nextElement();
%>
이름 : <%= headerName %>, 값 : <%= request.getHeader(headerName) %><br>
<%	
}//end while
%>
</li>
</ul>


</div>
<div>
<a href="useRequest.jsp?nick=min&age=20&age=22">요청</a><br>
<!-- form 태그에 action속성을 사용하지 않으면 기본적으로 자신 페이지를 요청한다.  -->
<form method="get" action="useRequest.jsp">
<input type="hidden" name="nick" value="lee"/>
<input type="hidden" name="age" value="21"/>
<input type="hidden" name="age" value="23"/>
<button>요청</button>
</form>
<!-- POST방식에는 QueryString이 존재하지 않는다. -->
<form method="post" action="useRequest.jsp">
<input type="hidden" name="nick" value="park"/>
<input type="hidden" name="age" value="22"/>
<input type="hidden" name="age" value="24"/>
<button>요청</button>
</form>

</div>

</body>
</html>