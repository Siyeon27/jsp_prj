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
					<%
					//1.변수 선언
					String msg="점심 맛있게 드세요.";
					int day=28;
					//2.scope객체에 값 할당
					pageContext.setAttribute("todayMsg", msg);
					request.setAttribute("today", day);
					%>
					EL 변수출력( EL에서는 변수에 직접 접근 불가.)<br>
					
					메시지 : ${ msg }<br>
					 ${ day }일
					 
					 <div>
					 <!-- 3. EL에서 scope객체명으로 변수를 사용. -->
					 메시지 : ${ pageScope.todayMsg  }<br>
					  ${ requestScope.today  } 일 <br>
					 </div>
					 <div>
					 <%
					 //scope객체에 값할당
					 pageContext.setAttribute("pageName", "탄지로");
					 request.setAttribute("reqName", "탄지로2");
					 session.setAttribute("sesName", "탄지로3");
					 application.setAttribute("appName", "탄지로4");
					 //이름이 같은 경우
					 pageContext.setAttribute("sName", "탄지로");
					 request.setAttribute("sName", "탄지로2");
					 session.setAttribute("sName", "탄지로3");
					 application.setAttribute("sName", "탄지로4");
					 %>
					 <hr>
					 EL에서 사용 ( scope객체는 생략하고 짧게 사용할 수 있다.)<br>
					 pageScope : ${ pageScope.pageName } (${ pageName } ) <br>
					 requestScope : ${requestScope.reqName } ( ${ reqName } )<br>
					 sessionScope : ${ sessionScope.sesName } (${ sesName } )<br>
					 applicationScope : ${ applicationScope.appName } (${ appName } )
					<hr>
					<!-- scope객체가 이름이 같다면 page > request >session >application
					순서로 접근하여 사용한다.  -->
					${ sName }
					 
					 </div>
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