<%@page import="kr.co.sist.user.member.WebMemberSerivce"%>
<%@page import="day1128.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../fragments/siteProperty.jsp" %>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>${ SiteProperty.title }</title>
<link rel="shortcut icon" href="${ CommonURL }/common/images/favicon.ico">

<script src="${ CommonURL }/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="${ CommonURL }/common/css/carousel.css" rel="stylesheet">
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
				<jsp:useBean id="pDTO" class="day1128.ParamDTO" scope="page"/>
				<!-- web parameter를 한번에 받을 수 있다. -->
				<jsp:setProperty property="*" name="pDTO"/>
				<%
				//web parameter가 아닌 접속자의 정보 받아야함.
				String ip=request.getRemoteAddr();
				pDTO.setIp(ip);
				//sec-ch-ua-platform, user-agent
				pDTO.setSecChUaPlatform(request.getHeader("sec-ch-ua-platform"));
				pDTO.setUserAgent(request.getHeader("user-agent"));
				
				%>
				
				<%
				//name은 유일한 이름이기 때문에 괜찮지만 
				//email은 mail과 domain로 분리되어있다.
				pDTO.setEmail(request.getParameter("mail")+"@"+
				request.getParameter("domain"));
				
				/***********************************************
				//12/04일 MemberService를 WebMemberService로 변경
				************************************************/
				WebMemberSerivce wms=WebMemberSerivce.getInstance();
				
				//한정적인 자원을 동시사용할 때 조회를 먼저 수행한 후 다음 작업으로 진행한다.
				boolean idFlag=wms.searchId(pDTO.getId());
				if(!idFlag){ //아이디를 선점한 경우
				%>
				입력하신 ${ param.id }는 이미 사용중입니다.<br>
				다른 아이디를 입력해보세요.
				<a href="javascript:history.back()" class="btn btn-success">뒤로</a>
				<%	
				}else{
				boolean addFlag=wms.addMember(pDTO, spVO.getKey());
				pageContext.setAttribute("addFlag", addFlag);
				%>
				<c:choose>
				<c:when test="${ addFlag }">
				
				<strong>${ param.id }</strong>
				 님
				 회원 가입을 축하드립니다.<br>
				 기존 서비스와는 차별화된 새로운 사용자 경험을 제공합니다.<br>
				 <img src="../common/images/img_4.jpg">
				<br>
				아이디 : <input type="text" value="${ param.id }"/><br>
				비밀번호 : ${ param.pass }<br>
				이름 : ${ param.name }<br>
				이메일 : ${ param.mail }@${ param.domain }<br>
				생년월일 : ${ param.birth }<br>
				거주지 : ${ param.loc }<br>
				소개 : ${ param.intro }<br>
				코드 : ${ param.code }<br>
				
				<div>
				<strong>&lt;jsp:getProperty 사용</strong><br>
				주소 : <jsp:getProperty property="language" name="pDTO"/><br>
				<% //<jsp:getProperty를 사용하면 배열의 요소를 출력할 수 없다.
				String[] lang=pDTO.getLanguage();// request.getParameterValues("language");
				
				if( lang != null){ //NullPointerException발생을 막기위해서
				for(int i=0; i < lang.length ; i++){
					%>
					<%= i+1 %>. <%= lang[i] %> 
					<%
				}//end for
				}//end if
				%>
				</div>
				<div>
				<strong>&lt;c:forEach 사용</strong><br>
				<c:forEach var="lang" items="${ paramValues.language }" varStatus="i">
				<c:out value="${ i.count }"/>. <c:out value="${ lang }"/>
				</c:forEach>
				</div>
				
				<a href="${ CommonURL }/index.html">첫화면으로</a>
				
				</c:when>
				<c:otherwise>
				<img src="../common/images/fail.png"/><br>
				${ param.name }님 회원가입을 실패하였습니다.<br>
				잠시 후 다시 시도해주세요.<br>
				<a href="javascript:history.back()">뒤로</a>
				</c:otherwise>
				</c:choose>
				<%}//end else %>
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