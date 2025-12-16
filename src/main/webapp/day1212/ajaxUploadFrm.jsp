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

<title>AJAX파일업로드</title>
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
	$("#btnFile").click(function(){
		$("#upfile").click(); //파일을 선택하면 파일이 변경 ( change event 발생)
	});//click
	
	$("#upfile").change(function( evt ){
		
		//미리보기
		//1.  HTML File Control 접근
		var file= evt.target.files[0]; //<input type="file"
		//2. 파일을 읽기위한 스트림 생성
		var reader=new FileReader();
		//3. File객체의 onload 이벤트 핸들러를 설정하여 <img 태그에 src속성에 파일명을 설정
		reader.onload=function( evt ){
			$("#preview").prop("src",evt.target.result);
		}//end if
		//4.스트림을 사용하여 <img 태그 이미지를 로딩
		reader.readAsDataURL( file );
		
		//파일이 변경되면 변경된 파일명을 div에 넣는다.
		$("#selectFile").html($("#upfile").val());
	});
	
	
	$("#btnUpload").click(function(){
		
		if($("#uploader").val() == ""){
			alert("업로더는 필수 입력!!!");
			return;
		}//end if
		
		if($("#upfile").val() == ""){
			alert("파일을 선택해주세요.!!!");
			return;
		}//end if
		
		$("#frm").submit();
	});
	
	//파일 업로드 버튼이 클릭
	$("#btnFileUpload").click(function(){
		
		if( $("#upfile").val() == ""){
			alert("파일을 선택해주세요.!!!");
			return;
		}//end if
		
		//AJAX로 파일 업로드.
		var form=$("#frm")[0]; //파라메터 전송방식
		var formData=new FormData( form ); //파라메터 전송방식 -> binary전송 방식
		
		$.ajax({
			url:"ajaxFileProcess.jsp",
			contentType:false,/* ajax의 요청방식을 binary전송 방식으로 변경 */
			processData:false,/* ajax요청에 query string 붙지 않게 막기   */
			type:"post",
			data: formData, /* binary전송 방식으로 설정된 form */
			dataType:"JSON",
			error : function( xhr ){
				alert("파일 전송시 문제 발생");
				console.log( xhr.status );
			},
			success: function( jsonObj ){
				if( jsonObj.resultFlag ){
					alert("이미지가 업로드 되었습니다.");
					$("#profile").val( jsonObj.uploadName );
				}else{
					alert("이미지 업로드 실패.");
				}//end else
			}
		});//ajax
		
	});//click
	
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
					<h2>AJAX 파일업로드</h2>
					<!--
					  enctype="application/x-www-form-urlencoded" 파라메터전송방식
					  enctype="multipart/form-data" binary전송방식
					 -->
					<form action="ajaxUploadFrmProcess.jsp" method="post" id="frm">
					<label>업로더</label>
					<input type="text" name="uploader" id="uploader"><br/>
					<label>대상 연령</label>
					<c:forEach var="age" begin="10" end="80" step="10">
					<input type="checkbox" name="age" value="${ age }">
					<c:out value="${ age }대"/>
					</c:forEach>
					<br>
					<label>파일</label><br>
					<img src="../upload/default_img.png" id="preview"
					style="width: 100px;height: 100px;border-radius: 50px"/>
					<input type="button" value="파일선택" id="btnFile" class="btn btn-primary btn-sm"/><br>
					<input type="button" value="파일업로드" id="btnFileUpload" class="btn btn-info btn-sm"/><br>
					
					<div id="selectFile"></div>
					
					<!-- <input type="file" accept=".jpg, .gif, .png, .bmp" name="upfile" id="upfile" style="display: none" /><br> -->
					<input type="file" accept="image/*" name="upfile" id="upfile" style="display: none" /><br>
					<input type="hidden" name="profile" id="profile"/>
					<input type="button" value="정보입력" class="btn btn-success btn-sm" id="btnUpload"/><br>
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