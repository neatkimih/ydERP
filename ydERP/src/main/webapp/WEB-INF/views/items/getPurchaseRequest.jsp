<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>	
<script
	src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/daumaddr/daumAddr.js"></script>




<script>
	//해결 과제
	//검색시 DB에서 ItemsName 값을 Mapping하여 자동완성기능
	$(function() {
		$("#autocomplete").autocomplete({
			source : function(request, response) {
				$.ajax({
					type : 'post',
					url : "/getItemsList.do",
					dataType : "json",
					data : {
						value : request.term
					},
					success : function(data) {
						response(
							$.map(data, function(item) {
								return {
									label : item.data,
									value : item.data
								}
							})
						);
					}
				});
			},
			//조회를 위한 최소글자수
			minLength : 2,
			select : function(event, ui) {
				// 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
			}
		});
	})
</script>
<script>
	//대분류, 중분류 선택에 따라서, 하위 분류 목록이 달라지도록 설정된 함수
	$(function() {

		$(document.body).on("change", "#first", firstChange);
		$(document.body).on("change", "#second", secondChange);

	});

	function firstChange() {
		var x = document.FormPost.first.selectedIndex;
		var groups = document.FormPost.first.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++) {
			group[i] = new Array();
		}
		group[0][0] = new Option("대분류", "");
		group[1][0] = new Option("중분류 선택", "");
		group[1][1] = new Option("볼펜", "B");
		group[1][2] = new Option("형광펜", "C");
		group[1][3] = new Option("샤프", "S");
		group[1][4] = new Option("연필", "P");
		group[2][0] = new Option("중분류 선택", "");
		group[2][1] = new Option("복사용지", "A");
		group[2][2] = new Option("노트", "N");
		group[3][0] = new Option("중분류 선택", "");
		group[3][1] = new Option("수정용품", "E");
		group[3][2] = new Option("칼/가위", "K");
		group[3][3] = new Option("용지", "J");
		group[3][4] = new Option("견출지", "G");
		group[4][0] = new Option("중분류 선택", "");
		group[4][1] = new Option("화일", "F");
		group[4][2] = new Option("바인더", "V");

		temp = document.FormPost.second;
		for (m = temp.options.length - 1; m > 0; m--) {
			temp.options[m] = null
		}
		for (i = 0; i < group[x].length; i++) {

			temp.options[i] = new Option(group[x][i].text, group[x][i].value);
		}
		temp.options[0].selected = true
	}

	function secondChange() {
		var first = document.FormPost.first.selectedIndex;
		var x = document.FormPost.second.options.selectedIndex;
		var groups = document.FormPost.second.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++) {
			group[i] = new Array();
		}
		if (first == 1) {
			group[0][0] = new Option("소분류", "");

			group[1][0] = new Option("소분류 선택", "");
			group[1][1] = new Option("유성볼펜", "O");
			group[1][2] = new Option("수성펜", "W");
			group[1][3] = new Option("중성펜", "N");

			group[2][0] = new Option("소분류 선택", "");
			group[2][1] = new Option("형광펜", "C");
			group[2][2] = new Option("붓펜", "B");

			group[3][0] = new Option("소분류 선택", "");
			group[3][1] = new Option("일반 샤프", "R");
			group[3][2] = new Option("샤프심", "S");
			group[4][0] = new Option("소분류 선택", "");
			group[4][1] = new Option("연필", "P");
			group[4][2] = new Option("연필깎이", "G");
			group[4][3] = new Option("색연필", "S");

		} else if (first == 2) {
			group[0][0] = new Option("소분류", "");

			group[1][0] = new Option("소분류 선택", "");
			group[1][1] = new Option("A4", "A");
			group[1][2] = new Option("A3", "B");
			group[1][3] = new Option("B4", "C");
			group[1][4] = new Option("B5", "D");

			group[2][0] = new Option("소분류 선택", "");
			group[2][1] = new Option("재생용지", "P");
			group[2][2] = new Option("일반노트", "R");
			group[2][1] = new Option("수첩", "H");
			group[2][2] = new Option("중고노트", "U");

		} else if (first == 3) {
			group[1][0] = new Option("소분류 선택", "");
			group[1][1] = new Option("수정테이프", "T");
			group[1][2] = new Option("지우개", "E");

			group[2][0] = new Option("소분류 선택", "");
			group[2][1] = new Option("소형커터", "S");
			group[2][2] = new Option("대형커터", "L");
			group[2][1] = new Option("커터날", "N");

			group[3][0] = new Option("소분류 선택", "");
			group[3][1] = new Option("일반포스트잇", "P");
			group[3][2] = new Option("메모지", "M");

			group[4][0] = new Option("소분류 선택", "");
			group[4][1] = new Option("일반견출지", "R");
			group[4][2] = new Option("보호비닐견출지", "B");
			group[4][3] = new Option("원형/모양견출지", "S");

		} else if (first == 4) {
			group[1][0] = new Option("소분류 선택", "");
			group[1][1] = new Option("일반 화일", "R");
			group[1][2] = new Option("종이 화일", "P");

			group[2][0] = new Option("소분류 선택", "");
			group[2][1] = new Option("장식 화일", "S");
			group[2][2] = new Option("D링 바인더", "D");
			group[2][1] = new Option("아치 바인더", "A");

		}

		temp = document.FormPost.third;
		for (m = temp.options.length - 1; m > 0; m--) {
			temp.options[m] = null
		}
		for (i = 0; i < group[x].length; i++) {
			temp.options[i] = new Option(group[x][i].text, group[x][i].value)
		}
		temp.options[0].selected = true
	}
