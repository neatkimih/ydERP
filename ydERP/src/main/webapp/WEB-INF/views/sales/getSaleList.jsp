<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
	$(document).ready(function() {
		/* Sale List : 마스터 그리드 */
		$("#saleList").jqGrid({
			url : "getSaleList.do",
			datatype : "json",
			styleUI : "Bootstrap",
			colNames : [ "판매코드", "판매처 코드", "판매일자", "결제금액", "배송주소", "배송사원", "배송상태", "결제상태", "출하창고"],
			colModel : [
				{	name : "saleCode",		width : 120,		align : "center"	},
				{	name : "customerCode",	width : 100,		align : "center"	},
				{	name : "saleDate",		width : 160,		align : "center"	},
				{	name : "saleCost",		width : 100,		align : "right"		},
				{	name : "deliveryAddr",	width : 200,		align : "left"		},
				{	name : "deliveryEmp",	width : 100,		align : "center"	},
				{	name : "deliveryStatus",width : 80,			align : "center"	},
				{	name : "payStatus",		width : 80,			align : "center"	},
				{	name : "warehouse",		width : 80,			align : "center"	},
			],
			autoheight : true,	autowidth : true,
			rowNum : 10,
			viewrecords : true,
			gridview : true,
			autoencode : true,
			search : true,
			sortname : "saleCode",
			caption : "판매 내역 정보",
			pager : "#pagerSaleList",
			onSelectRow : function(rowid, selected) {
				if (rowid != null) {
					var selectedSaleCode = $(this).getCell(rowid, 'saleCode');
					jQuery("#saleDetail").jqGrid('setGridParam', {
						url : "./getSaleDetail.do?saleCode=" + selectedSaleCode
					});
					jQuery("#saleDetail").jqGrid('setCaption', '판매 코드 : ' + selectedSaleCode);
					jQuery("#saleDetail").trigger("reloadGrid");
				}
				console.log("선택된 판매코드 : " + selectedSaleCode);
			}
		});

		/* Sale Details : 디테일 그리드 */
		$("#saleDetail").jqGrid({
			url : "getSaleDetail.do",
			datatype : "json",
			styleUI : "Bootstrap",
			colNames : [ "상세코드", "품목코드", "품목명", "판매가", "부가세", "수량", "사용연한", "생산처 코드" ],
			colModel : [
				{	name : "saleDetailCode",	width : 100,	align : "center"	},
				{	name : "saleItemCode",		width : 200,	align : "center"	},
				{	name : "saleItemName",		width : 100,	align : "right"		},
				{	name : "salePrice",			width : 200,	align : "left"		},
				{	name : "itemTax",			width : 100,	align : "center"	},
				{	name : "saleQty",			width : 100,	align : "center"	},
				{	name : "expireDate",		width : 100,	align : "center"	},
				{	name : "vendorCode",		width : 100,	align : "center"	},
			],
			pager : "#pagerSaleDetail",
			rowNum : 10,
			sortname : "saleDetailCode",
			viewrecords : true,
			gridview : true,
			autoencode : true,
			autoheight : true,
			autowidth : true,
			search : true
		});

		// 검색 기능 
		$('#saleList').jqGrid('navGrid', "#pagerSaleList", {
			add : false,
			edit : false,
			del : false,
			search : false,
			refresh : false
		}, {
			closeAfterAdd : true,
			reloadAfterSubmit : true,
			afterComplete : function() {	$("#saleList").setGridParam({	datatype : 'json',	page : 1	}).trigger('reloadGrid');	}
		}, {
			serializeDelData : function(postdata) {
				return "oper=del&itemCode=" + postdata.id
			}
		}

		);
	});
	
	var timeoutHnd;
	var flAuto = false;

	function doSearch(ev) {
		if(!flAuto)	return;
		if(timeoutHnd) clearTimeout(timeoutHnd)
		timeoutHnd = setTimeout(gridReload,500)
	}

	function gridReload() {
		var saleCodeMask = jQuery("#saleCodePut").val();
		var customerCodeMask = jQuery("#customerCodePut").val();
		var saleDateMask = jQuery("#saleDatePut").val();
		var saleCostMask = jQuery("#saleCostPut").val();
		var deliveryAddrMask = jQuery("#deliveryAddrPut").val();
		
		jQuery("#saleList").jqGrid('setGridParam',{url:"getSaleByCondition.do?saleCode=" + saleCodeMask +
																			"&customerCode=" + customerCodeMask +
																			"&saleDate=" + saleDateMask +
																			"&saleCost=" + saleCostMask +
																			"&deliveryAddr=" + deliveryAddrMask
													,page:1}).trigger("reloadGrid");
	}
	
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled",state);
	}
	
</script>
<style type="text/css">
#salePageTitle {
	padding : 10px;
	text-align : left;
	background-color : #007FFF;
	color : #FFFFFF;
}

#pageName {
	background-color : #00007F;
	color : #00FFFF;
	font-weight: bold;
}

#searchDiv {
	margin-top : 50x;
	margin-left : 25px;
}

#saleListDiv {
	margin-left: auto;
	margin-right: auto;
	padding: 10px;
	text-align: center;
}

#saleDetailDiv {
	margin-left: auto;
	margin-right: auto;
	padding: 10px;
	text-align: center;
}

#submitTr {
	text-align : center;


}

.searchTd{
	padding-right : 15px;
	padding-top : 10px;
	padding-bottom : 10px;

}
</style>
<title>getSaleList.jsp</title>
</head>
<body>
	<div id="salePageTitle">
		<span id="pageName">[getSaleList.jsp]</span> 판매정보 ▷▶ 판매내역 - 검색
	</div>
	<div id="searchDiv">
		<table>
				<tr>
					<td class="searchTd">판매코드</td><td><input type="text" id="saleCodePut" onkeydown="doSearch(arguments[0]||event)" /></td>
				</tr>
				<tr class="searchTr">
					<td class="searchTd">판매처 코드</td><td><input type="text" id="customerCodePut" onkeydown="doSearch(arguments[0]||event)" /></td>
				</tr>
				<tr class="searchTr">
					<td class="searchTd">판매일자</td><td><input type="text" id="saleDatePut" onkeydown="doSearch(arguments[0]||event)" /></td>
				</tr>
				<tr class="searchTr">
					<td class="searchTd">결제금액</td><td><input type="text" id="saleCostPut" onkeydown="doSearch(arguments[0]||event)" /></td>
				</tr>
				<tr class="searchTr">
					<td class="searchTd">배송주소</td><td><input type="text" id="deliveryAddrPut" onkeydown="doSearch(arguments[0]||event)" /></td>
				</tr>
				<tr class="searchTr">
					<td class="searchTd"></td><td id="submitTd"><button onclick="gridReload()" id="submitButton" class="btn btn-outline btn-success btn-block">검색</button></td>
				</tr>
		</table>
	</div>
	<hr>
	<div id="saleListDiv">
		<table id="saleList">
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="pagerSaleList"></div>
	</div>
	<hr>
	<div id="saleDetailDiv">
		<table id="saleDetail">
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="pagerSaleDetail"></div>
	</div>
</body>
</html>