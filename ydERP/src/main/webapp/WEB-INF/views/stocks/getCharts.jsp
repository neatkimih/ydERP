<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="./scripts/jquery-3.3.1.min.js"></script>
<script src="./scripts/json.min.js"></script>

<script type="text/javascript">
	google.charts.load("current", {
		packages : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		//PieChart:판매량
		$.ajax({
			url : "./getMostSoldItem.do",
			method : "POST",
			type : "json",
			success : function(datas) {
				var data1 = [];
				data1.push([ "품목명", "판매량" ]);
				for (i = 0; i < datas.length; i++) {
					data1.push([ datas[i].ITEM_NAME, parseInt(datas[i].QUANTITY) ]);
				};
				var options1 = {
					title : '[판매] Best Top 5'
				};

				var chart1 = new google.visualization.PieChart(document.getElementById('piechart'));
				chart1.draw(google.visualization.arrayToDataTable(data1), options1);
			}
		});
		
		//PieChart:구매량
		$.ajax({
			url : "./getMostBuyItem.do",
			method : "POST",
			type : "json",
			success : function(datas) {
				var data4 = [];
				data4.push([ "품목명", "판매량" ]);
				for (i = 0; i < datas.length; i++) {
					data4.push([ datas[i].ITEM_NAME, parseInt(datas[i].QUANTITY) ]);
				};
				var options4 = {
					title : '[구매] Best Top 5'
				};

				var chart4 = new google.visualization.PieChart(document.getElementById('piechart2'));
				chart4.draw(google.visualization.arrayToDataTable(data4), options4);
			}
		});
		
		//Line Chart
		$.ajax({
			url : "./getInOutQtyChart.do",
			method : "POST",
			type : "json",
			success : function(datas){
				var data3 = [];
				data3.push([ "일별", "입고량", "출고량" ]);
				for (i = 0; i < datas.length; i++) {
					data3.push([ datas[i].IN_OUT_DAY, (datas[i].IN_QTY), (datas[i].OUT_QTY) ]);
				};
		        var options3 = {
		                title: '[재고] 입고 출고 변화',
		                curveType: 'function',
		                legend: { position: 'bottom' }
		              };

		        var chart3 = new google.visualization.LineChart(document.getElementById('curve_chart'));
		        chart3.draw(google.visualization.arrayToDataTable(data3), options3);
			}
		});
/*         var data3 = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

 */
		//ColumnChart
		var data2 = google.visualization.arrayToDataTable([
				[ "Element", "Density", {role : "style"} ], 
				[ "Copper", 8.94, "#b87333" ],
				[ "Silver", 10.49, "silver" ], 
				[ "Gold", 19.30, "gold" ],
				[ "Platinum", 21.45, "color: #e5e4e2" ] ]);

		var view = new google.visualization.DataView(data2);
		view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options2 = {
			title : "Density of Precious Metals, in g/cm^3",
			width : 600,
			height : 400,
			bar : {
				groupWidth : "95%"
			},
			legend : {
				position : "none"
			},
		};
		var chart2 = new google.visualization.ColumnChart(document
				.getElementById("columnchart_values"));
		chart2.draw(view, options2);

	}
</script>
</head>
<body>
	<h3>getCharts.jsp</h3>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">입출 통계</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-6" id="piechart" style="height: 500px;"></div>
					<div class="col-lg-6" id="piechart2" style="height: 500px;"></div>
				</div>
				<div class="row">
					<div class="col-lg-6" id="curve_chart" style="height: 500px;"></div>
					<div class="col-lg-6" id="columnchart_values" style="height: 300px;"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>