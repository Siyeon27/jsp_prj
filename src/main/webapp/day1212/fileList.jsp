<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../fragments/siteProperty.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>파일목록</title>
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
				<div>
					<h2>파일목록</h2>
					<table class="table table-hover">
					<thead>
					<tr>
					<th>번호</th>
					<th>파일명</th>
					<th>크기(byte)</th>
					<th>업로드일</th>
					</tr>
					</thead>
					<%
					File directory=new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
					File[] files=directory.listFiles();
					pageContext.setAttribute("files", files);										
					%>
					<tbody>
					<c:if test="${ empty files }">
					<tr>
					<td colspan="4">업로드된 파일이 없습니다.</td>
					</tr>
					</c:if>
					<%-- 
					<c:forEach var="file" items="${ files }" varStatus="i">
					<tr>
					<td><c:out value="${ i.count }"/></td>
					<td><c:out value="${ file.name }"/></td>
					 EL은 getter 호출하는데 length()는 getter 아니므로
					  호출할 수 없어 에러가발생<td><c:out value="${ file.length }"/></td>
					<td><c:out value="${ file.lastModified }"/></td> 
					</tr>
					</c:forEach>
					--%>
					<% 
					File file=null;
					SimpleDateFormat sdf
					=new SimpleDateFormat("yyyy-MM-dd EEEE a HH:mm:ss");
					
					String urlName="";
					
					for(int i=0 ; i < files.length ; i++){ 
					file=files[i];
					urlName=file.getName();
					if(urlName != null){
						//파일명이 QueryString에 영향을 주는 문자열이 있다면 download.jsp로
						//보내지지 않으므로 URL형식으로 encoding 해야한다. 
						urlName=URLEncoder.encode(urlName, "UTF-8");
					}//end if
					%>
					<tr>
					<td><%= i+1 %></td>
					<td><a href="${CommonURL }/day1212/download.jsp?fileName=<%= urlName %>"><%= file.getName() %></a></td>
					<td><%= file.length() %></td>
					<td><%= sdf.format(new Date( file.lastModified())) %></td>
					</tr>
					<% }//end for %>
					
					</tbody>
					</table>
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