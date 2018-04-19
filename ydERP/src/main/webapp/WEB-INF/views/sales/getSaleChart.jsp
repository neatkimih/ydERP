<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			google.charts.setOnLoadCallback(drawChart);
						
			function drawChart() {
				
				/* 월별, 일별 순이익 차트 : Bar Chart */
				$.ajax({
					url : "./getProfitData.do",
					method : "POST",
					type : "json",
					success : function(datas) {
						var dataProfit = [];
						dataProfit.push([
						
					}
					
					
				})
				
			
				var data = google.visualization.arrayToDataTable([
				["Element", "Density", { role: "style" } ],
				["Copper", 8.94, "#b87333"],
			        ["Silver", 10.49, "silver"],
			        ["Gold", 19.30, "gold"],
			        ["Platinum", 21.45, "color: #e5e4e2"]
			      ]);

			      var view = new google.visualization.DataView(data);
			      view.setColumns([0, 1,
			                       { calc: "stringify",
			                         sourceColumn: 1,
			                         type: "string",
			                         role: "annotation" },
			                       2]);

			      var options = {
			        title: "Density of Precious Metals, in g/cm^3",
			        width: 600,
			        height: 400,
			        bar: {groupWidth: "95%"},
			        legend: { position: "none" },
			      };
			      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
			      chart.draw(view, options);
			
			
			
			
			
			
			function drawChart() {
				var data = google.visualization.arrayToDataTable([
		          ['Year', 'Sales', 'Expenses'],
		          ['2014', 1000, 400],
		          ['2015', 1170, 460],
		          ['2016', 660, 1120],
		          ['2017', 1030, 540]
		        ]);
		
		        var options = {
		          chart: {
		            title: 'Company Performance',
		            subtitle: 'Sales, Expenses: 2014-2017',
		          },
		          bars: 'vertical',
		          vAxis: {format: 'decimal'},
		          height: 400,
		          colors: ['#1b9e77', '#d95f02']
		        };
		
		        var chart = new google.charts.Bar(document.getElementById('chart_div'));
		
		        chart.draw(data, google.charts.Bar.convertOptions(options));
		
		        var btns = document.getElementById('btn-group');
		
		        btns.onclick = function (e) {
		
		          if (e.target.tagName === 'BUTTON') {
		            options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
		            chart.draw(data, google.charts.Bar.convertOptions(options));
		          }
		        }
		      }
      </script>
	</head>
	<body>
		
		
	</body>
</html>