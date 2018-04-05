<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" media="screen" href="../scripts/jquery-ui.min.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="./resources/jqGrid5/ui.jqgrid.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="../scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
		<script src="../resources/jqGrid5/grid.locale-kr.js" type="text/javascript"></script>
		<script src="../resources/jqGrid5/jquery.jqGrid.min.js" type="text/javascript"></script>
		<script>
			$(function()
			{
				$("#saleList").jqGrid
				({
					url: "getBoardListAjax",
					datatype: "json",
					colNames: ["판매코드"
								, "판매일자"
								, "판매처 코드"
								, "결제금액"
								, "배송지"
								, "배송사원 번호"
								, "배송상태"
								, "결제상태"
								, "출하창고"
								, "승인상태"],
					colModel: [
								{ name: "saleCode", width: 12, align: "center" },
								{ name: "saleDate", width: 10, align: "center" },
								{ name: "customerCode", width: 10, align: "center" },
								{ name: "saleCost", width: 20, align: "right"},
								{ name: "deliveryAddr", width: 100, align: "left" },
								{ name: "deliveryEmp", width: 10, align: "center" },
								{ name: "deliveryStatus", width: 1, align: "center" },
								{ name: "payStatus", width: 1, align: "center" },
								{ name: "warehouse", width: 1, align: "center" },
								{ name: "orderPermit", width: 1, align: "center" }
							],
					pager: "#pager"
				})
			})
		
		</script>
		<title>getSaleList.jsp</title>
	</head>
	<body>
		<table id="saleList">
    		<tr>
    			<td></td>
    		</tr>
    	</table> 
    	<div id="pager"></div>
	</body>
</html>