<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>구매요청생성</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
<script src="./scripts/json.min.js"></script>

<script type="text/javascript">
	var allData;

	$(function() {
		requestList();
		insertRequestTemp();

	});

	function insertRequestTemp() {
		$("#btn1").click(function() {
			var params = [];

			$("[name=checkSeq]:checked").each(function(idx, check) {
				//console.dir($(check).val())
				var rowid = $(check).val();
				params.push(allData[rowid]);
				console.log(params);
			})

			$.ajax({
				url : "./insertPurchaseRequestTemp",
				type : "PUT",
				dataType : "json",
				data : JSON.stringify(params),
				contentType : "application/json;charset=utf-8",
				success : function() {
					console.log("complete")
					//requestTempList;
					requestList();
				}
			});
		})
	}

	function requestList() {
		var group1 = $("#itemgroup1").val();
		var group2 = $("#itemgroup2").val();
		var group3 = $("#itemgroup3").val();
		var warehs = $("#warehouseSelect").val();
		$.ajax({
			url : "getPurchaseRequestListData?group1="+group1+"&group2="+group2+"&group3="+group3+"&vendorCode="+warehs,
			type : "GET",
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			success : requestListResult
		})
	}
	function requestListResult(datas) {
		allData = datas.data;
		$("tbody").empty();
		$.each(datas.data, function(idx, item) {
			$("<tr>").append($("<td align='center'> <input type='checkbox' value='"+idx+"' name='checkSeq' >"))
					 .append($("<td name='itemCode'>").html(item.itemCode))
					 .append($("<td name='itemName'>").html(item.itemName))
					 .append($("<td name='uom'>").html(item.uom))
					 .append($("<td align='right' name='inQty'>").html(item.inQty))
					 .append($("<td align='right' name='supplyPrice'>").html(item.supplyPrice))
					 .append($("<td align='right' name='sellingPrice'>").html(item.sellingPrice))
					 .append($("<td align='right' name='itemTax'>").html(item.itemTax))
					 .append($("<td name='expireDate'>").html(item.expireDate))
					 .append($("<td name='vendorName'>").html(item.vendorName))
					 .append($("<td align='right' name='minQty'>").html(item.minQty))
					 .append($("<td align='right' name='onhandQty'>").html(item.onhandQty))
					 .append($("<td align='right' name='reqQty'>").html(item.reqQty))
					 //.append($("<td>").html("<button id=\'btnSelect\' >조회</button>"))
					 //.append($("<td>").html("<button id=\'btnDelete\' >삭제</button>"))
					 //.append($("<input type=\"hidden\" id=\'hidden_id\' />").val(item.seq))
					 .appendTo("tbody");
		});
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


	function allCheck(cdata) {
		var chk = document.getElementsByName("checkSeq");
		for (i = 0; i < chk.length; i++) {
			chk[i].checked = cdata;
		/* if (chk[i].checked == true)
				chk[i].checked = false;
			else
				chk[i].checked = true; */
		}
	}
	title_nav = "[ getPurchaseRequestList.jsp >>> 최저재고 확보를 위한 구매요청화면 ]";
</script>
</head>
<body>
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">[ ]</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<input type="checkbox" id="autosearch"
							onclick="allCheck(this.checked)"> 전체선택
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
					<div class="col-lg-3">
						<button onclick="requestList()" id="submitButton"
							class="btn btn-outline btn-success btn-block">Search</button>
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
						<button id="btn1" class="btn btn-outline btn-success btn-block">주문요청생성</button>
					</div>
				</div>
				<br>
			</div>
		</div>
	</div>
	<form name="frm" action="insertPurchaseRequest">
		<!-- <input type="button" value="주문요청생성" id="btn1" /> -->
		<div class="col-lg-12">
			<table id="list" border="1" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>선택</th>
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
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div id="pager"></div>
		</div>
	</form>
</body>
</html>