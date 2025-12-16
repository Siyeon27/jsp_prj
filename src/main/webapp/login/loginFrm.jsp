<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../fragments/siteProperty.jsp" %>  
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>로그인</title>
<link rel="shortcut icon" href="http://192.168.10.68/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.68/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		if($("#id").val() == ""){
			alert("아이디는 필수 입력!");
			return;
		}//end if
		if($("#password").val() == ""){
			alert("비밀번호는 필수 입력!");
			return;
		}//end if
		$("#loginFrm").submit();
	});
});//ready
</script>

<link href="http://192.168.10.68/jsp_prj/common/css/sign-in.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem
	}
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: #0000001a;
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em #0000001a, inset 0 .125em .5em #00000026
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh
}

.bi {
	vertical-align: -.125em;
	fill: currentColor
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch
}

.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8
}

.bd-mode-toggle {
	z-index: 1500
}

.bd-mode-toggle .bi {
	width: 1em;
	height: 1em
}

.bd-mode-toggle .dropdown-menu .active .bi {
	display: block !important
}
</style>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">

	<main class="form-signin w-100 m-auto">
		<form id="loginFrm" name="loginFrm" action="${ CommonURL }/login/loginFrmProcess.jsp" method="post">
			<img class="mb-4" src="${ CommonURL }/common/images/sist.png"
				alt="" >
			<h1 class="h3 mb-3 fw-normal">로그인</h1>
			<div class="form-floating">
				<input type="text" class="form-control" id="id"
				  name="id"
					placeholder="아이디"> 
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="password"
				    name="password"	placeholder="비밀번호">
			</div>
		
			<button class="btn btn-primary w-100 py-2" onclick="return false;" type="submit" id="btn">로그인</button>
			<div>
			<a href="http://localhost/jsp_prj/day1128/usebeanParamForm.jsp">회원가입</a>
			</div>
		</form>
	</main>
	
</body>
</html>