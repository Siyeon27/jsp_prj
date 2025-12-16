<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.sist.user.member.LoginDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../fragments/siteProperty.jsp" %>  
<%

LoginDTO[] lDTOArr={new LoginDTO("kim","1234"),new LoginDTO("lee","4321")
		,new LoginDTO("park","q1w2e3r4!"),new LoginDTO("min","password")};
//1. 데이터와 부가적인 정보를 가지는 JSONObject 생성
JSONObject jsonObj=new JSONObject();

//2. 데이터에 대한 부가적인 정보를 추가
jsonObj.put("pubDate",new SimpleDateFormat("yyyy-MM-dd EEEE").format(new Date()));
jsonObj.put("auth","민병조");
jsonObj.put("dataSize", lDTOArr.length);

//3.데이터를 JSONObject에 할당하고, JSONArray에 추가
//3-1. JSONArray생성
	JSONArray jsonArr=new JSONArray();
	JSONObject jsonTemp=null;
	
	for(LoginDTO lDTO : lDTOArr){
		//3-2.JSONArray에 추가할 JSONObject 생성
		jsonTemp=new JSONObject();
		jsonTemp.put("id",lDTO.getId());
		jsonTemp.put("pass",lDTO.getPassword());
		
		//3-3.JSONObject을 JSONArray에 추가
		jsonArr.add( jsonTemp );
	}//end for
//데이터 추가
jsonObj.put("data", jsonArr );
			
//출력
out.print( jsonObj.toJSONString() );
%>