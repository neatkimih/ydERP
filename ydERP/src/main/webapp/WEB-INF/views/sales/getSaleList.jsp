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
				/* Sale List : 마스터 그리드 */
				$("#saleList").jqGrid({
					url : "getSaleList.do",
					datatype : "json",
					styleUI : "Bootstrap",
					colNames : [ "판매코드"
						, "판매처 코드"
						, "판매일자"
						, "결제금액"
						, "배송지"
						, "배송사원 번호"
						, "배송상태"
						, "결제상태"
						, "출하창고"
						, "승인상태" ],
					colModel : [
						{	name : "saleCode",		width : 120,	align : "center"	},
						{	name : "customerCode",	width : 100,	align : "center"	},
						{	name : "saleDate",		width : 200,	align : "center"	},
						{	name : "saleCost",		width : 100,	align : "right"		},
						{	name : "deliveryAddr",	width : 200,	align : "left"		},
						{	name : "deliveryEmp",	width : 100,	align : "center"	},
						{	name : "deliveryStatus",width : 100,	align : "center"	},
						{	name : "payStatus",		width : 100,	align : "center"	},
						{	name : "warehouse",		width : 100,	align : "center"	},
						{	name : "orderPermit",	width : 100,	align : "center"	}
					],
					autoheight: true,
					autowidth : true,
					rowNum : 10,
					viewrecords : true,
					gridview : true,
					autoencode : true,
					search : true,
					sortname : "saleCode",
					caption : "판매 내역 정보",
					pager : "#pagerSaleList",					
					onSelectRow : function(rowid, selected) {
						if(rowid != null) {
							// var selectedSaleCode = $(this).jqGrid('getCell', selected, 'saleCode');
							var selectedSaleCode = $(this).getCell(rowid,'saleCode');
							jQuery("#saleDetail").jqGrid('setGridParam', {url: "./getSaleDetail.do?saleCode="+selectedSaleCode});
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
					colNames : [ "판매코드"
						, "판매상세코드"
						, "판매품목코드"
						, "판매품목명"
						, "판매가"
						, "부가세"
						, "판매수량"
						, "사용연한"
						, "생산처 코드" ],
					colModel : [
						{	name : "saleCode",		width : 120,	align : "center"	},
						{	name : "saleDetailCode",width : 100,	align : "center"	},
						{	name : "saleItemCode",	width : 200,	align : "center"	},
						{	name : "saleItemName",	width : 100,	align : "right"		},
						{	name : "salePrice",		width : 200,	align : "left"		},
						{	name : "itemTax",		width : 100,	align : "center"	},
						{	name : "saleQty",		width : 100,	align : "center"	},
						{	name : "expireDate",	width : 100,	align : "center"	},
						{	name : "vendorCode",	width : 100,	align : "center"	},
					],
					pager : "#pagerSaleDetail",
					rowNum : 10,
					sortname : "saleDetailCode",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					autoheight: true,
					autowidth : true,
					search : true						
				});
			});
		</script>
		<style type="text/css">
			.#saleListDiv {
				margin-left: auto;
				margin-right: auto;
				padding: 50px;
				text-align: center;
			}
			
			.#saleDetailDiv {
				margin-left: auto;
				margin-right: auto;
				padding: 50px;
				text-align: center;
			}
		
		</style>
		<title>getSaleList.jsp</title>
	</head>
	<body>
		<div id="saleListDiv">
			<table id="saleList">
				<tr>
					<td></td>
				</tr>
			</table>
			<div id="pagerSaleList"></div>
		</div>
		<br>
		<hr>
		<br>
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