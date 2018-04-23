<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			var selectedSaleCode;
			$(document).ready(function() {
				/* Sale List : 마스터 그리드 */
				$("#saleList").jqGrid({
					url : "getSaleList.do",
					datatype : "json",
					styleUI : "Bootstrap",
					colNames : [ "판매코드", "판매일자", "결제금액", "판매처 이름", "판매처 코드", "배송주소", "배송사원", "출하창고"],
					colModel : [
						{	name : "saleCode",		width : 125,		align : "center",	key : true	},
						{	name : "saleDate",		width : 150,		align : "center"	},
						{	name : "saleCost",		width : 100,		align : "right"		},
						{	name : "customerName",	width : 200,		align : "left"		},
						{	name : "customerCode",	width : 125,		align : "center"	},
						{	name : "deliveryAddr",	width : 350,		align : "left"		},
						{	name : "deliveryEmp",	width : 125,		align : "center"	},
						{	name : "warehouse",		width : 75,			align : "center"	},
					],
					height : 'auto',			width : 'auto',
					rownumbers : true,			sortname : "saleCode",
					rowNum : 10,				reccount : 15,
					viewrecords : true,			gridview : true,
					autoencode : true,			caption : "판매 내역 정보",
					pager : "#pagerSaleList",	//loadonce : true,
					search : true,
					onSelectRow : function(rowid, selected) {
						if (rowid != null) {
							selectedSaleCode = $(this).getCell(rowid, 'saleCode');
							jQuery("#saleDetail").jqGrid('setGridParam', {
								url : "getSaleDetail.do?saleCode=" + selectedSaleCode, datatype: 'json'		// "./getSaleDetail.do?saleCode="
							});
							jQuery("#saleDetail").jqGrid('setCaption', '판매 코드 [' + selectedSaleCode + '] 의 상세 내역');
							jQuery("#saleDetail").trigger("reloadGrid");
						}
						console.log("선택된 판매코드 : " + selectedSaleCode);
					}
				}); // JQGRID : Master
		
				/* Sale Details : 디테일 그리드 */
				$("#saleDetail").jqGrid({
					url : "getSaleDetail.do",
					datatype : "json",
					styleUI : "Bootstrap",
					colNames : [ "상세코드", "품목코드", "품목명", "판매가(원)", "부가세", "수량", "사용연한(년)", "생산처" ],
					colModel : [
						{	name : "saleDetailCode",	width : 100,	align : "center"	},
						{	name : "saleItemCode",		width : 100,	align : "center"	},
						{	name : "saleItemName",		width : 200,	align : "left"		},
						{	name : "salePrice",			width : 100,	align : "right"		},
						{	name : "itemTax",			width : 75,		align : "right"	},
						{	name : "saleQty",			width : 75,		align : "right"	},
						{	name : "expireDate",		width : 100,	align : "center"	},
						{	name : "vendorName",		width : 200,	align : "left"	},
					],
					height : 'auto',				autowidth : 'auto',
					rownumbers : true,				sortname : "saleDetailCode",
					rowNum : 10,					reccount : 15,
					viewrecords : true,				gridview : true,
					autoencode : true,				search : true,
					pager : "#pagerSaleDetail",		//loadonce : true				
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
				var params = $('#saleSearchForm').serialize();
				
				jQuery("#saleList").jqGrid('setGridParam',{url:"getSaleByCondition.do?"+params	,page:1}).trigger("reloadGrid");
			}
			
			function enableAutosubmit(state) {
				flAuto = state;
				jQuery("#submitButton").attr("disabled",state);
			}
			
			title_nav = "[ getSaleList.jsp :::  판매내역 관리 (검색 | 조회)]";
		</script>
		<style type="text/css">
		#salePageTitle {
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
		
		.submitTr {
			text-align : center;
		}
		
		.searchTd {
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
		
		#saleCodePut, #customerCodePut, ##saleDatePut, #saleCostPut {
			width : 1000px;
		}
		</style>
		<title>getSaleList.jsp</title>
	</head>
	<body>
		<div id="salePageTitle">
			<span id="pageName">[getSaleList.jsp]</span>판매정보 ▷▶ 판매내역 - 검색
		</div>
		<hr>
		<div id="searchDiv">
			<form id="saleSearchForm" name="saleSearchForm">
				<table>
						<tr>
							<td class="searchTd">판매코드</td><td class="inputTd"><input type="text" id="saleCodePut" name="saleCode"/></td>
							<td class="searchTd">판매처</td><td class="inputTd"><input type="text" id="customerNamePut" name="customerName" /></td>
							<td class="searchTd">판매일자</td><td class="inputTd"><input type="date" id="saleDatePut" name="saleDate"/></td>
						</tr>
						<tr>
							<td class="searchTd">결제금액</td><td class="inputTd"><input type="text" id="saleCostPut" name="saleCost"/></td>
							<td class="searchTd">배송주소</td><td colspan="2"><input type="text" id="deliveryAddrPut" name="deliveryAddr"/></td>
						</tr>
						<tr class="searchTr">
							<td class="searchTd">배송상태</td>
							<td class="inputTd">
								<select id="deliveryListSelect" name="deliveryStatus">
									<option value="">전체</option>
									<c:forEach items="${lookupDeliveryList}" var="lkdl">						
										<option value="${lkdl.LOOKUP_CODE}" >${lkdl.LOOKUP_VALUES}</option>			
									</c:forEach>
								</select>
							</td>
							<td class="searchTd">결제상태</td>
							<td class="inputTd">
								<select id="paymentListSelect" name="payStatus">
									<option value="">전체</option>
									<c:forEach items="${lookupPaymentList}" var="lkpl">						
										<option value="${lkpl.LOOKUP_CODE}">${lkpl.LOOKUP_VALUES}</option>					
									</c:forEach>
								</select>
							</td>
							<td class="searchTd"></td><td id="submitTd"><button type="button" onclick="gridReload()" id="submitButton" class="btn btn-outline btn-success btn-block">검색</button></td>
						</tr>
				</table>
			</form>
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