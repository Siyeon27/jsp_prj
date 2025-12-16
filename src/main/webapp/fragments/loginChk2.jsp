<%@ page language="java" pageEncoding="UTF-8"%>
<c:if test="${ sessionScope.userId == null }">
<c:redirect url="${ CommonURL }/login/loginFrm.jsp"/>
</c:if> 
