<%@page import="day1128.ParamDTO"%>
<%@page import="kr.co.sist.user.member.WebMemberLoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../fragments/siteProperty.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<%
//POST방식 일때만 요청되어야한다. 
if( !"POST".equals(request.getMethod())){
%>
<c:redirect url="${CommonURL }/index.html"/>
<%	
}//end if
%>
<%-- 로그인에 필요한 아이디와 비밀번호 파라메터 받기  --%>
<jsp:useBean id="lDTO" class="kr.co.sist.user.member.LoginDTO" scope="page"/>
<jsp:setProperty name="lDTO" property="*"/>
<%
WebMemberLoginService wmls=WebMemberLoginService.getInstance();
ParamDTO pDTO=wmls.searchLogin(lDTO, spVO.getKey());

if( pDTO != null ){//로그인 성공
	//세션에 값을 할당.
	session.setAttribute("userId", pDTO.getId());
	session.setAttribute("userName", pDTO.getName());
	session.setAttribute("userBirth", pDTO.getBirth());
	session.setAttribute("userProfile", pDTO.getProfile());
	//접속 history 남기고
	//페이지를 이동
%>
<c:redirect url="${ CommonURL }/index.jsp"/>
<%	
}//end if
%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel="shortcut icon" href="http://192.168.10.68/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.68/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.68/jsp_prj/common/css/carousel.css" rel="stylesheet">
<jsp:include page="../fragments/bootstrap_css.jsp"/>
<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#header{ height: 150px;	 }	
#container{ height: 700px;	 }	
#footer{ height: 150px;}	
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	
});//ready

</script>


</head>
<body>
	<header data-bs-theme="dark">
	<jsp:include page="../fragments/header.jsp"/>
	</header>
	<main>

		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- Three columns of text below the carousel -->
			<!-- /.row -->
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					아이디나 비밀번호를 확인해주세요.<br>
					<a href="javascript:history.back()">다시로그인</a>
				</div>
				
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
		<jsp:include page="../fragments/footer.jsp"/>
		</footer>
	</main>
	
</body>
</html>