<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="입력 폼에 입력된 값을 받아서 처리하는 일." %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//payload 입력된 모든 문자의 charset을 설정. ( POST 방식에만 동작한다. )
//*주의 : 모든 request가 사용되기 전에 코딩.
request.setCharacterEncoding("UTF-8");

//requset 내장객체를 사용하여 HTML Form Control에 입력된 값을 받기.
//id=testsdfg&pass=minjo123&birth=2025-11-06&loc=서울&intro=내소개&code=U3881
//parameter명이 유일 => String 변수명=request.getParameter("파라메터명");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String birth=request.getParameter("birth");
String location=request.getParameter("loc");
String intro=request.getParameter("intro");
String code=request.getParameter("code");
//입력한 값을 유효성검증 ( back-end ) > 서비스객체 > DAO > 리턴값 서비스 받아 > jsp로 리턴
//> 리턴된 값을 받아서 이쁘게 만들어서 사용자에게 응답.
%>
<div>
<strong><%= request.getMethod() %>방식 입력값</strong>
<ul>
<!--  String클래스를 생성하여 한글 변환가능 : 입력된 값이 한글인 모든 값에 여러번 처리해야
  한다.  -->
<%-- <li><strong>아이디</strong> : <%= new String(id.getBytes("8859_1"),"UTF-8") %></li> --%>
<li><strong>아이디</strong> : <%= id %></li>
<li><strong>비번</strong> : <%= pass %></li>
<li><strong>생년월일</strong> : <%= birth %></li>
<li><strong>거주지</strong> : <%= location %></li>
<li><strong>자기소개</strong> : <%= intro %></li>
<li><strong>code</strong> : <%= code %></li>
</ul>
</div>
</body>
</html>


