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
					url : "getStockInOutListData",
					datatype : "json",
					styleUI : "Bootstrap",
					height : 300,
					autoheight : true,
					autowidth : true,

					colNames : [ "SeqId", "품목코드", "품목명", "판매/구매일자", "판매/구매번호", "입고수량", "출고수량", "처리일자" ],
					colModel : [ 
						{ name : "stockId", width : 3 }, 
						{ name : "itemCode", width : 3 }, 
						{ name : "itemName", width : 5 }, 
						{ name : "dealDate", width : 5, align : "center" },
						{ name : "dealerCode", width : 4 },
						{ name : "inQty", width : 3, align : "right" },
						{ name : "outQty", width : 3, align : "right" },
						{ name : "txnDate", width : 5, align : "center" }, 
						],

					pager : "#pager",
					rowNum : 10,
					rowList : [ 10, 20, 30 ],
					sortname : "stockId",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					reccount : 15,
					loadonce : true,
					caption : "입출고 현황조회",
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
	<div class="col-lg-12">
		<table id="list">
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="pager"></div>
	</div>
	<div class="col-lg-10">
		<div id="detailsPlaceholder">
			<table id="listDetail"></table>
			<div id="pagerDetail"></div>
		</div>
	</div>
</body>
</html>