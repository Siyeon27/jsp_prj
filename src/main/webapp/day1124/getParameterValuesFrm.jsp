<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="http://192.168.10.68/html_prj/common/images/favicon.ico">
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 내가만든 CSS -->
<!-- <link rel="stylesheet" type="text/css" href="http://192.168.10.68/html_prj/common/css/main_v251031.css"/> -->

<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->

<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#header{ height: 150px;	 }	
#container{ height: 700px;	 }	
#footer{ height: 150px;}	
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
function getSend(){
	//JavaScript 에서는 요청 방식을 변경할 수 있다.
	document.frm.method="GET";
	//유효성 검증 
	var lang=document.frm.language;
	for(var i=0 ; i< lang.length ; i++){
		if( !lang[i].checked ){
			lang[i].checked=true;
			lang[i].value='N';
		}
	}
	$("#frm").submit(); // jQuery를 사용한 이동
}//getSend
function postSend(){
	document.frm.method="POST"; 
	document.frm.submit(); // JS을 사용한 이동
}//getSend
</script>

<script type="text/javascript">
$(function(){
	$("#btnGet").click(getSend);
	$("#btnPost").click(postSend);
});//ready
//var cnt=1;
function append(){
	//cnt++;
	var cnt= $("#licenseDiv div").length + 1;
	
	if(cnt > 5){
		alert("자격증은 5개까지만 입력할 수 있습니다. ");
		return;
	}//end if
var appendNode=`<div style="margin-top:10px">
	<label>`+ cnt +`.</label>
	<input type="text" name="license" style="width: 350px">
	</div>`;
	
	$("#licenseDiv").append( appendNode );
}


function remove(){
	//cnt--;
	
	if($("#licenseDiv div").length != 1){
		$("#licenseDiv div:last").remove( );
	}//end if
	
}

</script>
</head>
<body>
<div id="wrap">
	<div id="header">header 1200(w) x 150(h)
			사이트로고, 주력서비스, navigation bar
	 </div>
	<div id="container">
	<div id="div">
	</div>
	
	<div style="width:480px">
	<form action="getParameterValuesFrmProcess.jsp" id="frm" name="frm" method="get">
	<strong> 상황에 따라 GET 또는 POST 변환되는 방식 </strong>
	<label>관심언어</label>
	<input type="checkbox" name="language" value="java"/> 자바
	<input type="checkbox" name="language" value="C"/> C/C++
	<input type="checkbox" name="language" value="visual basic"/>비주얼베이직
	<input type="checkbox" name="language" value="PyThon"/>파이썬
	<input type="checkbox" name="language" value="PHP"/>PHP
	<input type="checkbox" name="language" value="JSP"/>JSP
	<br>
	<div style="text-align: right;">
	<a href="#void" onclick="append()"><img src="images/btn_append.png"></a>
	<a href="#void" onclick="remove()"><img src="images/btn_remove.png"></a>
	</div>
	<div id="licenseDiv">
		<div><label>자격사항</label><br>
		
			<label>1.</label> <input type="text" name="license" style="width: 350px">
		</div>
	</div>
	<input type="button" value="GET전송" class="btn btn-success" id="btnGet"/>
	<input type="button" value="POST전송" class="btn btn-success" id="btnPost"/>
	</form>
	</div>
	
	</div>
	<div id="footer">footer 1200(w) x 150(h)</div>
</div>
</body>
</html>