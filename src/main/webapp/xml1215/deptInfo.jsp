<%@page import="day1215.CreateDeptXML"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.emp.DeptDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.emp.EmployeeDAO"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
EmployeeDAO eDAO=EmployeeDAO.getInstance();
try {
	List<DeptDTO> list=eDAO.selectAllDept();
	CreateDeptXML cdXML=new CreateDeptXML();
	cdXML.createXml(list,out);
} catch (SQLException e) {
	e.printStackTrace();
}
%>