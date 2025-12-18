<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
					<strong>EL에서 제공하는 연산자 </strong>
					<ul>
					<li><strong>산술연산자</strong></li>
					<li>11+28=${ 11 + 28 }</li>
					<li>11*28=${ 11 * 28 }</li>
					<li>10을 2로 나눈 나머지 = ${ 10 % 2 } ( ${ 10 mod 2 } )</li>
					<li><strong>관계연산자</strong></li>
					<li> 5 &gt; 4 = ${ 5 > 4 } ( ${ 5 gt 4 } )</li>
					<li> 5 &lt; 4 = ${ 5 < 4 } ( ${ 5 lt 4 } )</li>
					<li> 5 &gt;= 4 = ${ 5 >= 4 } ( ${ 5 ge 4 } )</li>
					<li> 5 &lt;= 4 = ${ 5 <= 4 } ( ${ 5 le 4 } )</li>
					<li> 5 == 4 = ${ 5 == 4 } ( ${ 5 eq 4 } )</li>
					<%-- <li> 5 != 4 = ${ 5 != 4 } ( ${ 5 ne 4 } )</li> --%>
					<li><strong>논리연산자</strong></li>
					<li> 5 &gt; 4 &amp;&amp; 4 &lt; 5 = ${ 5 > 4 && 4 < 5} ( ${ 5 gt 4 and 4 lt 5 } )</li>
					<li> 5 &gt; 4 || 4 &lt; 5 = ${ 5 > 4 || 4 < 5} ( ${ 5 gt 4 or 4 lt 5 } )</li>
					<li><strong>단항연산자</strong></li>
					<li> !(5 &gt; 4 &amp;&amp; 4 &lt; 5) = ${ !(5 > 4 && 4 < 5) } ( ${ not( 5 gt 4 and 4 lt 5 ) } )</li>
					<li><strong>삼항연산자</strong></li>
					<li> 10은  = ${ 10 % 2 == 0 ? "짝수":"홀수" } ( ${ 10 mod 2 eq 0 ? '짝수':'홀수'  } )</li>
					<%
					String temp=null;
					String temp2="";
					List<String> list=new ArrayList();
					if(new Random().nextBoolean() ){
						temp="안녕";
						list.add("안녕");
					}
					
					pageContext.setAttribute("temp", temp);
					pageContext.setAttribute("temp2", temp2);
					pageContext.setAttribute("list", list);
					%>
					<li><strong>EL에서는 null을 출력하지 않는다.</strong></li>
					<li>temp = ${ temp } <%= temp %></li>
					<li><strong>empty 연산자</strong></li>
					<li>temp가 null ?  ${ empty temp }</li>
					<li>temp2가 "" ?  ${ empty temp2 }</li>
					<li>list에 방의 갯수가 0인가 ?  ${ empty list }</li>
					</ul>
					
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