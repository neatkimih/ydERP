<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" 
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
<script src="./scripts/jquery-3.3.1.min.js"></script>
<script src="./scripts/json.min.js"></script>

<script type="text/javascript">
	$(function() {
		requestList();
	});

	function requestList() {
		$.ajax({
			url : "getPurchaseRequestListData",
			type : "GET",
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			success : requestListResult
		});
	};
	function requestListResult(datas) {
		$("tbody").empty();
		$.each(datas.data, function(idx, item) {
			$("<tr>").append($("<td name='itemCode'>").html(item.itemCode))
					 .append($("<td name='itemName'>").html(item.itemName))
					 .append($("<td name='uom'>").html(item.uom))
					 .append($("<td name='inQty'>").html(item.inQty))
					 .append($("<td name='supplyPrice'>").html(item.supplyPrice))
					 .append($("<td name='sellingPrice'>").html(item.sellingPrice))
					 .append($("<td name='itemTax'>").html(item.itemTax))
					 .append($("<td name='expireDate'>").html(item.expireDate))
					 .append($("<td name='vendorName'>").html(item.vendorName))
					 .append($("<td name='minQty'>").html(item.minQty))
					 .append($("<td name='onhandQty'>").html(item.onhandQty))
					 .append($("<td name='reqQty'>").html(item.reqQty))
					 //.append($("<td>").html("<button id=\'btnSelect\' >조회</button>"))
					 //.append($("<td>").html("<button id=\'btnDelete\' >삭제</button>"))
					 //.append($("<input type=\"hidden\" id=\'hidden_id\' />").val(item.seq))
					 .appendTo("tbody");
		});
	};
</script>
</head>
<body>
	<form name="frm" action="insertPurchaseRequest">
		<input type="submit" value="주문요청생성" />
		<div class="col-lg-12">
			<table id="list" border="1">
				<thead><tr>
					<th>품목코드</th>
					<th>품목명</th>
					<th>UOM</th>
					<th>인입수량</th>
					<th>구매가</th>
					<th>판매가</th>
					<th>부가세율</th>
					<th>사용연한</th>
					<th>구매업체</th>
					<th>최저재고</th>
					<th>현재고</th>
					<th>요청수량</th>
				</tr></thead>
				<tbody></tbody>
			</table>
			<div id="pager"></div>
		</div>
	</form>
</body>
</html>