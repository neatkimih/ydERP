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
					pager : "#pagerSaleList",
					sortname : "판매코드",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					search : true,
					onSelectRow : function(id){
						var selectedSaleCode = $(this).jqGrid('getCell', id, 'saleCode');
						console.log("선택된 판매코드 : " + selectedSaleCode);
						
						
					}
				});
				
				$("#saleDetail").jqGrid({
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
						{
							name : "payStatus",
							width : 100,
							align : "center"
						},
						{
							name : "warehouse",
							width : 100,
							align : "center"
						},
						{	name : "orderPermit",	width : 100,	align : "center"
						}
					],
					pager : "#pagerSaleList",
					rowNum : 10,
					sortname : "판매코드",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					autoheight: true,
					autowidth : true,
					search : true,
					onSelectRow : function(id){
						var selectedSaleCode = $(this).jqGrid('getCell', id, 'saleCode');
						console.log("선택된 판매코드 : " + selectedSaleCode);
						
						
					}
				});
			});
		</script>
		<style type="text/css">
			.#saleListDiv {
				margin-left: auto;
				margin-right: auto;
				margin-top: 20px;
				margin-bottom: 20px;		
				text-align: center;
			}
			
			.#saleDetailDiv {
				margin-left: auto;
				margin-right: auto;
				margin-top: 20px;
				margin-bottom: 20px;		
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