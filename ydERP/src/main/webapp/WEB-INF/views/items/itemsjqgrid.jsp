<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css" media="screen"
	href="./scripts/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="./resources/jqgrid5/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="./resources/bootstrap4/bootstrap.min.css" />
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/jquery/jquery-ui.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="./scripts/jquery-3.3.1.js"></script>
<script src="./resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script src="./resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>


</head>

<body>
	<div>
		<table id="employeejqGrid"></table>
		<div id="employeejqGridPager"></div>
	</div>

	<div id="additemTemplate">
		<form>
			<div class="form-group">
				<label for="itemCode">품목코드</label> <input type="text"
					class="form-control" id="itemCode" name="itemCode">
			</div>
			<div class="form-group">
				<label for="itemName">품목정보</label> <input type="text"
					class="form-control" id="itemName" name="itemName">
			</div>
			<div class="form-group">
				<label for="uom">UOM</label> <input type="text" class="form-control"
					id="uom" name="uom">
			</div>
			<div class="form-group">
				<label for="inQty">수량</label> <input type="text"
					class="form-control" id="inQty" name="inQty">
			</div>
			<div class="form-group">
				<label for="supplyPrice">공급가</label> <input type="text"
					class="form-control" id="supplyPrice" name="supplyPrice">
			</div>
			<div class="form-group">
				<label for="sellingPrice">판매가</label> <input type="text"
					class="form-control" id="sellingPrice" name="sellingPrice">
			</div>
			<div class="form-group">
				<label for="itemTax">부가세</label> <input type="text"
					class="form-control" id="itemTax" name="itemTax">
			</div>
			<div class="form-group">
				<label for="expireDate">사용연한</label> <input type="text"
					class="form-control" id="expireDate" name="expireDate">
			</div>
			<div class="form-group">
				<label for="vendorCode">판매자코드</label> <input type="text"
					class="form-control" id="vendorCode" name="vendorCode">
			</div>
			<div class="form-group">
				<div align="right">{sData}{cData}</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#additemTemplate").hide();

			$("#list").jqGrid({
				url : "getItemsListGridData",
				editurl : "getItemsDataEdit",
				datatype : "json",

				colModel : [ {
					label : "품목코드",
					name : "itemCode",
					key : true,
					width : 90,
					sorttype : 'integer',
					editable : false
				}, {
					label : "품목이름",
					name : "itemName",
					width : 300,
					editable : true
				}, {
					label : "UOM",
					name : "uom",
					width : 55,
					align : "center",
					editable : true
				}, {
					label : "수량",
					name : "inQty",
					width : 40,
					align : "right",
					editable : true
				}, {
					label : "공급가",
					name : "supplyPrice",
					width : 90,
					align : "right",
					editable : true
				}, {
					label : "판매가",
					name : "sellingPrice",
					width : 90,
					align : "right",
					editable : true
				}, {
					label : "부가세",
					name : "itemTax",
					width : 55,
					align : "right",
					editable : true
				}, {
					label : "사용연한",
					name : "expireDate",
					width : 75,
					align : "right",
					editable : true
				}, {
					label : "판매자코드",
					name : "vendorCode",
					width : 90,
					align : "right",
					editable : true
				}, ],
				pager : "#pager",
				rowNum : 10,
				rowList : [ 10, 20, 30 ],
				sortname : "itemCode",
				sortorder : "desc",
				viewrecords : true,
				gridview : true,
				autoencode : true,
				loadonce : true,
			});
			$('#list').inlineNav('#pager',

			{
				edit : true,
				add : false,
				del : true,
				cancel : true,
				editParams : {
					keys : true,
				},
				addParams : {
					keys : true
				}

			});

		});
	</script>

</body>


<table id="list">
	<tr>
		<td></td>
	</tr>
</table>
<div id="pager"></div>
<br>


</html>