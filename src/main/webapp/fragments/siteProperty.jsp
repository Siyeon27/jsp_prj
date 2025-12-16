<%@page import="kr.co.sist.siteProperty.SiteProperty"%>
<%@page import="kr.co.sist.siteProperty.SitePropertyVO"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
SitePropertyVO spVO=SiteProperty.spVO;
application.setAttribute("SiteProperty", spVO);
application.setAttribute("CommonURL", 
		spVO.getProtocol()+spVO.getServer_name()+spVO.getContext_root());
%>