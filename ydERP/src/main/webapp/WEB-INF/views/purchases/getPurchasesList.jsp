<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>구매전체조회</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />

<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>

</head>
<body>




    <table id="jqGrid"></table>
    <div id="jqGridPager"></div>

    <br /><br />

    <div id="detailsPlaceholder">
        <table id="jqGridDetails"></table>
        <div id="jqGridDetailsPager"></div>
    </div>


<script type="text/javascript">

	$(function() {
		// master grid
        $("#jqGrid").jqGrid({
            url: 'getPurchasesList',
            datatype: "json",
            styleUI : "Bootstrap",
            colModel : [
				{ label : "구매코드", name : "purchaseCode", width : 110 },
				{ label : "구매일자", name : "purchaseDate", width : 85 },
				{ label : "구매처", name : "vendorCode", width : 80, align : "right" },
				{ label : "결제금액", name : "purchaseCost", width : 80, align : "right" }
			],
            width: 780,
            height: 150,
            rowNum: 7,
			viewrecords: true,
			loadonce: true,
			caption: 'Master Grid',
            onSelectRow: function(rowid, selected) {
				if(rowid != null) {
					jQuery("#jqGridDetails").jqGrid('setGridParam',{url: "getPurchasesList",datatype: 'json'}); // the last setting is for demo only
					jQuery("#jqGridDetails").jqGrid('setCaption', 'Detail Grid::');
					jQuery("#jqGridDetails").trigger("reloadGrid");
				}					
			}, // use the onSelectRow that is triggered on row click to show a details grid
			onSortCol : clearSelection,
			onPaging : clearSelection,
            pager: "#jqGridPager"
        });
	});
	
	// detail grid
    $("#jqGridDetails").jqGrid({
		url: 'getPurchasesList',
        mtype: "GET",
        datatype: "json",
        styleUI : "Bootstrap",
        page: 1,
		colModel: [
			{label : "구매상세코드", name : "purchaseDatailCode", width : 110 },
			{ label : "구매코드", name : "purchaseCode", width : 110 },
			{ label : "품목코드", name : "purchaseItem", width : 85 },
			{ label : "품목수량", name : "purchaseQty", width : 80, align : "right" },
			{ label : "품목단가", name : "purchasePrice", width : 80, align : "right" },
			{ label : "부가세", name : "itemTax", width : 80, align : "right" }
		],
		width: 780,
		rowNum: 5,
		loadonce: true,
		height: '100',
		viewrecords: true,
		caption: 'Detail grid::',
		pager: "#jqGridDetailsPager"
	});

	function clearSelection() {
		jQuery("#jqGridDetails").jqGrid('setGridParam',{url: "getPurchasesList", datatype: 'json'}); // the last setting is for demo purpose only
		jQuery("#jqGridDetails").jqGrid('setCaption', 'Detail Grid:: none');
		jQuery("#jqGridDetails").trigger("reloadGrid");
		
	}

</script>

</body>
</html>