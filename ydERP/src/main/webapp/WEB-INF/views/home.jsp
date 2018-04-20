<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script>
	function logoutcheck() {
		location.href = 'logout';
	}
</script>
</head>
<body>
	<hr>
	YedamERP 메인페이지입니다.<br>
	<%-- <%@ include file="./stocks/getCharts.jsp"%> --%>

	
	<!-- jstl 코어 태그 -->


			<a href="login" type="button">로그인하러가기</a>




	<hr>

</body>
</html>


