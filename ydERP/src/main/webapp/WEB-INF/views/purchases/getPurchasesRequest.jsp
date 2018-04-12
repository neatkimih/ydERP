<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Insert title here</title>
<script type="text/javascript">
	$(function() {
	
		$("#list").jqGrid({
			url : "getItemsList.do",
			editurl : "getItemsDataEdit",
			datatype : "json",
			styleUI : 'Bootstrap',
			colModel : [ {
				label : "품목코드",
				name : "itemCode",
				key : true,
				width : 90,
				editable : false
			}, {
				label : "품목 대분류",
				name : "pGroup1",
				width : 300,
				editrules:{
                    required:true, 
                    edithidden:true
                 },
				hidden : true,
				editable : true,
				edittype : "select",
				editoptions : {value:":선택;P:필기구;J:종이;O:일반사무용품;F:화일/바인더"}
			},	{
				label : "품목 중분류",
				name : "pGroup2",
				width : 300,
				editrules:{
                    required:true, 
                    edithidden:true
                 },
				hidden : true,
				editable : true,
				edittype : "select",
				editoptions : {value:":선택"}
			},	{
				label : "품목 소분류",
				name : "pGroup3",
				width : 300,
				editrules:{
                    required:true, 
                    edithidden:true
                 },
				hidden : true,
				editable : true,
				edittype : "select",
				editoptions : {value:":선택"}
			},
						
				{
				label : "품목 이름",
				name : "itemName",
				width : 250,
				editable : true
			}, {
				label : "UOM",
				name : "uom",
				width : 55,
				align : "center",
				editable : true
			}, {
				label : "수량",
				name : "inQty",
				width : 40,
				align : "right",
				editable : true
				
			}, {
				label : "최소 수량",
				name : "minQty",
				width : 40,
				align : "right",
				editable : true
				
			},	{
				label : "공급가",
				name : "supplyPrice",
				width : 90,
				align : "right",
				editable : true
			}, {
				label : "판매가",
				name : "sellingPrice",
				width : 90,
				align : "right",
				editable : true
			}, {
				label : "부가세",
				name : "itemTax",
				width : 55,
				align : "right",
				editable : true
			}, {
				label : "사용연한",
				name : "expireDate",
				width : 75,
				align : "right",
				editable : true
			}, {
				label : "판매자코드",
				name : "vendorCode",
				width : 90,
				align : "right",
				editable : true
			}],
			pager : "#pager",
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			sortname : "itemCode",
			sortorder : "desc",
			viewrecords : true,
			gridview : true,
			autoencode : true,
			loadonce : true,
			//onSelectRow : editRow,
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
			add : true,
			del : true,
			cancel : true,
			refresh : true,

		}, {}, {
						
			closeAfterAdd : true,
			reloadAfterSubmit : true,
			template : $("#form1").html(),
			afterComplete : function() {
				$("#list").setGridParam({
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');
			}
		}, {
			serializeDelData : function(postdata) {
				return "oper=del&itemCode=" + postdata.id
			}
		}

		);

		$('#list').inlineNav('#pager', {
			edit : true,
			add : false

		});

	});
</script>
</head>

<body>
<!-- <form name="form1">

		<select name=first onchange="firstChange()" size=1>
			<option value=''>대분류</option>
			<option value="P">필기구</option>
			<option value="J">종이</option>
			<option value="O">일반사무용품</option>
			<option value="F">화일/바인더</option>
		</select> <select name=second onchange="secondChange()" size=1>
			<option value=''>대분류를 먼저 선택하세요</option>
		</select> <select name=third size=1>
			<option value=''>중분류를 먼저 선택하세요</option>
		</select>

	</form> -->
	<table id="list">

		<tr>
			<td></td>
		</tr>
	</table>
	<div id="pager"></div>
	<br>




</body>
</html>