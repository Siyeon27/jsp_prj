<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#btnGet").click(function(){
		location.href="request_b.jsp";
	});
	$("#btnGet2").click(function(){
		$("#getFrm").submit();
	});
	$("#btnPost").click(function(){
		$("#postFrm").submit();
	});
});//ready

</script>
</head>
<body>
<div id="get">
<strong>GET방식</strong><br>
<a href="request_b.jsp">GET링크요청</a><br>
<input type="button" value="GET location요청" id="btnGet" class="btn btn-success">
<form action="request_b.jsp" method="get" id="getFrm">
<input type="button" value="GET Form submit 요청" class="btn btn-info" id="btnGet2">  
</form> 
</div>
<div>
<strong>POST방식</strong><br>
<form action="request_b.jsp" method="post" id="postFrm">
<input type="button" value="POST Form submit 요청" class="btn btn-info" 
	id="btnPost">  
</form> 

</div>
</body>
</html>