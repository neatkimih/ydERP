<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				/* Order List : 마스터 그리드 */
				$("#orderList").jqGrid({
					url : "getOrderList.do",
					datatype : "json",
					styleUI : "Bootstrap",
					colNames : [ "주문코드"
						, "주문처 코드"
						, "주문일자"
						, "결제금액"
						, "배송지"
						, "승인상태" ],
					colModel : [
						{	name : "saleCode",		width : 120,	align : "center",	editable : false	},
						{	name : "customerCode",	width : 100,	align : "center",	editable : false	},
						{	name : "saleDate",		width : 200,	align : "center",	editable : false	},
						{	name : "saleCost",		width : 100,	align : "right",	editable : false	},
						{	name : "deliveryAddr",	width : 200,	align : "left",		editable : false	},
						{	name : "orderPermit",	width : 100,	align : "center",	editable : true		}
					],
					autoheight: true,
					autowidth : true,
					rowNum : 10,
					viewrecords : true,
					gridview : true,
					autoencode : true,
					search : true,
					multiselect : true,
					sortname : "saleCode",
					caption : "주문 내역 정보",
					pager : "#pagerOrderList",					
					onSelectRow : function(rowid, selected) {
						if(rowid != null) {
							var selectedOrderCode = $(this).getCell(rowid,'saleCode');
							jQuery("#orderDetail").jqGrid('setGridParam', {url: "./getOrderDetail.do?saleCode="+selectedOrderCode});
							jQuery("#orderDetail").jqGrid('setCaption', '주문 코드 : ' + selectedOrderCode);
							jQuery("#orderDetail").trigger("reloadGrid");
						}
						console.log("선택된 주문 코드 : " + selectedOrderCode);
					}
				});
				
			/* Order Details : 디테일 그리드 */
				$("#orderDetail").jqGrid({
					url : "getOrderDetail.do",
					datatype : "json",
					styleUI : "Bootstrap",
					colNames : [ "주문상세코드"
						, "주문품목코드"
						, "주문품목명"
						, "판매가"
						, "부가세"
						, "주문수량"
						, "사용연한"
						, "생산처 코드" ],
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
					autoheight: true,
					autowidth : true,
					search : true						
				});
			
				// 검색, 추가, 수정, 삭제 기능 
				$('#orderList').jqGrid('navGrid', "#pagerOrderList", {
					search : true, 
					edit : true,
					add : true,
					del : true,
					cancel : true,
					refresh : true,

				}, {}, {
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
						return "oper=del&itemCode=" + postdata.id
					}
				}

				);
			});
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