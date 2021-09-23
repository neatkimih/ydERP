<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function logoutcheck() {
		location.href = 'logout';
	}
</script>

<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">
			<li class="sidebar-search">
				<div class="input-group custom-search-form">
					<c:if test="${not empty sessionScope.viewCustomer.customerCode }">
						${sessionScope.viewCustomer.customerName}�� ȯ���մϴ�.<br>
						<input class="btn btn-primary" type="button" name="logout"
							value="�α׾ƿ�" onclick="logoutcheck()" />
					</c:if>
				</div>

				<div class="input-group custom-search-form">
					<!-- <input type="text" class="form-control" placeholder="Search..."> -->
					<!-- <span class="input-group-btn"> -->
					<!-- <button class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button> -->
					<!-- </span> -->
				</div> <!-- /input-group -->
			</li>


			<c:if
				test="${not empty sessionScope.viewCustomer.customerCode && sessionScope.viewCustomer.customerCode!='admin12345'}">
				<li><a href="getPurchaseRequestForm">�Ǹž�ü ���Ž�û</a></li>
			</c:if>
			<c:if test="${sessionScope.viewCustomer.customerCode=='admin12345'}">
				<li><a href="index.html"><i class="fa fa-info fa-fw"></i>
						������������<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="getItemsList">ǰ������</a></li>
						<li><a href="manageVendorForm">���ž�ü ����</a></li>
						<li><a href="manageCustomerForm">�Ǹž�ü ����</a></li>
						<li><a href="getSalesRequesting">�Ǹ��ֹ���û����</a></li>

					</ul></li>
				<%@ include file="./defaultMenu2.jsp"%>
				<li><a href="tables.html"><i class="fa fa-krw fa-fw"></i>
						�Ǹ�����<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="getOrderList">�ֹ�����</a></li>
						<li><a href="getSaleList">�Ǹų���</a></li>
						<li><a href="getSaleChart">�Ǹ���Ʈ</a></li>
					</ul></li>
				<%@ include file="./defaultMenu4.jsp"%>
				<%@ include file="./defaultMenu5.jsp"%>
			</c:if>
		</ul>
	</div>
</div>