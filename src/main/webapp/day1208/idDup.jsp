<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.user.member.WebMemberSerivce"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String id=request.getParameter("id");

WebMemberSerivce wms=WebMemberSerivce.getInstance();
boolean flag=wms.searchId(id);//사용가능 true, 사용불가 false

//입력된 아이디가 사용중인지의 결과를 받아와서 JSONObject에 넣고 응답
JSONObject jsonObj=new JSONObject();
jsonObj.put("idResult", flag);
out.print( jsonObj.toJSONString() );
%>