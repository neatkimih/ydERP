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
	function insertCustomer() {
		if (checkValue())
			document.register.submit();
	}
</script>
<script>
	// 해결과제
	// 필수 입력정보가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.register.customerCode.value) {
			alert("사업자등록번호를 입력해주세요.");
			return false;
		}
		if (!document.register.customerName.value) {
			alert("사업체명을 입력해주세요.");
			return false;
		}
		if (!document.register.customerOwner.value) {
			alert("이름을 입력해주세요.");
			return false;
		}
		if (!document.register.customerPw.value) {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if (!document.register.customerLoc.value) {
			alert("주소를 입력해주세요.");
			return false;
		}
		if (!document.register.customerPhone.value) {
			alert("휴대폰 번호를 입력해주세요.");
			return false;
		}
		if (!document.register.customerBank.value) {
			alert("계좌정보를 선택해주세요.");
			return false;
		}
		if (!document.register.customerAccount.value) {
			alert("계좌번호를 입력해주세요.");
			return false;
		}
		if (!document.register.customerBankowner.value) {
			alert("계좌주를 입력해주세요.");
			return false;
		}
		return true;
	}
</script>
<script>
// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인

	function pwcheck() {
		if (document.register.customerPw.value != document.register.PwCheck.value) {
			pwcheckyn = false;
			alert("비밀번호가 틀립니다. 다시 입력해주세요.");
		} else {
			pwcheckyn = true;
		}
	}
</script>

<script type="text/javascript">
	// 해결과제
	// 사업자등록번호 중복체크.
	var xmlhttp = new XMLHttpRequest();
	function customerCodecheck() {
		xmlhttp.open("post", "checkCustomerCode?customerCode="
			+ document.getElementById("customerCode").value);
		xmlhttp.onreadystatechange = callback;
		xmlhttp.send();
	}

	function callback() {
		var table = document.getElementById("customerCode");
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
	function updateCustomer() {
		document.register["action"] = 'updateCustomer';
		
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
				selectedCustomerCode = $(this).getCell(rowid, 'customerCode');
				jQuery("#customerCode").jqGrid('setGridParam', {
					url : "/getCustomer?customerCode=" + selectedCustomerCode
				});
			}
					console.log("선택된 판매코드 : " + selectedCustomerCode);
		  } 
 

</script>

</head>
<body>
	
		<div class="col-md-24">
		<div class="panel-heading">
		<h1>
			판매업체 정보 &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
			&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 판매업체 관리 &emsp; &emsp;
			&nbsp;
			<button class="btn btn-primary" type="button"
				onclick='insertCustomer()'>가입</button>
			<button class="btn btn-warning" type="button"
				onclick='updateCustomer()'>수정</button>
			<button class="btn btn-danger" type="button" onclick='restorePage()'>취소</button>
		</h1>
	</div>
	</div>

	<script type="text/javascript">
		$(function() {
			
	
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
					label : "대표자명",
					name : "customerOwner",
					width : 120,
					hidden : true,
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
				}, {
					label : "은행",
					name : "customerBank",
					width : 120,
					hidden : true,
					editable : false
				}, {
					label : "계좌번호",
					name : "customerAccount",
					width : 120,
					hidden : true,
					editable : false
					
				}, {
					label : "계좌주",
					name : "customerBankowner",
					width : 120,
					hidden : true,
					editable : false
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
				onSelectRow : function (rowid) {
					 	
						if (rowid >= 0) {
					      var rowData = jQuery('#list').jqGrid ('getRowData', rowid);
				    
					     console.log(rowid);
					     
					     document.register.customerCode.value = rowData.customerCode;
					     document.register.customerName.value = rowData.customerName;
					     document.register.customerOwner.value = rowData.customerOwner;
					     document.register.customerLoc.value = rowData.customerLoc;
					     document.register.customerPhone.value = rowData.customerPhone;
					     document.register.customerBank.value = rowData.customerBank;
					     document.register.customerAccount.value = rowData.customerAccount;
					     document.register.customerBankowner.value = rowData.customerBankowner;
					     document.register.useFlag.value = rowData.useFlag;
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

		<form class="form-horizontal" id="register" name="register"
			action="insertCustomer">
			<div class="col-md-6">


				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerCode">사업자등록번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="customerCode" name="customerCode"
							type="text" placeholder="ID" onchange="customerCodecheck()"><span
							id="50810087550"> 사업자등록번호는 필수입력입니다. </span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerName">사업체명</label>
					<div class="col-sm-6">
						<input class="form-control" id="customerName" name="customerName"
							type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerOwner">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="customerOwner"
							name="customerOwner" type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerPw">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="customerPw" name="customerPw"
							type="password" placeholder="비밀번호">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="PwCheck">비밀번호 확인</label>
					<div class="col-sm-6">
						<input class="form-control" id="PwCheck" name="PwCheck"
							type="password" placeholder="비밀번호 확인" onchange="pwcheck()">

					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerLoc">주소</label>
					<div class="col-sm-6">
						<input class="form-control" id="customerLoc" name="customerLoc"
							type="text" placeholder="주소">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="customerPhone">휴대폰번호</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="text" class="form-control" name="customerPhone"
								id="customerPhone" />


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
							<input type="text" class="form-control" name="customerAccount"
								id="customerAccount" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="none2"></label> <label
						class="col-sm-2" for="customerBankowner">계좌주</label>
					<div class="col-sm-3">
						<div class="input-group">
							<input type="text" class="form-control" id="customerBankowner"
								name="customerBankowner" />


						</div>
					</div>

				</div>



			</div>
		</form>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

</body>
</html>
