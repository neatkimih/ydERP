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

<!--  <script>
	if ('${sessionScope.viewCustomer.customerName}' == '') {
		location.href = 'login';
	}

	function logoutcheck() {
		location.href = 'logout';
	}
</script> -->

<link rel='stylesheet' type='text/css'
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css" />

<link rel='stylesheet' type='text/css'
	href="${pageContext.request.contextPath}/resources/fullcalendar/scheduler.min.css" />
<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>


<script>
	$(document).ready(function() {

		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

		$('#calendar').fullCalendar({
			editable : true,
			events : [ {
				title : 'All Day Event',
				start : new Date(y, m, 1)
			}, {
				title : 'Long Event',
				start : new Date(y, m, d - 5),
				end : new Date(y, m, d - 2)
			}, {
				id : 999,
				title : 'Repeating Event',
				start : new Date(y, m, d - 3, 16, 0),
				allDay : false
			}, {
				id : 999,
				title : 'Repeating Event',
				start : new Date(y, m, d + 4, 16, 0),
				allDay : false
			}, {
				title : 'Meeting',
				start : new Date(y, m, d, 10, 30),
				allDay : false
			}, {
				title : 'Lunch',
				start : new Date(y, m, d, 12, 0),
				end : new Date(y, m, d, 14, 0),
				allDay : false
			}, {
				title : 'Birthday Party',
				start : new Date(y, m, d + 1, 19, 0),
				end : new Date(y, m, d + 1, 22, 30),
				allDay : false
			}, {
				title : 'Click for Google',
				start : new Date(y, m, 28),
				end : new Date(y, m, 29),
				url : 'http://google.com/'
			} ]
		});

	});
</script>
<script>
	$(function() {
		var j;

		$.ajax({
			url : "./getTitle1.do",
			//data : params,
			//async : false,
			dataType : "json",
			success : function(datas) {
				for (i = 0; i < datas.length; i++) {
					j = i + 1;
					$("#vcnt_" + j + "").text(datas[i].cnt);
					$("#vtitle_" + j + "").text(datas[i].title);
					$("#vdetail_" + j + "").text(datas[i].detailView);
				}
			}
		});
	});
</script>


</head>
<body>

	<div class="row">
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-barcode fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge" id="vcnt_1">26</div>
							<div id="vtitle_1">New Customer</div>
						</div>
					</div>
				</div>
				<a href="getSalesRequesting">
					<div class="panel-footer">
						<span class="pull-left" id="vdetail_1">View Detail</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-green">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-check fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge" id="vcnt_2">12</div>
							<div id="vtitle_2">New Tasks!</div>
						</div>
					</div>
				</div>
				<a href="getPurchaseRequesting">
					<div class="panel-footer">
						<span class="pull-left" id="vdetail_2">View Details2</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-yellow">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-shopping-cart fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge" id="vcnt_3">124</div>
							<div id="vtitle_3">New Orders!</div>
						</div>
					</div>
				</div>
				<a href="getPurchaseReceipting">
					<div class="panel-footer">
						<span class="pull-left" id="vdetail_3">View Details3</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-red">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa fa-truck fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge" id="vcnt_4">13</div>
							<div id="vtitle_4">Support Tickets!</div>
						</div>
					</div>
				</div>
				<a href="getOrderList">
					<div class="panel-footer">
						<span class="pull-left" id="vdetail_4">View Details4</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<div id='calendar' style="width: 800px; display: inline-block;"></div>



</body>
</html>
