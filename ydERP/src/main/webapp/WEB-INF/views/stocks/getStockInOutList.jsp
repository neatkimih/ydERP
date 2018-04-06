<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />

<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$("#list").jqGrid({
			url : "getStockInOutListData",
			datatype : "json",
			styleUI : "Bootstrap",
			height : 380,

			colNames : [ "SeqId", "품목코드", "품목명", "판매/구매일자", "판매/구매번호", "입고수량", "출고수량", "처리일자" ],
			colModel : [
				{
					name : "stockId",
					width : 80 * 2
				},
				{
					name : "itemCode",
					width : 80 * 2
				},
				{
					name : "itemName",
					width : 80 * 2
				},
				{
					name : "dealDate",
					width : 120 * 2
				},
				{
					name : "dealerCode",
					width : 85 * 2
				},
				{
					name : "inQty",
					width : 60 * 2,
					align : "right"
				},
				{
					name : "outQty",
					width : 60 * 2,
					align : "right"
				},
				{
					name : "txnDate",
					width : 120 * 2,
					align : "right"
				},
			],
			pager : "#pager",
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			sortname : "stockId",
			viewrecords : true,
			gridview : true,
			autoencode : true,
			reccount : 15,
			caption: "입출고 현황조회"
		});
	});
</script>
</head>
<body>

	<table id="list">
		<tr>
			<td></td>
		</tr>
	</table>
	<div id="pager"></div>

</body>
</html>