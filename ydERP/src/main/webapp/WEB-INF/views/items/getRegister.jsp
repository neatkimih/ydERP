<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />

<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>
<script>
function insertCustomer() {
	document.register.submit();
}

function updateCustomer() {
	document.register.action.value = 'updateCustomer';
	document.register.submit();
	
}
function restorePage() {
	location.reload();
}
</script>
</head>
<body>
	<div class="page-header">
		<h1>
			판매업체 정보 &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
			&emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
			판매업체 관리 &emsp; &emsp; &nbsp;
			<button class="btn btn-primary" type="button" onclick='insertCustomer()'>
				가입</button>
				<button class="btn btn-warning" type="button" onclick='updateCustomer()'>
				수정</button>
			<button class="btn btn-danger" type="button" onclick='restorePage()'>취소</button>
		</h1>
	</div>

	<script type="text/javascript">
		$(function() {
			var selectedCustomerCode;
			
			$("#list").jqGrid({
				url : "getCustomerList",
				editurl : "CustomerEdit",
				datatype : "json",
				styleUI : 'Bootstrap',
				colModel : [ {
					label : "사업자등록번호",
					name : "customerCode",
					key : true,
					align : "center",
					width : 120,
					editable : false
				}, {
					label : "사업체명",
					name : "customerName",
					width : 120,
					editable : false
				}, {
					label : "소재지",
					name : "customerLoc",
					width : 250,
					align : "left",
					editable : true
				}, {
					label : "연락처",
					name : "customerPhone",
					width : 120,
					align : "right",
					editable : true

				} ],
				pager : "#pager",
				rowNum : 10,
				rowList : [ 10, 20, 30 ],
				sortname : "customerCode",
				sortorder : "desc",
				viewrecords : true,
				gridview : false,
				autoencode : true,
				loadonce : true,
				onSelectRow : function(rowid, selected) {
					if (rowid != null) {
						selectedCustomerCode = $(this).getCell(rowid, 'customerCode');
						jQuery("#customerCode").jqGrid('setGridParam', {
							url : "./getCustomerList?customerCode=" + selectedCustomerCode
						});
					}
					console.log("선택된 판매코드 : " + selectedCustomerCode);
				},
				rowNum : 10,
				height : 'auto',
				autowidth : true,
				responsive : true,
				multiselect : true,
				pager : "#pager"
			});

			$('#list').jqGrid('navGrid', "#pager", {
				search : true, // show search button on the toolbar
				edit : false,
				add : false,
				del : true,
				cancel : false,
				refresh : false,

			}, {}, {}, {
				serializeDelData : function(postdata) {
					console.dir( postdata+"===============");
					return "oper=del&customerCode=" + postdata.id;
				}
			}
			
			);

		});
	</script>
	<div class="row">
		<div class="col-md-6">
			<table id="list">

				<tr>
					<td></td>
				</tr>
			</table>


			<div id="pager"></div>
			<br>
		</div>

<form class="form-horizontal" id="register" name="register" action="getRegister">
		<div class="col-md-6">

			
				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerCode">사업자등록번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="customerCode" name="customerCode" type="text"
							placeholder="ID">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerName">사업체명</label>
					<div class="col-sm-6">
						<input class="form-control" id="customerName" name="customerName" type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerOwner">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="customerOwner" name="customerOwner" type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerPw">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="customerPw" name="customerPw" type="password"
							placeholder="비밀번호">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="PwCheck">비밀번호
						확인</label>
					<div class="col-sm-6">
						<input class="form-control" id="PwCheck"
							type="password" placeholder="비밀번호 확인">

					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerLoc">주소</label>
					<div class="col-sm-6">
						<input class="form-control" id="customerLoc" name="customerLoc" type="text"
							placeholder="주소">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerPhone">휴대폰번호</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="text" class="form-control" name="customerPhone" id="customerPhone" />


						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputBankInfo">계좌정보</label>
					<div class="col-sm-2">
						<div class="input-group">
							<select id="inputBank" class="form-control" name="customerBank">
								<option value="">선택</option>
								<option value="하나">하나</option>
								<option value="국민">국민</option>
								<option value="기업">기업</option>
								<option value="농협">농협</option>
							</select>

						</div>
					</div>
					<label class="col-sm-0 control-label" for="inputBankInfo">은행</label>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="none"></label> <label
						class="col-sm-2" for="customerAccount">계좌번호</label>
					<div class="col-sm-3">
						<div class="input-group">
							<input type="text" class="form-control" name= "customerAccount" id="customerAccount" />


						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="none2"></label> <label
						class="col-sm-2" for="customerBankowner">계좌주</label>
					<div class="col-sm-3">
						<div class="input-group">
							<input type="text" class="form-control"
								id="customerBankowner" name="customerBankowner" />


						</div>
					</div>

				</div>

			
			
		</div>
		</form>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

</body>
</html>
