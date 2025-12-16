<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
  
<%
//1.JSONObject 생성
JSONObject jsonObj=new JSONObject();
//2.값할당
jsonObj.put("name","민병조");
jsonObj.put("age",25);
jsonObj.put("flag",true);
jsonObj.put("date",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
//3.출력
//out.print( jsonObj );
out.print( jsonObj.toJSONString() );
%>