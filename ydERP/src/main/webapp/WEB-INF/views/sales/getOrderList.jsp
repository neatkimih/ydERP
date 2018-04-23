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
			colNames : [ "주문일자", "주문코드", "결제금액", "주문처 이름", "주문처 코드", "배송주소", "배송사원 지정", "창고 지정", "승인", "편집", "주문"],			
			colModel : [
				{	name : "saleDate",		width : 150,	align : "center",	editable : false	},
				{	name : "saleCode",		width : 125,	align : "center",	editable : false,	key : true	},
				{	name : "saleCost",		width : 100,	align : "right",	editable : false	},
				{	name : "customerName",	width : 200,	align : "left",		editable : false	},				
				{	name : "customerCode",	width : 125,	align : "center",	editable : false	},
				{	name : "deliveryAddr",	width : 350,	align : "left",		editable : false	},
				{	name : "deliveryEmp",	width : 125,	align : "center",	editable : true,
					edittype : "select",	editoptions:{value:"${employeeList}"}					},					
				{	name : "warehouse",		width : 150,	align : "center",	editable : true,
					edittype : "select",	editoptions:{value:"${lookupValueList}"}				},
				{	name : "permit",		width : 75,	align : "center",	sortable : false,		formatter : permitBtn,
					autocomplete : true	},
				{	name : "permitCancle",	width : 75,	align : "center",	sortable : false,		formatter : cancleBtn	},
				{	name : "deleteOrder",	width : 75,	align : "center",	sortable : false,		formatter : deleteBtn	}
			],
			height : 'auto',			width : 'auto',
			rownumbers : true,			sortname : "saleCode",
			rowNum : 10,				reccount : 15,
			viewrecords : true,			gridview : true,
			autoencode : true,			caption : "주문 내역 정보",
			pager : "#pagerOrderList",	loadonce : true,
			reloadAfterSubmit : true,	// closeAfterAdd : true,
			onSelectRow : function(rowid, selected) {
				if(rowid && rowid!==lastsel2){
					jQuery('#orderList').jqGrid('restoreRow',lastsel2);
					jQuery('#orderList').jqGrid('editRow',rowid,true);
					lastsel2=rowid;
				}
				if (rowid != null) {
					selectedOrderCode = $(this).getCell(rowid, 'saleCode');
					jQuery("#orderDetail").jqGrid('setGridParam', {
						url : "getOrderDetail.do?saleCode=" + selectedOrderCode, datatype: 'json'
					});
					jQuery('#orderDetail').jqGrid('setCaption', '주문 코드 ' + selectedOrderCode + '] 의 상세 내역');
					jQuery('#orderDetail').trigger("reloadGrid");
				}
				console.log("선택된 주문 코드 : " + selectedOrderCode);
			},
			onSortCol : clearSelection,
			onPaging : clearSelection,
			jqGridInlineAfterSaveRow : function() {
				console.log("리로딩");
				$("#orderList").trigger("reloadGrid");
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
			} */
		});	// JQGRID : Master
		 
		/* Order Details : 디테일 그리드 */
		$("#orderDetail").jqGrid({
			url : "getOrderDetail.do",
			datatype : "json",
			styleUI : "Bootstrap",
			colNames : [ "상세코드", "품목코드", "품목명", "판매가(원)", "부가세", "수량", "사용연한(년)", "생산처" ],
			colModel : [
				{	name : "saleDetailCode",	width : 100,	align : "center"	},
				{	name : "saleItemCode",		width : 200,	align : "center"	},
				{	name : "saleItemName",		width : 350,	align : "left"		},
				{	name : "salePrice",			width : 100,	align : "right"		},
				{	name : "itemTax",			width : 75,		align : "right"		},
				{	name : "saleQty",			width : 75,		align : "right"		},
				{	name : "expireDate",		width : 100,	align : "center"	},
				{	name : "vendorName",		width : 200,	align : "left"		},
			],
			pager : "#pagerOrderDetail",
			rowNum : 10,
			sortname : "orderDetailCode",
			viewrecords : true,
			rownumbers : true,
			gridview : true,
			autoencode : true,
			reccount : 15,
			height : 'auto',	// 370
			width : 'auto',
			loadonce : true
		});

		// 주문 정보 검색, 취소, 삭제, 새로고침 버튼 
		$('#orderList').jqGrid('navGrid', "#pagerOrderList", {
			search : false,
			add : false,
			edit : false,
			cancel : false,
			del : false,
			refresh : false
		}, {
			closeAfterAdd : true,
			reloadAfterSubmit : true,
			afterComplete : function() {	$("#orderList").setGridParam({	datatype : 'json',	page : 1	}).trigger("reloadGrid");	}
		}, {
			serializeDelData : function(postdata) {
				return "oper=del&saleCode=" + postdata.id
			}
		}

		);
	});
	
	saveparameters = {
			"successfunc" : function(response) {
				if(response.responseJSON.result == "false") {
					alert(response.responseJSON.data);
					}
				else if(response.responseJSON.result == "true") {
					alert("주문이 승인되었습니다.");
					}
				}
	};
	
	/* 승인확인 버튼 생성 */
	function permitBtn (cellvalue, options, rowObject) {
		console.log("승인확인 버튼 생성");
		console.dir(options);
		return '<input type="button" onclick="jQuery(\'#orderList\').saveRow(\''+options.rowId+'\',saveparameters);" value="확인"/>';
	};
	
	/* 편집취소 버튼 생성 */
	function cancleBtn(cellvalue, options, rowObject) {
		console.log("편집취소 버튼 생성");
     	return '<input type="button" onclick=\"jQuery(\'#orderList\').restoreRow(\''+options.rowId+'\');" value="취소"/>';     
	};
	
	/* 주문취소 버튼 생성 */
	function deleteBtn(cellvalue, options, rowObject) {
		console.log("주문취소 버튼 생성");
		return '<input type="button" onclick="deleteOrder(\''+options.rowId+'\')" value="취소"/>';
	}
	
	/* 주문 취소 */
	function deleteOrder(saleCode) {
		var params = {saleCode:saleCode}
		$.ajax ({
			url : "deleteOrderList.do",
			type : "POST",
			dataType : "json",
			data : params,
			success : function( ) { $("#orderList").trigger("reloadGrid"); }
		})
	}
	
	var timeoutHnd;
	var flAuto = false;

	function doSearch(ev) {
		if(!flAuto)	return;
		if(timeoutHnd) clearTimeout(timeoutHnd)
		timeoutHnd = setTimeout(gridReload,500)
	}

	function gridReload() {
		var params = $('#orderSearchForm').serialize();
		jQuery("#orderList").jqGrid('setGridParam', {url:"getOrderByCondition.do?"+params ,page:1}).trigger("reloadGrid");
	}
	
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled",state);
	}
	
	function clearSelection() {
		jQuery("#orderDetail").jqGrid('setGridParam',{url: "getOrderDetail.do", datatype: 'json'});
		jQuery("#orderDetail").jqGrid('setCaption', 'none');
		jQuery("#orderDetail").trigger("reloadGrid");
	}
	
	title_nav = "[ getOrderList.jsp :::  주문내역 관리 (검색 | 조회 | 승인 | 폐기)]";
