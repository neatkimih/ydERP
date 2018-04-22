<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />

<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
	var selectedItem;
	var lastsel;

	$(function() {
		jQuery("#list").jqGrid(
				{
					url : "getLookups.do",
					datatype : "json",
					styleUI : "Bootstrap",
					height : 380,
					autoheight : true,
					autowidth : true,

					colNames : [ "룩업", "룩업코드", "코드값", "코드Value", "코드설명",
							"사용여부", "룩업DFF", "대표코드" ],

					colModel : [ {
						name : "LOOKUP_DESCRIPTION",
						index : 'LOOKUP_DESCRIPTION',
						width : 3,
						editable : false,
						editoptions : {
							readonly : true,
							size : 10
						}
					}, {
						name : "LOOKUP",
						width : 5,
						index : 'LOOKUP',
						editable : true,
						editoptions : {
							size : 10
						}
					}, {
						name : "LOOKUP_CODE",
						width : 2,
						index : 'LOOKUP_CODE',
						editable : true,
						editoptions : {
							size : 25
						}
					}, {
						name : "LOOKUP_VALUES",
						width : 2,
						index : 'LOOKUP_VALUES',
						align : "right",
						editable : true,
						editoptions : {
							size : 10
						}
					}, {
						name : "DESCRIPTIONS",
						width : 2,
						index : 'DESCRIPTIONS',
						align : "right",
						editable : true,
						edittype : "textarea",
						editoptions : {
							size : 10
						}
					}, {
						name : "FLAG",
						width : 2,
						index : 'FLAG',
						edittype : "checkbox",
						align : "right",
						editable : true,
						editoptions : {
							size : 10
						}
					}, {
						name : "DFF",
						width : 2,
						index : 'DFF',
						align : 'center',
						editable : true,
						editoptions : {
							value : "Yes:No"
						}
					/* }, {
						name : 'ship_via',
						index : 'ship_via',
						width : 70,
						editable : true,
						edittype : "select",
						editoptions : {
							value : "FE:FedEx;TN:TNT"
						} */
					}, {
						name : "REFLAG",
						width : 2,
						index : 'REFLAG',
						sortable : false,
						editable : true,
						editoptions : {
							rows : "2",
							cols : "20"
						}
					} ],
					rowNum : 10,
					rowList : [ 10, 20, 30 ],
					pager : '#pager',
					sortname : 'LOOKUP',
					viewrecords : true,
					loadonce : true,
					sortorder : "desc",
					editurl : "updateLookups.do",
					caption : "룩업코드",
					height : 400
				});

		jQuery("#list").jqGrid('navGrid', '#pager', {
			edit : false,
			add : false,
			del : false
		}, //options 
		{
			height : 400,
			reloadAfterSubmit : false,
			complete : $("#list").click(function() {
				var gr = jQuery("#list").jqGrid('getGridParam', 'selrow');
				if (gr != null)
					jQuery("#list").jqGrid('editGridRow', gr, {
						height : 280,
						reloadAfterSubmit : false
					});
				else
					alert("Please Select Row");
			})
		}, // edit options 
		{
			height : 400,
			reloadAfterSubmit : false
		}, // add options 
		{
			reloadAfterSubmit : false
		}, // del options 
		{} // search options 
		);
	});

	var timeoutHnd;
	var flAuto = false;

	function doSearch(ev) {
		if (!flAuto)
			return;
		//		var elem = ev.target||ev.srcElement;
		if (timeoutHnd)
			clearTimeout(timeoutHnd)
		timeoutHnd = setTimeout(gridReload, 500)
	}

	function gridReload() {
		var vend_cd = jQuery("#warehouseSelect").val();
		jQuery("#list").jqGrid('setGridParam', {
			url : "getLookups.do?LOOKUP=" + vend_cd,
			datatype : "json",
			page : 1
		}).trigger("reloadGrid");
	}
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled", state);
	}

	title_nav = "[ getLookups.jsp ::: 룩업 조회 및 관리 ]";
</script>
</head>
<body>
	<div class="col-lg-6">
		<div class="panel panel-default">
			<div class="panel-heading">조회조건==================================</div>
			<div class="container" style="margin-top: 10px">
				<div class="col-lg-3">
					<select id="warehouseSelect" name="searchWarehouse"
						class="form-control">
						<option value="">룩업 선택</option>
						<c:forEach items="${lookupList}" var="lkup">
							<option value="${lkup.LOOKUP}">${lkup.LOOKUP_DESCRIPTION}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-lg-3">
					<button onclick="gridReload()" id="submitButton"
						class="btn btn-outline btn-success btn-block">Search</button>
				</div>
			</div>
			<br>
		</div>
	</div>
	<br>
	<div class="col-lg-12">
		<table id="list">
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="pager"></div>
	</div>
</body>
</html>