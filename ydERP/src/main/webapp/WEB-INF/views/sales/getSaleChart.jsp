<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
	<head>
		<title>getSaleChart.jsp</title>
		<link rel="stylesheet" type="text/css" media="screen"
			href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
		<script
			src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
			type="text/javascript"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script src="./scripts/json.min.js"></script>
		<script>
		google.charts.load("current", {packages:['corechart']});
	    google.charts.setOnLoadCallback(drawSaleChart);
	    google.charts.setOnLoadCallback(drawProfitChart);
	    google.charts.setOnLoadCallback(drawTopItemChart);
	    google.charts.setOnLoadCallback(drawTopCustomerChart);
	    
	    /* 매출 차트 그리기 */
	    function drawSaleChart() {
	    	var selectSaleYear = $("#selectSaleYear").val();								// JAVASCRIPT
	    	var selectSaleMonth = document.getElementById("selectSaleMonth").value;			// DOM
	    	if(selectSaleYear == "") {selectSaleYear = "2018";}
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
						width: 500,
				        height: 500,
				        bar: {groupWidth: "50%"},
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
	    	if(selectProfitYear == "") {selectProfitYear = "2018";}
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
						title : '[순이익]',
						width: 500,
				        height: 500,
				        bar: {groupWidth: "25%"},
				        legend: { position: "bottom" }
					};
					console.log(profitChartData);
					var profitChart = new google.visualization.ColumnChart(document.getElementById("profitChartDiv"));
					profitChart.draw(google.visualization.arrayToDataTable(profitChartData), profitChartOptions);
				}
	    	})
	    }
	    
	    /* 품목별 판매량 Top 차트 그리기 */
	    function drawTopItemChart() {
	    	var selectTopItemYear = $("#selectTopItemYear").val();
	    	var selectTopItemMonth = $("#selectTopItemMonth").val();
	    	if(selectTopItemYear == "") {selectTopItemYear == "2018";}
	    	var param = {selectTopItemYear:selectTopItemYear,selectTopItemMonth:selectTopItemMonth}
	    	
	    	$.ajax({
	    		url : "./getTopItemChart.do",
	    		data : param,
	    		method : "POST",
	    		type : "json",
	    		success : function(datas) {
	    			var topItemChartData = [];
	    			topItemChartData.push(["품목명", "판매량"]);
	    			for (i = 0; i < datas.length; i++) {
	    				topItemChartData.push([datas[i].saleItem, datas[i].saleQty]);
	    			};
	    			var topItemChartOptions = {
	    					title : '[품목별 판매량 Top]',
	    					width : 500,
	    					height : 500,
	    					bar : {groupWidth : "100%"},
	    					legend: {position: "bottom" },
	    					is3D : true
	    			}
	    		console.log(topItemChartData);
	    		var topItemChart = new google.visualization.PieChart(document.getElementById('topItemChartDiv'));
	    		topItemChart.draw(google.visualization.arrayToDataTable(topItemChartData), topItemChartOptions);
	    	}
	    })
	  }
	    
	 /* 판매처별 판매량 Top 차트 그리기 */
	function drawTopCustomerChart() {
		var selectTopCustomerYear = $("#selectTopCustomerYear").val();
	   	var selectTopCustomerMonth = $("#selectTopCustomerMonth").val();
	    if(selectTopCustomerYear == "") {selectTopCustomerYear == "2018";}
	    	var param = {selectTopCustomerYear:selectTopCustomerYear,selectTopCustomerMonth:selectTopCustomerMonth}
	    	
	    	$.ajax({
	    		url : "./getTopCustomerChart.do",
	    		data : param,
	    		method : "POST",
	    		type : "json",
	    		success : function(datas) {
	    			var topCustomerChartData = [];
	    			topCustomerChartData.push(["판매처", "판매량"]);
	    			for (i = 0; i < datas.length; i++) {
	    				topCustomerChartData.push([datas[i].customerName, datas[i].saleQty]);
	    			};
	    			var topCustomerChartOptions = {
	    					title : '[판매처별 판매량 Top]',
	    					width : 500,
	    					height : 500,
	    					bar : {groupWidth : "100%"},
	    					legend: {position: "bottom" },
	    					is3D : true
	    			}
	    		console.log(topCustomerChartData);
	    		var topCustomerChart = new google.visualization.PieChart(document.getElementById('topCustomerChartDiv'));
	    		topCustomerChart.draw(google.visualization.arrayToDataTable(topCustomerChartData), topCustomerChartOptions);
	    	}
	    })
	  }
	  </script>
	  <style>
	  	#saleChartDiv, #profitChartDiv, #topItemChartDiv, #topCustomerChartDiv {
	  		margin-bottom: 25px;
	  		margin-top: 25px;
	  	}
	  	
	  	#saleChartCol, #profitChartCol, #topItemChartCol, #topCustomerChartCol {
	  		margin-top : 25px;
	  		background-color: #ffffff;
	  		border-color : black;
	  		border-style: 4px solid black;
	  	}
	  	
	  	.chartSpan {
			background-color : #000000;
			color : #FFFFFF;
		}
	  </style>
	</head>
	<body>
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">차트 [getSaleCharts.jsp] </div>
				<div class="container">
					<div class="row">
						<div id="saleChartCol" class="col-lg-6">
							<span class="chartSpan">[매출 차트]</span> 기준 기간 선택 : 
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
							<div id="saleChartDiv" class="col-lg-6" style="width: 900px; height: 500px;"></div>
						</div>
						<div id="profitChartCol" class="col-lg-6">
							<span class="chartSpan">[순이익 차트]</span> 기준 기간 선택 : 
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
							<div id="profitChartDiv" class="col-lg-6" style="width: 500px; height: 500px;"></div>
						</div>
					</div>
					<div class="row">
						<div id="topItemChartCol" class="col-lg-6">
							<span class="chartSpan">[품목별 판매량 TOP 차트]</span> 기준 기간 선택 : 
							<select id="selectTopItemYear" onchange="drawTopItemChart()">
								<c:forEach begin="2018" end="2018" var="year">
									<option value="${year}">${year}년</option>
								</c:forEach>
							</select>
							<select id="selectTopItemMonth" onchange="drawTopItemChart()">
									<option value="">전체</option>
								<c:forEach begin="1" end="12" var="month">
									<option value="${month}">${month}월</option>
								</c:forEach>
							</select>
							<div id="topItemChartDiv" class="col-lg-6" style="width: 500px; height: 500px;"></div>
						</div>
						<div id="topCustomerChartCol" class="col-lg-6">
							<span class="chartSpan">[판매처별 판매량 TOP 차트]</span> 기준 기간 선택 : 
							<select id="selectTopCustomerYear" onchange="drawTopCustomerChart()">
								<c:forEach begin="2018" end="2018" var="year">
									<option value="${year}">${year}년</option>
								</c:forEach>
							</select>
							<select id="selectTopCustomerMonth" onchange="drawTopCustomerChart()">
									<option value="">전체</option>
								<c:forEach begin="1" end="12" var="month">
									<option value="${month}">${month}월</option>
								</c:forEach>
							</select>
							<div id="topCustomerChartDiv" class="col-lg-6" style="width: 500px; height: 500px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</body>
</html>