<%@page import="day1216.ApiExplorer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="day1216.RssDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../fragments/siteProperty.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>RSS Parsing</title>
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

function requestRss( url, title ){
	if( confirm(title+" 기사를 보시겠습니까?") ){
		$.ajax({
			url: url+".xml",
			type:"GET",
			dataType:"XML",
			error:function( xhr ){
				alert(title+" 기사를 가져올 수 없습니다.");
				console.log( xhr.status );
			},
			success: function( xmlDoc ){
				var output="";
				
				output+="<h2>"+ title +"</h2>";
				
				var itemNodes=$(xmlDoc).find("item");
				output+=" 기사 : <strong>"+ itemNodes.length +"</storng>건<br>";
				
				var description="";
				var itemTitle="";
				$.each( itemNodes, function(ind, itemNode){
					itemTitle=$( itemNode ).find("title").text();
					if(itemTitle.length > 40){
						itemTitle=itemTitle.substring(0,39)+"...";
					}//end if
					description=$( itemNode ).find("description").text();
					if(description.length > 100){
						description=description.substring(0,99)+"...";
					}//end if
					output+="<div>";
					output+="<table class='table table-hover'>";
					output+="<tr><th>제목<th><td><a href='"+
							$( itemNode ).find("link").text()
							+"' title='뉴스 읽기' target='blank'>"+
							itemTitle
							+"</a></td><th>작성일</th><td>"+
							$( itemNode ).find("pubDate").text()
							+"</td></tr><tr><th>설명</th><td colspan='4'>"+
							description
							+"</td></tr>";
					
					output+="</table>";
					output+="</div>";
				});//each				
				
				$("#output").html(output);
			}
		});//ajax
		
	}//end if
	
}//requestRss

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
				<%
				List<RssDTO> list=new ArrayList<RssDTO>();
				list.add(new RssDTO("newsflesh","속보","newsflesh"));
				list.add(new RssDTO("issue","이슈 Top10","issue"));
				list.add(new RssDTO("section/politics","정치","politics"));
				list.add(new RssDTO("section/economy","경제","economy"));
				list.add(new RssDTO("section/society","사회","society"));
				list.add(new RssDTO("section/international","국제","international"));
				list.add(new RssDTO("section/culture","문화","culture"));
				list.add(new RssDTO("section/entertainment","연예","entertainment"));
				list.add(new RssDTO("section/sports","스포츠","sports"));
				list.add(new RssDTO("section/weather","날씨","weather"));
				
				ApiExplorer ae=new ApiExplorer();
				//CORS 이슈로 인하여 RSS을 java에서 읽어들여 XML file로 생성
				//뉴스의 전처리 
				for(RssDTO rDTO : list){ 
					ae.createRss(rDTO.getUrl(), rDTO.getEngTitle());
				}//end for 
				
				
				pageContext.setAttribute("rssList", list);
				%>	
				<table class="table table-hover">
				<tr>
				<c:forEach var="news" items="${ rssList }">
				<td><a href="javascript:requestRss('${CommonURL}/day1216/${ news.engTitle }','${ news.title }')"><c:out value="${news.title }"/></a></td>
				</c:forEach>
				</tr>
				</table>
				</div>
				<div id="output"></div>
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