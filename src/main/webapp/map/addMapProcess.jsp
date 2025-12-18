<%@page import="kr.co.sist.map.RestaurantService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../fragments/siteProperty.jsp" %>
<%@ include file="../fragments/loginChk2.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

%>

<jsp:useBean id="rDTO" class="kr.co.sist.map.RestaurantDTO" scope="page" />
<jsp:setProperty property="*" name="rDTO"/>
<%
String id=(String)session.getAttribute("userId");
rDTO.setId(id);

RestaurantService rs = RestaurantService.getInstance();

out.print(rs.addRestaurant(rDTO));
%>