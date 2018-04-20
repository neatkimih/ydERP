<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
	<head>
		<title>getSaleChart.jsp</title>
		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
		<script src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"	type="text/javascript"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script src="./scripts/json.min.js"></script>
		<script>
		google.charts.load("current", {packages:['corechart']});
	    google.charts.setOnLoadCallback(drawSaleChart);
	    google.charts.setOnLoadCallback(drawProfitChart);
	    
	    /* 매출 차트 그리기 */
	    function drawSaleChart() {
	    	var selectSaleYear = $("#selectSaleYear").val();								// JAVASCRIPT
	    	var selectSaleMonth = document.getElementById("selectSaleMonth").value;			// DOM
	    	if(selectSaleYear == "") {
	    		selectSaleYear = "2018";
	    	}
	    	var param = {selectSaleYear:selectSaleYear,selectSaleMonth:selectSaleMonth}
	    	
	    	$.ajax({
	    		url : "./getSaleChart.do",
	    		data : param,
				method : "POST",
				type : "json",
				success : function(datas) {
					var saleChartData = [];
					saleChartData.push([ "기간", "매출"]);
					for (i = 0; i < datas.length; i++) {
						saleChartData.push([datas[i].saleDay, datas[i].saleSum ]);
					};
					var saleChartOptions = {
						title : '[매출]',
						width: 600,
				        height: 400,
				        bar: {groupWidth: "95%"},
				        legend: { position: "bottom" }
					};
/* 
					var saleChartView = new google.visualization.DataView(data);
				      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]); */
					console.log(saleChartData);
					var saleChart = new google.visualization.ColumnChart(document.getElementById("saleChartDiv"));
					saleChart.draw(google.visualization.arrayToDataTable(saleChartData), saleChartOptions);
				}
	    	})
	    }
	    
	    /* 순이익 차트 그리기 */
	    function drawProfitChart() {
	    	var selectProfitYear = $("#selectProfitYear").val();								// JAVASCRIPT
	    	var selectProfitMonth = document.getElementById("selectProfitMonth").value;			// DOM
	    	if(selectProfitYear == "") {
	    		selectProfitYear = "2018";
	    	}
	    	var param = {selectProfitYear:selectProfitYear,selectProfitMonth:selectProfitMonth}
	    	
	    	$.ajax({
	    		url : "./getProfitChart.do",
	    		data : param,
				method : "POST",
				type : "json",
				success : function(datas) {
					var profitChartData = [];
					profitChartData.push([ "기간", "순이익"]);
					for (i = 0; i < datas.length; i++) {
						profitChartData.push([datas[i].profitDay, datas[i].profitSum ]);
					};
					var profitChartOptions = {
						title : '[매출]',
						width: 600,
				        height: 400,
				        bar: {groupWidth: "95%"},
				        legend: { position: "bottom" }
					};
/* 
					var saleChartView = new google.visualization.DataView(data);
				      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]); */
					console.log(profitChartData);
					var profitChart = new google.visualization.ColumnChart(document.getElementById("profitChartDiv"));
					profitChart.draw(google.visualization.arrayToDataTable(profitChartData), profitChartOptions);
				}
	    	})
	    }
	  </script>
	</head>
	<body>
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">차트 [getSaleCharts.jsp] </div>
				<div class="container">
					<div class="row">
						<select id="selectSaleYear" onchange="drawSaleChart()">
							<c:forEach begin="2018" end="2018" var="year">
								<option value="${year}">${year}년</option>
							</c:forEach>
						</select>
						<select id="selectSaleMonth" onchange="drawSaleChart()">
								<option value="">전체</option>
							<c:forEach begin="1" end="12" var="month">
								<option value="${month}">${month}월</option>
							</c:forEach>
						</select>
						<div id="saleChartDiv" class="col-lg-6" style="width: 900px; height: 300px;"></div>
					</div>
					<div class="row">
						<select id="selectProfitYear" onchange="drawProfitChart()">
							<c:forEach begin="2018" end="2018" var="year">
								<option value="${year}">${year}년</option>
							</c:forEach>
						</select>
						<select id="selectProfitMonth" onchange="drawProfitChart()">
								<option value="">전체</option>
							<c:forEach begin="1" end="12" var="month">
								<option value="${month}">${month}월</option>
							</c:forEach>
						</select>
						<div id="profitChartDiv" class="col-lg-6" style="width: 900px; height: 300px;"></div>
					</div>
				</div>
			</div>
		</div>		
	</body>
</html>