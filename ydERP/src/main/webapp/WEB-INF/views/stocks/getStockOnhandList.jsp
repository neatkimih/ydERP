<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					height : 380,
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
					sortorder : "asc",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					loadonce : true,
					caption : "재고 현황조회"
				});
		jQuery("#list").jqGrid('navGrid', '#pager', {});
	});

	var timeoutHnd;
	var flAuto = false;

	function doSearch(ev){
		if(!flAuto)
			return;
//		var elem = ev.target||ev.srcElement;
		if(timeoutHnd)
			clearTimeout(timeoutHnd)
		timeoutHnd = setTimeout(gridReload,500)
	}

	function gridReload() {
		var cd_mask = jQuery("#item_cd").val();
		var nm_mask = jQuery("#item_nm").val();
		console.log(cd_mask + "============" + nm_mask);
		jQuery("#list").jqGrid(
				'setGridParam',
				{
					url : "getStockOnhandListData?itemName=" + nm_mask + "&itemCode=" + cd_mask,
					datatype : "json",
					page : 1
				}).trigger("reloadGrid");
	}
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled", state);
	}
</script>
</head>
<body>
	<h3>getStockOnhandList.jsp</h3>
	<div class="col-lg-6">
		<div class="panel panel-default">
			<div class="panel-heading">Search Condition</div>
			<div>
				<input type="checkbox" id="autosearch" onclick="enableAutosubmit(this.checked)"> Enable Autosearch
			</div>
			<div  class="col-lg-5">
				<input type="text" id="item_cd" class="form-control" placeholder="==> Enter ItemCode" onkeydown="doSearch(arguments[0]||event)" />
				<input type="text" id="item_nm" class="form-control" placeholder="==> Enter ItemName" onkeydown="doSearch(arguments[0]||event)" />
			</div><br>
			<div class="col-lg-5">
				<select id="warehouseSelect" name="searchWarehouse" class="form-control">
					<option value="">구매업체 선택</option>
					<c:forEach items="${lookUpValue}" var="lkup">
						<option value="${lkup.LOOKUP_CODE}">${lkup.LOOKUP_VALUES}</option>
					</c:forEach>
				</select>
				<button onclick="gridReload()" id="submitButton"
					class="btn btn-outline btn-success" style="margin-left: 30px">Search</button>
			</div><br>
		</div>
	</div>
	<br>
	<div class="col-lg-12">
		<table id="list">
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="pager"></div>
	</div>
</body>
</html>