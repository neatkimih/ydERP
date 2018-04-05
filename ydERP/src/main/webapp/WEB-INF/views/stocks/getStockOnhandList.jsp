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
			url : "getStockOnhandListData",
			datatype : "json",
			styleUI : "Bootstrap",
			height : 380,

			colNames : [ "품목코드", "품목명", "UOM", "인입수량", "구매가", "판매가", "부가세", "사용연한", "구매업체", "최저재고수량", "현재고" ],
			colModel : [
				{
					name : "itemCode",
					width : 100
				},
				{
					name : "itemName",
					width : 200
				},
				{
					name : "uom",
					width : 50
				},
				{
					name : "quantities",
					width : 100,
					align : "right"
				},
				{
					name : "supplyPrice",
					width : 80,
					align : "right"
				},
				{
					name : "sellingPrice",
					width : 80,
					align : "right"
				},
				{
					name : "itemTax",
					width : 80,
					align : "right"
				},
				{
					name : "expireDate",
					width : 100,
					align : "right"
				},
				{
					name : "vendorCode",
					width : 160,
					align : "right"
				},
				{
					name : "minQty",
					width : 120,
					align : "right"
				},
				{
					name : "onhandQty",
					width : 120,
					align : "right"
				},
			],
			pager : "#pager",
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			sortname : "itemCode",
			sortorder : "asc",
			viewrecords : true,
			gridview : true,
			autoencode : true,
			caption: "재고 현황조회"
		});
		jQuery("#list").jqGrid('navGrid','#pager',{});
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