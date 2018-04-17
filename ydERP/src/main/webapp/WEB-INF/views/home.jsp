<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<title>Welcome!!! YedamERP</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />

<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>



</head>
<body>
	<hr>
	YedamERP 메인페이지입니다. TEST
	<%-- <%@ include file="./stocks/getCharts.jsp"%> --%>

    <c:if test="${msg == 'success'}">
    <h2>${sessionScope.CustomerName}(${sessionScope.CustomerOwner})님 환영합니다.</h2>
    </c:if>
    
<!-- jstl 코어 태그 -->
<c:choose>
    <c:when test="${sessionScope.customerCode == null}">
       <a href="login"><button class="btn btn-primary" type="button"
				>로그인</button></a>
    </c:when>
    <c:otherwise>
        ${sessionScope.customerCode}님이 로그인중입니다.
        <a href="${path}/items/logout">로그아웃</a>
    </c:otherwise>
</c:choose>
    
<hr>
    
</body>
</html>
 

