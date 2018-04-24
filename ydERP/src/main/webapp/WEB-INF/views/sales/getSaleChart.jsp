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
		
		google.charts.load("current", {packages:['corechart']});		// 구글 차트 로드
		
		/* 차트 생성 함수 콜백 */
	    google.charts.setOnLoadCallback(drawSaleChart);					// 매출 차트
	    google.charts.setOnLoadCallback(drawProfitChart);				// 순익 차트
	    google.charts.setOnLoadCallback(drawTopItemChart);				// 품목별 판매량 TOP 차트
	    google.charts.setOnLoadCallback(drawTopCustomerChart);			// 판매처별 판매량 TOP 차트
	    
	    /* 매출 차트 그리기 */
	    function drawSaleChart() {
	    	var selectSaleYear = $("#selectSaleYear").val();								// 기준년을 받아온다. JAVASCRIPT형식
	    	var selectSaleMonth = document.getElementById("selectSaleMonth").value;			// 기준월을 받아온다. DOM형식
	    	if(selectSaleYear == "") {selectSaleYear = "2018";}								// 2018년을 기본으로 설정한다.
	    	var param = {selectSaleYear:selectSaleYear,selectSaleMonth:selectSaleMonth}		// ./getSaleChart.do에 전달할 매개변수이다.
	    	
	    	/* AJAX 타입으로 차트 데이터 설정 및 그래프 옵션을 설정한다. */
	    	$.ajax({
	    		url : "./getSaleChart.do",						// 차트 데이터를 형성하기 위한 메서드 요청 URL이다.
	    		data : param,									// 요청 URL에 전달할 매개변수이다.
				method : "POST",
				type : "json",
				success : function(datas) {
					var saleChartData = [];						// 차트 데이터를 저장할 배열이다.
					saleChartData.push([ "기간", "매출"]);		// 차트 데이터는 기간과 매출 데이터를 담고 있다.
					
					if(datas.length == 0) {	// 데이터를 가져오지 못하여 차트를 그릴 수 없는 경우
						saleChartData.push([selectSaleYear + "년 " + selectSaleMonth + "월 데이터가 없습니다.", 0]);
					} else { // 데이터를 가져와서 배열에 push(삽입)한다.
						for (i = 0; i < datas.length; i++) {
							saleChartData.push([datas[i].saleDay, datas[i].saleSum ]);
						};
					}
					
					/* 그래프 옵션 */
					var saleChartOptions = {
						title : '[매출]',
						width: 1500,
				        height: 500,
				        bar: {groupWidth: "50%"},
				        legend: { position: "right" }
					};
					
					console.log(saleChartData);
					
					// 차트를 그릴 위치의 태그 ID를 받아온다.
					var saleChart = new google.visualization.ColumnChart(document.getElementById("saleChartDiv"));
					
					// 차트를 그린다.
					saleChart.draw(google.visualization.arrayToDataTable(saleChartData), saleChartOptions);
					
					// 반응형 차트 그리기
					window.addEventListener	(
						'resize',
						function() {
							saleChart.draw(google.visualization.arrayToDataTable(saleChartData), saleChartOptions);
						},
						false
					);
				}
	    	})
	    }
	    
	    /* 순이익 차트 그리기 */
	    function drawProfitChart() {
	    	var selectProfitYear = $("#selectProfitYear").val();								// 기준년을 받아온다. JAVASCRIPT형식
	    	var selectProfitMonth = document.getElementById("selectProfitMonth").value;			// 기준월을 받아온다. DOM형식
	    	if(selectProfitYear == "") {selectProfitYear = "2018";}								// 2018년을 기본으로 설정한다.
	    	var param = {selectProfitYear:selectProfitYear,selectProfitMonth:selectProfitMonth}	// ./getProfitChart.do에 전달할 매개변수이다.
	    	
	    	$.ajax({
	    		url : "./getProfitChart.do",
	    		data : param,
				method : "POST",
				type : "json",
				success : function(datas) {
					var profitChartData = [];
					profitChartData.push([ "기간", "순이익"]);
					if(datas.length == 0) {
						profitChartData.push([selectProfitYear + "년 " + selectProfitMonth + "월 데이터가 없습니다.", 0]);
					} else {
						for (i = 0; i < datas.length; i++) {
							profitChartData.push([datas[i].profitDay, datas[i].profitSum ]);
						};
					}
					var profitChartOptions = {
						title : '[순이익]',
						width: 1500,
				        height: 500,
				        bar: {groupWidth: "50%"},
				        legend: { position: "right" }
					};
					console.log(profitChartData);
					var profitChart = new google.visualization.ColumnChart(document.getElementById("profitChartDiv"));
					profitChart.draw(google.visualization.arrayToDataTable(profitChartData), profitChartOptions);
					
					// 반응형 차트 그리기
					window.addEventListener	(
						'resize',
						function() {
							profitChart.draw(google.visualization.arrayToDataTable(profitChartData), profitChartOptions);
						},
						false
					);
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
	    			if(datas.length == 0) {
	    				topItemChartData.push([selectTopItemYear + "년 " + selectTopItemMonth + "월 데이터가 없습니다.", 0]);
					} else {
		    			for (i = 0; i < datas.length; i++) {
		    				topItemChartData.push([datas[i].saleItem, datas[i].saleQty]);
		    			};
					}
	    			var topItemChartOptions = {
	    					title : '[품목별 판매량 Top]',
	    					width : 1500,
	    					height : 500,
	    					bar : {groupWidth : "100%"},
	    					legend: {position: "bottom" },
	    					is3D : true,
	    					pieSliceText: 'label',
	    					slices: {  0: {offset: 0.2} }
	    			}
	    		console.log(topItemChartData);
	    		var topItemChart = new google.visualization.PieChart(document.getElementById('topItemChartDiv'));
	    		topItemChart.draw(google.visualization.arrayToDataTable(topItemChartData), topItemChartOptions);
	    		
	    		// 반응형 차트 그리기
				window.addEventListener	(
					'resize',
					function() {
						topItemChart.draw(google.visualization.arrayToDataTable(topItemChartData), topItemChartOptions);
					},
					false
				);
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
	    			if(datas.length == 0) {
	    				document.getElementById('topCustomerChartDiv').value(selectTopCustomerYear + "년 " + selectTopCustomerMonth + "월 데이터가 없습니다.");
	    				//topCustomerChartData.push([selectTopCustomerYear + "년 " + selectTopCustomerMonth + "월 데이터가 없습니다.", 0]);
					} else {
		    			for (i = 0; i < datas.length; i++) {
		    				topCustomerChartData.push([datas[i].customerName, datas[i].saleQty]);
		    			};
					}
	    			var topCustomerChartOptions = {
	    					title : '[판매처별 판매량 Top]',
	    					width : 1500,
	    					height : 500,
	    					bar : {groupWidth : "100%"},
	    					legend: {position: "bottom" },
	    					is3D : true,
	    					pieSliceText: 'label',
	    					slices: {  0: {offset: 0.2} }
	    			}
	    		console.log(topCustomerChartData);
	    		var topCustomerChart = new google.visualization.PieChart(document.getElementById('topCustomerChartDiv'));
	    		topCustomerChart.draw(google.visualization.arrayToDataTable(topCustomerChartData), topCustomerChartOptions);
	    		
	    		// 반응형 차트 그리기
				window.addEventListener	(
					'resize',
					function() {
						topCustomerChart.draw(google.visualization.arrayToDataTable(topCustomerChartData), topCustomerChartOptions);
					},
					false
				);
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
	  	
	  	.rowDiv {
	  		margin-bottom : 25px;
	  		margin-top : 25px;
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
				
				<!-- BEGIN : 매출 차트 -->
				<div class="container-fluid">
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
						<div id="saleChartDiv" class="chart" style="width: 1500px; height: 500px;"></div>
					</div>
				</div>
				<!-- END : 매출 차트 -->
				
				<!-- BEGIN : 순이익 차트 -->
				<div class="container-fluid">
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
						<div id="profitChartDiv" class="chart" style="width: 1500px; height: 500px;"></div>
					</div>
				</div>
				<!-- END : 순이익 차트 -->
				
				<!-- BEGIN : 품목별 판매량 TOP 차트 -->
				<div class="container-fluid">
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
						<div id="topItemChartDiv" class="chart" style="width: 1500px; height: 600px;"></div>
					</div>
				</div>
				<!-- END : 품목별 판매량 TOP 차트 -->
				
				<!-- BEGIN : 판매처별 판매량 TOP 차트 -->
				<div class="container-fluid">
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
						<div id="topCustomerChartDiv" class="chart" style="width: 1500px; height: 500px;"></div>
					</div>
				</div>
				<!-- END : 판매처별 판매량 TOP 차트 -->
				
			</div>				
		</div>
	</body>
</html>