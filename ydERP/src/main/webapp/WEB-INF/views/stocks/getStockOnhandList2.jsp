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
		$("#list").jqGrid(
				{
					url : "getStockOnhandListData",
					datatype : "json",
					styleUI : "Bootstrap",
					height : 300,
					autoheight : true,
					autowidth : true,

					colNames : [ "품목코드", "품목명", "UOM", "인입수량", "구매가", "판매가", "부가세", "사용연한", "구매업체", "최저재고", "현재고" ],
					colModel : [ 
						{name : "itemCode",width : 3},
						{name : "itemName",width : 5},
						{name : "uom",width : 2}, 
						{name : "quantities",width : 2,align : "right"}, 
						{name : "supplyPrice",width: 2,align : "right"}, 
						{name : "sellingPrice",width : 2,align : "right"},
						{name : "itemTax",width : 2,align : "right"}, 
						{name : "expireDate",width : 2,align : "right"},
						{name : "vendorCode",width : 3,align : "right"},
						{name : "minQty",width : 2,align : "right"}, 
						{name : "onhandQty",width : 2,align : "right"}, 
						],

					pager : "#pager",
					rowNum : 10,
					rowList : [ 10, 20, 30 ],
					sortname : "itemCode",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					reccount : 15,
					loadonce : true,
					caption : "재고 현황조회",
	                onSelectRow: function(rowid, selected) {
						if(rowid != null) {
							var selectedItem = $(this).getCell(rowid, "itemCode");
							//alert(selectedItem);
							jQuery("#listDetail").jqGrid('setGridParam',{url: "getItemInOutListData?itemCode="+selectedItem,datatype: 'json'}); // the last setting is for demo only
							jQuery("#listDetail").jqGrid('setCaption', '품목코드::'+selectedItem);
							jQuery("#listDetail").trigger("reloadGrid");
						}					
					}, // use the onSelectRow that is triggered on row click to show a details grid
					onSortCol : clearSelection,
					onPaging : clearSelection,
				}
		);

		// detail grid
	    $("#listDetail").jqGrid({
			url: 'getItemInOutListData',
	        mtype: "GET",
	        datatype: "json",
	        page: 1,
	        styleUI : "Bootstrap",
			height : 200,
			autoheight : true,
			//autowidth : true,

	        colModel: [
	                { label: '구매/판매일', name: 'dealDate', key: true, width: 5 },
	                { label: '구매/판매번호', name: 'dealerCode', width: 4 },
	                { label: '입고수량', name: 'inQty', width: 3, align : "right" },
	                { label: '출고수량', name: 'outQty', width: 3, align : "right" },
	                { label: '입/출고일', name: 'txnDate', width: 5 }
			],
			width: 780,
			rowNum: 10,
			loadonce: true,
			viewrecords: true,
			caption: '품목코드::',
			pager: "#pagerDetail"
		});
	
	    function clearSelection() {
			jQuery("#listDetail").jqGrid('setGridParam',{url: "getItemInOutListData", datatype: 'json'}); // the last setting is for demo purpose only
			jQuery("#listDetail").jqGrid('setCaption', 'Detail Grid:: none');
			jQuery("#listDetail").trigger("reloadGrid");
			
		}

	});

</script>
</head>
<body>
	<div class="col-lg-5">
		<div class="panel panel-default">
			<div class="panel-heading">[ 재고 조회2 : getStockOnhandList2.jsp ] >>> 품목의 재고 및 입출고 조회</div>
			<div class="container"></div>
		</div>
	</div>
	<div class="col-lg-12">
		<table id="list">
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
	<div id="pager"></div>
	<div class="col-lg-10">
		<div id="detailsPlaceholder">
			<table id="listDetail"></table>
			<div id="pagerDetail"></div>
		</div>
	</div>
</body>
</html>