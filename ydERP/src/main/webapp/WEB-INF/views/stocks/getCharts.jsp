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

		//PieChart
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
					title : 'Best Top 5'
				};

				var chart1 = new google.visualization.PieChart(document.getElementById('piechart'));
				chart1.draw(google.visualization.arrayToDataTable(data1), options1);
			}
		});

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
<body><h3>getCharts.jsp</h3>
	YedamERP Chart Page
	<div id="piechart" style="width: 900px; height: 500px;"></div>
	<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
</body>
</html>