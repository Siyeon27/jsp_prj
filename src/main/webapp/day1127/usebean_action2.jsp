<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<!-- 기본생성자 호출 :
				scope객체 
				 page(pageContext) : 페이지가 요청될때마다 객체가 생성되고,
				   생성된 객체는 현재 페이지에서만 사용된다.
				 request : 페이지가 요청될때마다 객체가 생성되고,
				  	생성된 객체는 현재 페이지와 forward로 이동페이지에서 사용된다.
				 session : 접속자마다(웹 브라우저마다) 하나의 객체가 생성되고,
				     생성된 객체는 모든 JSP페이지 에서 사용될 수 있다. 
				 application : 최초 접속자에의해 하나의 객체가 생성되고,
				  생성된 객체는 모든 접속자가 공유하여 사용된다.
				  -->
			<jsp:useBean id="counter" class="day1127.Counter" scope="application"/>
			<jsp:setProperty property="cnt" name="counter" value="1"/>
			당신은 이 페이지에 <strong><jsp:getProperty property="cnt" name="counter"/></strong>
			번째 방문자 입니다.
			<%
			String cnt=String.valueOf( counter.getCnt() );//"91"
			for(int i=0; i < cnt.length() ; i++){
			%>
			<img src="images/num_<%= cnt.charAt(i) %>.png">
			<%
			}//end for
			
			%>
				</div> 
			<%-- <jsp:forward page="usebean2.jsp"/> --%>
			<a href="usebean2.jsp">사용</a>
				
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