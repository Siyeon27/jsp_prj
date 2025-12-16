<%@page import="kr.co.sist.user.member.WebMemberSerivce"%>
<%@page import="day1128.ParamDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../fragments/siteProperty.jsp" %>  
<%@ include file="../fragments/loginChk2.jsp" %>  

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>회원정보 수정</title>
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
					<h2>회원정보 수정</h2>
					<%
					request.setCharacterEncoding("UTF-8");
					
					String id=(String)session.getAttribute("userId");
					
					 //1.업로드된 파일을 저장할 경로 설정
					File saveDir=new File( "C:/dev/workspace/jsp_prj/src/main/webapp/upload");
					//2. 최대 크기 설정.
					int maxSize=1024 * 1024 * 10;// 10MByte로 제한.
					//업로드 크기를 설정
					int uploadSize=1024 * 1024 * 600;// 600MByte로 제한.
					//3 FileUpload 객체( MultipartRequest )를 생성. => 생성하자마자 업로드 된다. 
					MultipartRequest mr=new MultipartRequest( request, saveDir.getAbsolutePath(),
							uploadSize,"UTF-8",new DefaultFileRenamePolicy());
					
					String mail=mr.getParameter("mail");
					String domain=mr.getParameter("domain");
					String birth=mr.getParameter("birth");
					String loc=mr.getParameter("loc");
					String intro=mr.getParameter("intro");
					String profile=mr.getParameter("profile");//hidden
					//파일명은 파라메터를 받을 수 없다.
					//String fileName=mr.getParameter("upfile");
					String originalName=mr.getOriginalFileName("upfile");//원본명
					String fileSystemName=mr.getFilesystemName("upfile");//변경된 이름
					 
					//업로드된 파일의 크기를 얻어서, 업로드가능 크기와 비교한다.
					//파일이 크다면 사용자에게 "에러메시지를 보여준다." 파일을 삭제한다. 
					File compareFile=new File(saveDir.getAbsolutePath()+File.separator+fileSystemName);
					
					boolean flag=false;
					if( flag = (compareFile.length() > maxSize)){
						compareFile.delete();
					}//end if
					
					ParamDTO pDTO=new ParamDTO();
					pDTO.setId(id);
					pDTO.setEmail(mail+"@"+domain);
					pDTO.setBirth(birth);
					pDTO.setLoc(loc);
					pDTO.setIntro(intro);
					//프로필 이미지가 선택되지 않으면, 기존 이미지명으로 설정되고,
					// 그렇지 않으면 선택한 파일명으로 설정된다.
					pDTO.setProfile(fileSystemName==null?profile:fileSystemName);
					
					WebMemberSerivce wms=WebMemberSerivce.getInstance();
					boolean flagModify=wms.modifyMember(pDTO);
					pageContext.setAttribute("flag", flagModify);
					//index.jsp에서 프로필 이미지를 세션에서 가져와서 보여주기 때문에
					//회원 정보 변경이 성공하면 세션에 프로필 이미지를 변경해준다.
					if(flagModify){
						session.setAttribute("userProfile", pDTO.getProfile() );
						session.setAttribute("userBirth", pDTO.getBirth());
					}//end if
					
					%>
					<c:choose>
					<c:when test="${ flag }">
					회원정보가 수정 되었습니다.<br>
					<img src="${ CommonURL }/upload/james.png"/>
					<a href="${ CommonURL }/index.jsp">메인화면</a>
					</c:when>
					<c:otherwise>
					회원정보변경에 문제가 발생하였습니다.<br>
					사용중 불편을 드려 대단히 죄송합니다.<br> 
					</c:otherwise>
					</c:choose>
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