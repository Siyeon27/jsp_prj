<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통디자인 외부 파일방식으로 사용 -->
<link rel="stylesheet" type="text/css" href="http://192.168.10.68/html_prj/common/css/main_v251031.css"/>

<style type="text/css">
/* 이 페이지에서만 사용하는 디자인 정의 */
#agreement{ border: 1px solid #E5E5E5; width: 1400px; height: 180px;
	overflow: auto; margin-bottom: 20px }
/* wrap을 가운데로 위치  */
#wrap{ width: 1500px; margin:  0px auto }

.star{ color : #FF0000 }

#joinFrm{ border-top:4px solid #888888;border-spacing: 0px }
td,th{ border-bottom: 1px solid #E1E3E4  }
tr { height: 40px }
.title{ background-color: #F9F8F8 ; width: 150px; font-weight: bold ;font-size: 16px}
.input{ background-color: #FFFFFF; width: 1250px }

#output{ border: 1px solid #333; width: 600px; height: 400px; overflow: auto}
	
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	
	$("#btnGet").click(function(){
		//입력 값에 대한 유효성검증.
		$("#joinFrm").submit();
	});
	$("#btnPost").click(function(){
		//입력 값에 대한 유효성검증.
		$("#joinFrm2").submit();
	});
	
});//ready

</script>
</head>
<body>
<div id="wrap">

<div id="joinFrmDiv">
	<form name="joinFrm" id="joinFrm" action="getParameterFormProcess.jsp"> 
	<table id="joinFrm">
		<tr>
			<td class="title"><label><span class="star">*</span>아이디</label></td>
			<td class="input"><input type="text" class="inputBox" name="id" value="testsdfg"/></td>
		</tr>

		<tr>
			<td class="title"><label><span class="star">*</span>비밀번호</label></td>
			<td class="input"><input type="password" class="inputBox" name="pass" value="minjo123"/>
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
		<td colspan="2" style="text-align: center">
		<input type="hidden" name="code" value="U3881">
		<input type="button" value="GET방식 값 전송" class="btnBox" id="btnGet"/>
		</td>
		</tr>
	</table>
	</form>
	<hr>
	<form name="joinFrm2" id="joinFrm2" method="post" action="getParameterFormProcess.jsp"> 
	<table id="joinFrm">
		<tr>
			<td class="title"><label><span class="star">*</span>아이디</label></td>
			<td class="input"><input type="text" class="inputBox" name="id" value="testsdfg"/></td>
		</tr>

		<tr>
			<td class="title"><label><span class="star">*</span>비밀번호</label></td>
			<td class="input"><input type="password" class="inputBox" name="pass" value="minjo123"/>
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
		<td colspan="2" style="text-align: center">
		<input type="hidden" name="code" value="U3881">
		<input type="button" value="POST방식 값 전송" class="btnBox" id="btnPost"/>
		</td>
		</tr>
	</table>
	</form>
	
	</div>
</div>
</body>
</html>