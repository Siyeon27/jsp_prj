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

<title>식당 등록</title>
<link rel="shortcut icon" href="http://192.168.10.92/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.92/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.92/jsp_prj/common/css/carousel.css" rel="stylesheet">

<jsp:include page="../fragments/bootstrap_css.jsp" />

<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; min-height: 1000px; }	
#header{ height: 150px;	 }	
#container{ min-height: 700px;	 }	
#footer{ height: 150px;}
</style>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#btnAdd").click(function(){
		//입력값에 대한 유효성 검증
		var rest_name = $("#rest_name").val();
		var param = {
			rest_name: rest_name,
			menu: $("#menu").val(),
			info: $("#info").val(),
			lat: $("#lat").val(),
			lng: $("#lng").val(),
		}
		
		$.ajax({
			url: "addMapProcess.jsp",
			type: "GET",
			data: param,  
			dataType:"JSON",
			error: function(xhr){
				alert("식당 등록 실패!!");
				console.log(xhr.status);
			},
			success: function(jsonObj){
				var msg = rest_name + " 등록을 실패하셨습니다.";
				if(jsonObj.resultFlag){
					msg = rest_name + "을 성공적으로 추가하였습니다.";
					
					$("#rest_name").val("");
					$("#menu").val("");
					$("#info").val("");
					$("#lat").val("");
					$("#lng").val("");
					$("#vLat").text("");
					$("#vLng").text("");
				}
				
				alert(msg);
			}
		})
	})
});//ready

</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c5d3a0fae10d8e35ccb59548be27914"></script>
<script>
window.onload=function(){
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.504728468139334, 127.05316112695829), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    $("#vLat").text(latlng.getLat());
    $("#vLng").text(latlng.getLng());
    $("#lat").val(latlng.getLat());
    $("#lng").val(latlng.getLng());
});
}//onload
</script>
</head>
<body>
	<svg xmlns="http://www.w3.org/2000/svg" class="d-none"> <symbol
			id="check2" viewBox="0 0 16 16"> <path
			d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path> </symbol> <symbol
			id="circle-half" viewBox="0 0 16 16"> <path
			d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"></path> </symbol> <symbol
			id="moon-stars-fill" viewBox="0 0 16 16"> <path
			d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"></path> <path
			d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"></path> </symbol> <symbol
			id="sun-fill" viewBox="0 0 16 16"> <path
			d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"></path> </symbol> </svg>
	<header data-bs-theme="dark">
		<jsp:include page="../fragments/header.jsp" />
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
					<h2>맛집 등록</h2>
					<div id="map" style="width:100%;height:350px;"></div>
					
					<table>
					 <tr>
					 	<td>식당명</td>
					 	<td><input type="text" name="rest_name" id="rest_name"
					 		style="width: 350px; "></td>
					 </tr>
					 <tr>
					 	<td>대표 메뉴</td>
					 	<td><input type="text" name="menu" id="menu"
							style="width: 350px; "></td>
					 </tr>
					 <tr>
					 	<td>상세 정보</td>
					 	<td><textarea name="info" id="info" style="width:350px; height: 150px;"></textarea></td>
					 </tr>
					 <tr>
					 	<td>위도/경도</td>
					 	<td><span id="vLat"> </span>/<span id="vLng"></span>
					 		<input type="hidden" name="lat" id="lat" />
					 		<input type="hidden" name="lng" id="lng" />
					 	</td>
					 </tr>
					 <tr>
					 	<td colspan="2" style="text-align: center;">
					 		<input type="button" value="등록" id="btnAdd" class="btn btn-primary btn-sm"/>
					 		<a href="mapList.jsp" class="btn btn-info btn-sm">리스트</a></td>
					 	</td>
					 </tr>
					</table>
				</div>
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		
		<footer class="container">
		<jsp:include page="../fragments/footer.jsp" />
		</footer>
	</main>
</body>
</html>