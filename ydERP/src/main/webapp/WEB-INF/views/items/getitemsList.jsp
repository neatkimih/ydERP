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
			$("#additemTemplate").hide();

			$("#list").jqGrid({
				url : "getItemsList.do",
				editurl : "getItemsDataEdit",
				datatype : "json",
				styleUI : 'Bootstrap',
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
				//onSelectRow : editRow,
				rowNum : 10,
				height : 'auto',
				autowidth : true,
				responsive : true,
				multiselect : true,
				pager : "#pager"
			});
			$('#list').jqGrid('filterToolbar', {
				stringResult : true,
				searchOperators : true
			});
			$('#list').jqGrid('navGrid', "#pager", {
				search : false, // show search button on the toolbar
				edit : false,
				add : false,
				del : true,
				cancel : true,
				refresh : true,
				
			}, {}, {
				closeAfterAdd : true,
				reloadAfterSubmit : true,
				template : $("#additemTemplate").html(),
				afterComplete : function() {
					$("#list").setGridParam({
						datatype : 'json',
						page : 1
					}).trigger('reloadGrid');
				}
			}, {serializeDelData: function(postdata){
				return "oper=del&itemCode="+postdata.id
			}}
			
			
			);
			$('#list').inlineNav('#pager',
             
			{
				edit : true,
				cancel : true,
				refresh : true,
				editParams : {
					keys : true,
				},
				

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
<br>
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
		
		</form>
	</div>

</body>
</html>