</script>
<style type="text/css">
#orderPageTitle {
	padding : 10px;
	text-align : left;
	background-color : #7F7F7F;
	color : #FFFFFF;
}

#pageName {
	background-color : #000000;
	color : #FFFFFF;
}

#searchDiv {
	margin-top : 50x;
	margin-left : 25px;
}

#orderListDiv {
	margin-left: auto;
	margin-right: auto;
	padding: 10px;
	text-align: center;
}

#orderDetailDiv {
	margin-left: auto;
	margin-right: auto;
	padding: 10px;
	text-align: center;
}

#permitOrderDiv {
	background-color: #3F7FFF;
	padding : 50px;
	float: left;

}

.searchTd{
	padding-right : 15px;
	padding-top : 10px;
	padding-bottom : 10px;
	size: auto;
}

.inputTd {
	padding-right : 45px;
	padding-top : 10px;
	padding-bottom : 10px;
	size : auto;
}

</style>
<title>getOrderList.jsp</title>
</head>
<body>
	<div id="orderPageTitle">
		<span id="pageName">[getOrderList.jsp]</span> 판매정보 ▷▶ 주문내역 - 검색 / 승인 / 폐기
	</div>
	<hr>
	<div id="searchDiv">
		<form id="orderSearchForm" name="orderSearchForm">
			<table>
					<tr>
						<td class="searchTd">주문코드</td><td class="inputTd"><input type="text" id="orderCodePut" name="saleCode" /></td>
						<td class="searchTd">주문처</td><td class="inputTd"><input type="text" id="customerNamePut" name="customerName" /></td>
						<td class="searchTd">주문일자</td><td class="inputTd"><input type="date" id="orderDatePut" name="saleDate" /></td>
					</tr>
					<tr>
						<td class="searchTd">결제금액</td><td class="inputTd"><input type="text" id="orderCostPut" name="saleCost" /></td>
						<td class="searchTd">배송주소</td><td colspan="2"><input type="text" id="deliveryAddrPut" name="deliveryAddr" /></td>
					</tr>
					<tr class="searchTr">
						<td>
						</td>
						<td class="searchTd"><button type="button" onclick="gridReload()" id="submitButton" class="btn btn-outline btn-success btn-block">검색</button></td>
						<td id="submitTd"></td>
					</tr>
			</table>
		</form>
	</div>
	<hr>
	<div id="orderListDiv">
		<table id="orderList">
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="pagerOrderList"></div>
	</div>
	<hr>
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