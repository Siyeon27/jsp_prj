<%@page import="kr.co.sist.board.BoardService"%>
<%@page import="kr.co.sist.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.board.BoardDAO"%>
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

<title>게시판 리스트</title>
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

a{ color: #000000; text-decoration: none}
a:hover{ color: #292929; text-decoration: none }

/*게시판 pagination 디자인*/
.prevMark, .nextMark { color:#FF0000 }
.currentPage{ font-size: 20px; font-weight: bold };
.notCurrentPage{ font-size: 18px; font-weight: normal; };
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		checkLogin();
	});
	
	$("#btnSearch").click(function(){
		searchBoard();
	});//click
	
	$("#keyword").keyup(function( evt ){
		if(evt.which == 13){
			searchBoard();
		}//end if
	});//keyup
	
	<c:if test="${ not empty param.keyword }">
	//<select>의 option을 선택 상태로
	$("#field").val("${ param.field }")
	//<input에 값 설정 
	$("#keyword").val("${ param.keyword }")
	</c:if>
	
});//ready

function searchBoard(){
	if($("#keyword").val().trim() != ""){
		$("#boardSearchFrm").submit();
	}//end if
}//searchBoard

function checkLogin(){
	if( ${ sessionScope.userId == null } ){
		alert("로그인한 사용자만 글을 쓸 수 있습니다.");
		location.href="${ CommonURL }/login/loginFrm.jsp";
		return;
	}//end if
	
	<c:if test="${ sessionScope.userId != null }">	
	 location.href="boardWriteFrm.jsp?currentPage=${ param.currentPage }";
	</c:if>
}//checkLogin
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
					<strong>아무말 대잔치 게시판</strong>
					<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page"/>
					<jsp:setProperty property="*" name="rDTO"/>
					<%
					BoardService bs=BoardService.getInstance();
					
					//1.총 게시글의 수
					int totalCount=bs.totalCnt(rDTO);
					
					//2.한 화면에 보여줄 게시물의 수
					int pageScale=bs.pageScale();
					
					//3.총 페이지의수
					int totalPage= bs.totalPage(totalCount, pageScale);
					
					//4.시작번호
					String tempPage=request.getParameter("currentPage");
					
					int currentPage=1;
					if( tempPage != null ){//사용자가 pagination을 클릭하여 정상적인 값이 입력된 경우
						try{
							currentPage=Integer.parseInt(tempPage);
						}catch(NumberFormatException nfe){
						}//end catch
					}//end if
					
					int startNum=bs.startNum(currentPage, pageScale);
					//1페이지 클릭 : 1*10-10+1 =1 , 2페이지 클릭 : 2*10-10+1 = 11
					//5.끝번호
					int endNum=bs.endNum(startNum, pageScale);

					//rDTO는 시작번호와 끝번호를 web parameter로 받지 않고, 
					//연산된 값(위 1항~5항)으로 설정 한다. 
					
					rDTO.setStartNum(startNum);
					rDTO.setEndNum(endNum);
					
					//6. 시작번호와 끝 번호사이에 해당하는 게시글을 조회
					List<BoardDTO> boardList=bs.searchBoardList(rDTO);
					//글 제목이 20글자를 초과하면 19자까지만 보여주고 나머지는 ...으로 처리.
					bs.titleSubStr( boardList );
					rDTO.setUrl("boardList.jsp");
					rDTO.setTotalPage(totalPage);
					
					String pagination=bs.pagination(rDTO);
					String pagination2=bs.pagination2(rDTO,"left");
							
					pageContext.setAttribute("totalCount", totalCount);
					pageContext.setAttribute("pageScale", pageScale);
					pageContext.setAttribute("totalPage", totalPage);
					pageContext.setAttribute("currentPage", currentPage);
					pageContext.setAttribute("startNum", startNum);
					pageContext.setAttribute("endNum", endNum);
					pageContext.setAttribute("boardList", boardList);
					pageContext.setAttribute("pagination", pagination);
					pageContext.setAttribute("pagination2", pagination2);
					%>
					<br>
					<%-- 
					총 게시글의 수 : ${ totalCount }<br>
					한 화면에 보여줄 게시글 수 : ${ pageScale }건<br>
					총 페이지 수 : ${ totalPage }장<br>
					현재페이지 pagination번호 : ${ currentPage }<br>
					시작번호 : ${ startNum }<br>
					끝번호 : ${ endNum }<br>
					 --%>
					   
					<%-- <c:out value="${ totalPage }"/> 중  <c:out value="${ currentPage }"/> 입니다. --%>
					<div id="boardList" style="min-height: 500px">
					
					<input type="button" value="글쓰기"
					 class="btn btn-success btn-sm" id="btnWrite"/>
					
					<table class="table table-hover">
					<thead>
					<tr>
						<th style="width: 80px">번호</th>
						<th style="width: 450px">제목</th>
						<th style="width: 150px">작성자 ID</th>
						<th style="width: 80px">조회수</th>
						<th style="width: 200px">작성일</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${	empty boardList }">
					<tr>
					<td colspan="6" style="text-align: center">
					작성된 게시글이 없습니다.
					</td>
					</tr>
					</c:if>
					<c:forEach var="bDTO" items="${ boardList }" varStatus="i">
					<tr>
					<td><c:out value="${ totalCount-(currentPage-1)*pageScale -i.index }"/></td>
					<td><a href="boardDetailFrm.jsp?num=${ bDTO.num }"><c:out value="${ bDTO.title }"/></a></td>
					<td><c:out value="${ bDTO.id }"/></td>
					<td><c:out value="${ bDTO.cnt }"/></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${ bDTO.input_date }"/></td>
					</tr>
					</c:forEach>
					</tbody>
					</table>
					</div>
					<div id="boardSearchDiv" style="text-align: center">
					<form action="boardList.jsp" id="boardSearchFrm">
					<select name="field" id="field" style="height: 30px">
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">작성자</option>
					</select>
					<input type="text" name="keyword" id="keyword"style="height: 30px"/>
					<input type="hidden" name="currentPage" value="${ tempPage }"/>
					<input type="text" style="display: none"/>
					<input type="button" value="검색" id="btnSearch" class="btn btn-success btn-sm"/>
					</form>
					</div>
					
					<div id="pagination">
					<c:forEach var="tPage" begin="1" end="${ totalPage }" step="1">
					[ <a  class="a" href="boardList.jsp?currentPage=${ tPage }&field=${param.field}&keyword=${param.keyword}">${ tPage }</a> ]
					</c:forEach>
					</div>
					<div id="pagination" style="margin: 0px auto">
						<c:out value="${ pagination }" escapeXml="false"/>
						<br>
						<c:out value="${ pagination2 }" escapeXml="false"/>
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