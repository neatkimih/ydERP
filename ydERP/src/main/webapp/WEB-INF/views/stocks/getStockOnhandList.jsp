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
						{name : "vendorName",width : 3,align : "right"},
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
		var vend_cd = jQuery("#warehouseSelect").val();
		var grp_cd1 = jQuery("#itemgroup1").val();
		var grp_cd2 = jQuery("#itemgroup2").val();
		var grp_cd3 = jQuery("#itemgroup3").val();
		var groups = grp_cd1 + grp_cd2 + grp_cd3;
		console.log(cd_mask + "============" + nm_mask);
		jQuery("#list").jqGrid(
				'setGridParam',
				{
					url : "getStockOnhandListData?itemName=" + nm_mask + "&itemCode=" + cd_mask + "&vendorCode=" + vend_cd
							+ "&group1=" + grp_cd1 + "&group2=" + grp_cd2 + "&group3=" + grp_cd3,
					datatype : "json",
					page : 1
				}).trigger("reloadGrid");
	}
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled", state);
	}

	function changeGroup1() {
		//alert("change");
		var grp1 = jQuery("#itemgroup1").val();
		console.log("grp1 =========" + grp1);
		$.ajax({
			url : "getItemGroup2.do?grp_code=" + grp1,
			datatype : "json",
			method : "POST",
			success : function(datas) {
				$("#itemgroup2 option:gt(0)").remove();
				for (i = 0; i < datas.length; i++) {
					console.log(i + "=====" + datas[i].grp_code + ", " + datas[i].grp_name);
					$("#itemgroup2").append("<option value='"+datas[i].grp_code+"'>" + datas[i].grp_name);
				}
			}
		})

	}

	function changeGroup2() {
		//alert("change");
		var grp2 = jQuery("#itemgroup2").val();
		console.log("grp2 =========" + grp2);
		$.ajax({
			url : "getItemGroup3.do?grp_code=" + grp2,
			datatype : "json",
			method : "POST",
			success : function(datas) {
				$("#itemgroup3 option:gt(0)").remove();
				for (i = 0; i < datas.length; i++) {
					console.log(i + "=====" + datas[i].grp_code + ", " + datas[i].grp_name);
					$("#itemgroup3").append("<option value='"+datas[i].grp_code+"'>" + datas[i].grp_name);
				}
			}
		})

	}
</script>
</head>
<body>
	<h3>getStockOnhandList.jsp</h3>
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">Search Condition</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<input type="checkbox" id="autosearch"
							onclick="enableAutosubmit(this.checked)"> Enable Autosearch
					</div>
				</div>
				<div class="row" style="margin-top: 10px">
					<div class="col-lg-3">
						<select id="itemgroup1" name="itemgroup1" class="form-control"
							onchange="changeGroup1()">
							<option value="">대분류 선택</option>
							<c:forEach items="${itemGroup1}" var="lkup">
								<option value="${lkup.grp_code}">${lkup.grp_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-lg-3">
						<select id="itemgroup2" name="itemgroup2" class="form-control"
							onchange="changeGroup2()">
							<option value="">중분류 선택</option>
							<c:forEach items="${itemGroup2}" var="lkup">
								<option value="${lkup.grp_code}">${lkup.grp_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-lg-3">
						<select id="itemgroup3" name="itemgroup3" class="form-control"
							>
							<option value="">소분류 선택</option>
							<c:forEach items="${itemGroup3}" var="lkup">
								<option value="${lkup.grp_code}">${lkup.grp_name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row" style="margin-top: 10px">
					<div class="col-lg-3">
						<input type="text" id="item_cd" class="form-control"
							placeholder="==> Enter ItemCode"
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<div class="col-lg-3">
						<input type="text" id="item_nm" class="form-control"
							placeholder="==> Enter ItemName"
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<div class="col-lg-3">
						<select id="warehouseSelect" name="warehouseSelect"
							class="form-control">
							<option value="">구매업체 선택</option>
							<c:forEach items="${vendorList}" var="lkup">
								<option value="${lkup.VENDOR_CODE}">${lkup.VENDOR_NAME}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-lg-3">
						<button onclick="gridReload()" id="submitButton"
							class="btn btn-outline btn-success btn-block">Search</button>
					</div>
				</div>
				<br>
			</div>
		</div>
	</div>
	<!-- col-lg-6 -->
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