</script>
<div class="page-header">
		<h1>
			구매요청 내역 &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
			&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 구매요청 &emsp; &emsp;
			&nbsp; &emsp; &nbsp; &nbsp;  &nbsp; 
			
				<input class="btn btn-success" type="button" value="주문하기"
					onclick="priceCalc()">
			
		</h1>
	</div>

<script type="text/javascript">
	$(function() {


		$("#list").jqGrid({
			url : "getCustomerList",
			editurl : "CustomerEdit",
			datatype : "json",
			styleUI : 'Bootstrap',
			colModel : [ {
				label : "구매번호",
				name : "customerCode",
				key : true,
				align : "center",
				width : 120,
				editable : false
			}, {
				label : "품목명",
				name : "customerName",
				width : 120,
				editable : false
			}, {
				label : "도착지",
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
			/* onSelectRow : function(id) {

				jQuery(this).editRow(id, true)
			}, */
			rowNum : 10,
			height : 'auto',
			autowidth : true,
			responsive : true,
			multiselect : true,
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

<!-- Jqgrid -->
<div class="col-md-6">

	<table id="list">
		<tr>
			<td></td>
		</tr>
	</table>

	<div id="pager"></div>
</div>
<!-- 구매신청 -->
<div class="col-md-6">
<form class="form-horizontal" id="FormPost" name="FormPost">
		<div class="form-group">
			<label for="Category" class="col-md-3 control-label">품목종류</label>
			<div class="col-md-2">
				<select class="form-control" id="first" name="first"
					onchange="firstChange()">
					<option value=''>대분류</option>
					<option value='P'>필기구</option>
					<option value='J'>종이</option>
					<option value='O'>일반사무용품</option>
					<option value='F'>화일/바인더</option>
				</select>
			</div>
			<div class="col-md-2">
				<select class="form-control" id="second" name="second"
					onchange="secondChange()">
					<option value=''>중분류</option>
				</select>
			</div>
			<div class="col-md-2">
				<select class="form-control" id="third" name="third">
					<option value=''>소분류</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="departureSize" class="col-md-3 control-label">품목명</label>
			<div class="col-md-6">
				<input class="form-control" type="text" id="autocomplete"
					name="autocomplete" />
			</div>
		</div>

		<div class="form-group">
			<label for="category" class="col-md-3 control-label">UOM</label>
			<div class="col-md-2">
				<select class="form-control" id="uom" name="uom">
					<option value=''>선택</option>
					<option value='Set'>Set</option>
					<option value='Box'>Box</option>
					<option value='Other'>Other</option>
					<option value='Another'>Another</option>
				</select>
			</div>


			<label for="departureSize" class="col-md-2 control-label">수량</label>
			<div class="col-md-2">
				<input class="form-control" type="number" id="itemQty"
					name="itemQty" />
			</div>
		</div>

		<div class="form-group">
			<label for="hopeDate" class="col-md-3 control-label">희망 도착 날짜</label>
			<div class="col-md-6">
				<input type="text" class="form-control" id="hopeDate"
					name="hopeDate">

				<script>
					$("#hopeDate").datetimepicker({
						locale : 'ko',
						format : 'YYYY-MM-DD',
						showClose : true,
						showClear : true,
						showTodayButton : true,
						stepping : 30,
						defaultDate : new Date(),
						sideBySide : true
					});
				</script>
			</div>
		</div>

		<div class="form-group">
			<label for="ArriveAddr" class="col-md-3 control-label">도착 배송지</label>
			<div class="col-md-6">
				<input class="form-control" type="text" id="ArriveAddr"
					name="ArriveAddr" style="cursor: pointer;"
					onclick="addrDialog(this)" placeholder="도착지" readonly>
			</div>
		</div>

		<div class="form-group">
			<label for="cellphone" class="col-md-3 control-label">연락처</label>
			<div class="col-md-3">
				<input class="form-control" type="text" id="cellphone"
					name="cellphone" />
			</div>


		</div>


		<div class="form-group">
			<label for="fullprice" class="col-md-3 control-label">총 금액</label>
			<div class="col-md-3">
				<input type="text" class="form-control" id="fullprice"
					placeholder="총 금액">
			</div>


			

		</div>


	</form>
</div>



