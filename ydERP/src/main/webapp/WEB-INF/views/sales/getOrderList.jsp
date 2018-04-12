<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>
<script>
var lastsel2;
	var selectedOrderCode;
	$(document).ready(function() {
		/* Order List : 마스터 그리드 */
		$("#orderList").jqGrid({
			url : "getOrderList.do",
			editurl : "editOrderList.do",
			datatype : "json",
			styleUI : "Bootstrap",
			colNames : [ "주문코드", "주문처 코드", "주문일자", "결제금액", "배송지", "배송사원", "출하창고", "승인확인", "편집취소", "주문삭제"],			
			colModel : [
				{	name : "saleCode",		width : 120,	align : "center",	editable : false,	key : true	},
				{	name : "customerCode",	width : 100,	align : "center",	editable : false	},
				{	name : "saleDate",		width : 120,	align : "center",	editable : false	},
				{	name : "saleCost",		width : 100,	align : "right",	editable : false	},
				{	name : "deliveryAddr",	width : 200,	align : "left",		editable : false	},
				{	name : "deliveryEmp",	width : 200,	align : "center",	editable : true,
					edittype : "select",	editoptions:{value:"${employeeList}"}					},					
				{	name : "warehouse",		width : 200,	align : "center",	editable : true,
					edittype : "select",	editoptions:{value:"${lookupValueList}"}				},
				{	name : "permit",		width : 100,	align : "center",	sortable : false,		formatter : permitBtn,
					autocomplete : true	},
				{	name : "permitCancle",	width : 100,	align : "center",	sortable : false,		formatter : cancleBtn	},
				{	name : "deleteOrder",	width : 100,	align : "center",	sortable : false,		formatter : deleteBtn	}
			],
			autoheight : true,
			autowidth : true,
			rowNum : 10,
			viewrecords : true,
			gridview : true,
			autoencode : true,
			search : true,
			sortname : "saleCode",
			caption : "주문 내역 정보",
			pager : "#pagerOrderList",
			closeAfterAdd : true,
			reloadAfterSubmit : true,
			onSelectRow : function(rowid, selected) {
				if(rowid && rowid!==lastsel2){
					jQuery('#orderList').jqGrid('restoreRow',lastsel2);
					jQuery('#orderList').jqGrid('editRow',rowid,true);
					lastsel2=rowid;
				}
				if (rowid != null) {
					selectedOrderCode = $(this).getCell(rowid, 'saleCode');
					jQuery("#orderDetail").jqGrid('setGridParam', {
						url : "./getOrderDetail.do?saleCode=" + selectedOrderCode
					});
					jQuery("#orderDetail").jqGrid('setCaption', '주문 코드 : ' + selectedOrderCode);
					jQuery("#orderDetail").trigger("reloadGrid");
				}
				console.log("선택된 주문 코드 : " + selectedOrderCode);
			},
			/* afterSubmit : function() {
				$("#orderList").setGridParam({
					url : "getOrderList.do",
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');			
			},
			afterComplete : function() {
				$("#orderList").setGridParam({
					url : "getOrderList.do",
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');
			}, */
			jqGridInlineAfterSaveRow : function() {
				console.log("리로딩");
			$("#orderList").trigger("reloadGrid");
			}
		}
	);
		 
		/* Order Details : 디테일 그리드 */
		$("#orderDetail").jqGrid({
			url : "getOrderDetail.do",
			datatype : "json",
			styleUI : "Bootstrap",
			colNames : [ "주문상세코드", "주문품목코드", "주문품목명", "판매가", "부가세", "주문수량", "사용연한", "생산처 코드" ],
			colModel : [
				{	name : "saleDetailCode",width : 100,	align : "center"	},
				{	name : "saleItemCode",	width : 200,	align : "center"	},
				{	name : "saleItemName",	width : 100,	align : "right"		},
				{	name : "salePrice",		width : 200,	align : "left"		},
				{	name : "itemTax",		width : 100,	align : "center"	},
				{	name : "saleQty",		width : 100,	align : "center"	},
				{	name : "expireDate",	width : 100,	align : "center"	},
				{	name : "vendorCode",	width : 100,	align : "center"	},
			],
			
			pager : "#pagerOrderDetail",
			rowNum : 10,
			sortname : "orderDetailCode",
			viewrecords : true,
			gridview : true,
			autoencode : true,
			autoheight : true,
			autowidth : true,
			search : true
		});

		// 주문 정보 검색, 취소, 삭제, 새로고침 버튼 
		$('#orderList').jqGrid('navGrid', "#pagerOrderList", {
			search : true,
			add : false,
			edit : false,
			cancel : true,
			del : true,
			refresh : true
		}, {
			closeAfterAdd : true,
			reloadAfterSubmit : true,
			afterComplete : function() {
				$("#orderList").setGridParam({
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');
			}
		}, {
			serializeDelData : function(postdata) {
				return "oper=del&saleCode=" + postdata.id
			}
		}

		);
	});
	
	/* 승인 버튼 생성 */
	function permitBtn (cellvalue, options, rowObject) {
		console.log("승인 버튼 생성");
		console.dir(options);
		return '<input type="button" onclick="jQuery(\'#orderList\').saveRow(\''+options.rowId+'\');" value="승인"/>';
	};
	
	/* 취소 버튼 생성 */
	function cancleBtn(cellvalue, options, rowObject) {
		console.log("취소 버튼 생성");
     	return '<input type="button" onclick=\"jQuery(\'#orderList\').restoreRow(\''+options.rowId+'\');" value="취소"/>';     
	};
	
	/* 삭제 버튼 생성 */
	function deleteBtn(cellvalue, options, rowObject) {
		console.log("삭제 버튼 생성");
		return '<input type="button" onclick=\"jQuery(\'#orderList\').delRowData(\''+options.rowId+'\');" value="삭제"/>';
	}
	

	
</script>
<style type="text/css">
.#orderListDiv {
	margin-left: auto;
	margin-right: auto;
	padding: 50px;
	text-align: center;
}

.#orderDetailDiv {
	margin-left: auto;
	margin-right: auto;
	padding: 50px;
	text-align: center;
}

.#permitOrderDiv {
	background-color: #3F7FFF;
	padding : 50px;
	float: left;

}

</style>
<title>getOrderList.jsp</title>
</head>
<body>

	<div id="orderListDiv">
		<table id="orderList">
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="pagerOrderList"></div>
	</div>
	<br>
	<div id="permitOrderDiv">
					<%-- 배송 사원 : 
			<select id="deliveryEmpSelect" name="searchEmployeeId">
				<option value="">사원 선택</option>
				<c:forEach items="${employeeList}" var="emp">
				<option value="${emp.id}">${emp.id} : ${emp.name}</option>
				</c:forEach>
			</select> --%>
			<%-- 출하 창고 :
			<select id="warehouseSelect" name="searchWarehouse">
				<option value="">창고 선택</option>
				<c:forEach items="${lookupValueList}" var="lkup">
				<option value="${lkup.LOOKUP_CODE}">${lkup.LOOKUP_VALUES}</option>
				</c:forEach>
			</select> --%>
			<!--
			<input type="button" value="주문 승인" onclick="()"/> -->		
	</div>
	<br>
	<hr>
	<br>
	<div id="orderDetailDiv">
		<table id="orderDetail">
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="pagerOrderDetail"></div>
	</div>
</body>
</html>