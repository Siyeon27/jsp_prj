<%@page import="kr.co.sist.emp.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String paramDeptno=request.getParameter("deptno");

int deptno=0;
if(paramDeptno != null){
	deptno=Integer.parseInt(paramDeptno);
}//end if

EmployeeService es=EmployeeService.getInstance();
out.print(es.searchEmp(deptno));
%>

