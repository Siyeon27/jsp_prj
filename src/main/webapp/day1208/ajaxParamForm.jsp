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

	$("#id").keyup(function(){
		findId();
	});
	$("#btn").click(function(){
		//유효성 검증 후
		$("#joinFrm").submit(); //값을 back-end로 전송
	});//click
	
	//이벤트 처리
	function findId(){
		var id=$("#id").val();
		if(id.length > 2){
			idDup( id );
		}else{
			$("#idWarning").html("아이디 중복 검사 전 입니다.");
		}//if
	}
});//ready

function idDup( id ){
	var param={ id : id };
	
	$.ajax({
		url : "idDup.jsp",
		type:"get",
		data: param,
		dataType:"JSON",
		error:function(xhr){
			alert("서버에서 문제가 발생하였습니다.");
			console.log( xhr.status );
		},
		success:function(jsonObj){
			$("#idWarning").html( jsonObj.idResult?"사용가능합니다.":"이미사용중" );
		}
	});//ajax
}//idDup

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
				<form name="joinFrm" method="post" id="joinFrm" 
				action="usebeanParamFormProcess.jsp"> 
	<table id="joinFrm">
		<tr>
			<td class="title"><label><span class="star">*</span>아이디</label></td>
			<td class="input"><input type="text" class="inputBox" name="id" id="id"/>
			<div id="idWarning"></div>
			</td>
		</tr>

		<tr>
			<td class="title"><label><span class="star">*</span>비밀번호</label></td>
			<td class="input"><input type="password" class="inputBox" name="pass" value="minjo123"/>
			</td>
		</tr>

		<tr>
			<td class="title"><label><span class="star">*</span>이름</label></td>
			<td class="input"><input type="text" name="name" class="inputBox" value="민병조"/></td>
		</tr>
		<tr>
			<td class="title"><label><span class="star">*</span>이메일</label></td>
			<td class="input">
			<input type="text" name="mail" class="inputBox" value="test"/>@
			<select name="domain">
			<option value="google.com">google.com</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="hotmail.com">hotmail.com</option>
			</select>
			</td>
		</tr>
		<tr>
			<td class="title"><label><span class="star">*</span>생일</label></td>
			<td class="input"><input type="date" name="birth" class="inputBox" value="2025-11-06"/></td>
		</tr>
	
		<tr>
			<td class="title"><label><span class="star">*</span>소재지</label></td>
			<td class="input"><select name="loc" class="inputBox" style="width: 120px;height: 25px">
					<option value="N/A">선택해주세요</option>
					<option value="강원">강원</option>
					<option value="경기">경기</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
					<option value="광주">광주</option>
					<option value="대구">대구</option>
					<option value="대전">대전</option>
					<option value="부산">부산</option>
					<option value="서울" selected="selected">서울</option>
					<option value="울산">울산</option>
					<option value="인천">인천</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="제주">제주</option>
					<option value="충남">충남</option>
					<option value="충북">충북</option>
					<option value="제주">제주</option>
					<option value="해외">해외</option>
			</select></td>
		</tr>
		<tr>
		<td class="title">소개</td>
		<td><textarea name="intro" style="width: 400px;height: 100px">내소개</textarea></td>
		</tr>
		<tr>
		<td class="title">관심언어</td>
		<td>
		<input type="checkbox" name="language" value="java"/> 자바
		<input type="checkbox" name="language" value="C"/> C/C++
		<input type="checkbox" name="language" value="visual basic"/>비주얼베이직
		<input type="checkbox" name="language" value="PyThon"/>파이썬
		<input type="checkbox" name="language" value="PHP"/>PHP
		<input type="checkbox" name="language" value="JSP"/>JSP
		</td>
		</tr>
		<tr>
		<td colspan="2" style="text-align: center">
		<input type="hidden" name="code" value="U3881">
		<input type="button" value="값 전송" class="btn btn-success" id="btn"/>
		</td>
		</tr>
	</table>
	</form>
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