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
	//판매업체 등록 처리  
	function insertVendor() {
		if (checkValue())
			document.register.submit();
	}
</script>
<script>

	// 필수 입력정보가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.register.vendorCode.value) {
			alert("사업자등록번호를 입력해주세요.");
			return false;
		}
		if (!document.register.vendorName.value) {
			alert("사업체명을 입력해주세요.");
			return false;
		}
		if (!document.register.vendorOwner.value) {
			alert("이름을 입력해주세요.");
			return false;
		}
		if (!document.register.vendorLoc.value) {
			alert("주소를 입력해주세요.");
			return false;
		}
		if (!document.register.vendorPhone.value) {
			alert("휴대폰 번호를 입력해주세요.");
			return false;
		}
		if (!document.register.vendorBank.value) {
			alert("계좌정보를 선택해주세요.");
			return false;
		}
		if (!document.register.vendorAccount.value) {
			alert("계좌번호를 입력해주세요.");
			return false;
		}
		if (!document.register.vendorBankowner.value) {
			alert("계좌주를 입력해주세요.");
			return false;
		}
		return true;
	}
</script>

<script type="text/javascript">

	var xmlhttp = new XMLHttpRequest();
	function vendorCodecheck() {
		xmlhttp.open("post", "checkVendorCode?vendorCode="
			+ document.getElementById("vendorCode").value);
		xmlhttp.onreadystatechange = callback;
		xmlhttp.send();
	}

	function callback() {
		var table = document.getElementById("vendorCode");
		table.innerHTML = "";

		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var object = eval('(' + xmlhttp.responseText + ')');
			console.log(object.result);
			if (object.result == false) {
				document.getElementById("50810087550").innerHTML = "번호가 중복됩니다.";
			} else {
				document.getElementById("50810087550").innerHTML = "사용가능";
			}

		}
	}


	//판매업체 수정 처리
	function updateVendor() {
		document.register["action"] = 'updateVendor';
		
		document.register.submit();

	}
</script>
<script>
	//업데이트 후 페이지 자동 새로고침
	function restorePage() {
		location.reload();
	}
</script>

<script>
 // 해결과제
 // 열 선택시 정보를 가져와 오른쪽 정보창에 뿌려주는 함수
 function onSelectRow(rowid, selected) {
			
	 if (rowid != null) {
				selectedVendorCode = $(this).getCell(rowid, 'vendorCode');
				jQuery("#vendorCode").jqGrid('setGridParam', {
					url : "/getVendor?vendorCode=" + selectedVendorCode
				});
			}
					console.log("선택된 판매코드 : " + selectedVendorCode);
		  } 
 

</script>

</head>
<body>
	<div class="page-header">
		<h1>
			구매업체 정보 &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
			&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 구매업체 관리 &emsp; &emsp;
			&nbsp;
			<button class="btn btn-primary" type="button"
				onclick='insertVendor()'>가입</button>
			<button class="btn btn-warning" type="button"
				onclick='updateVendor()'>수정</button>
			<button class="btn btn-danger" type="button" onclick='restorePage()'>취소</button>
		</h1>
	</div>

	<script type="text/javascript">
		$(function() {
			
	
			$("#list").jqGrid({
				url : "getVendorList",
				editurl : "VendorEdit",
				datatype : "json",
				styleUI : 'Bootstrap',
				colModel : [ {
					label : "사업자등록번호",
					name : "vendorCode",
					key : true,
					align : "center",
					width : 120,
					editable : false
				}, {
					label : "사업체명",
					name : "vendorName",
					width : 120,
					editable : false
				}, {
					label : "대표자명",
					name : "vendorOwner",
					width : 120,
					hidden : true,
					editable : false
				}, {
					label : "소재지",
					name : "vendorLoc",
					width : 250,
					align : "left",
					editable : true
				}, {
					label : "연락처",
					name : "vendorPhone",
					width : 120,
					align : "right",
					editable : true
				}, {
					label : "은행",
					name : "vendorBank",
					width : 120,
					hidden : true,
					editable : false
				}, {
					label : "계좌번호",
					name : "vendorAccount",
					width : 120,
					hidden : true,
					editable : false
					
				}, {
					label : "계좌주",
					name : "vendorBankowner",
					width : 120,
					hidden : true,
					editable : false
				} ],
				pager : "#pager",
				rowNum : 10,
				rowList : [ 10, 20, 30 ],
				sortname : "vendorCode",
				sortorder : "desc",
				viewrecords : true,
				gridview : false,
				autoencode : true,
				loadonce : true,
				onSelectRow : function (rowid) {
					 	
						if (rowid >= 0) {
					      var rowData = jQuery('#list').jqGrid ('getRowData', rowid);
				    
					     console.log(rowid);
					     
					     document.register.vendorCode.value = rowData.vendorCode;
					     document.register.vendorName.value = rowData.vendorName;
					     document.register.vendorOwner.value = rowData.vendorOwner;
					     document.register.vendorLoc.value = rowData.vendorLoc;
					     document.register.vendorPhone.value = rowData.vendorPhone;
					     document.register.vendorBank.value = rowData.vendorBank;
					     document.register.vendorAccount.value = rowData.vendorAccount;
					     document.register.vendorBankowner.value = rowData.vendorBankowner;
						}
					 
				 },
													
										
				rowNum : 10,
				height : 'auto',
				autowidth : true,
				responsive : true,
				multiselect : false,
				pager : "#pager"
			});
	
			$('#list').jqGrid('navGrid', "#pager", {
				search : true, 
				edit : false,
				add : false,
				del : true,
				cancel : false,
				refresh : false,
			}, {}, {}, {
				serializeDelData : function(postdata) {
					return "oper=del&vendorCode=" + postdata.id;
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

		<form class="form-horizontal" id="register" name="register"
			action="insertVendor">
			<div class="col-md-6">


				<div class="form-group">
					<label class="col-sm-3 control-label" for="vendorCode">사업자등록번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="vendorCode" name="vendorCode"
							type="text" placeholder="ID" onchange="vendorCodecheck()"><span
							id="50810087550"> 사업자등록번호는 필수입력입니다. </span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="vendorName">사업체명</label>
					<div class="col-sm-6">
						<input class="form-control" id="vendorName" name="vendorName"
							type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="vendorOwner">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="vendorOwner"
							name="vendorOwner" type="text">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="vendorLoc">주소</label>
					<div class="col-sm-6">
						<input class="form-control" id="vendorLoc" name="vendorLoc"
							type="text" placeholder="주소">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="vendorPhone">휴대폰번호</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="text" class="form-control" name="vendorPhone"
								id="vendorPhone" />


						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputBankInfo">계좌정보</label>
					<div class="col-sm-2">
						<div class="input-group">
							<select id="inputBank" class="form-control" name="vendorBank">
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
						class="col-sm-2" for="vendorAccount">계좌번호</label>
					<div class="col-sm-3">
						<div class="input-group">
							<input type="text" class="form-control" name="vendorAccount"
								id="vendorAccount" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="none2"></label> <label
						class="col-sm-2" for="vendorBankowner">계좌주</label>
					<div class="col-sm-3">
						<div class="input-group">
							<input type="text" class="form-control" id="vendorBankowner"
								name="vendorBankowner" />


						</div>
					</div>

				</div>



			</div>
		</form>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

</body>
</html>