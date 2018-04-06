<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>구매전체조회</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />

<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>

<script type="text/javascript">

	$(function() {		
		
		$("#list").jqGrid({
			url : "getPurchasesList",
			datatype : "json",
			mtype : "GET",
			styleUI : "Bootstrap",			
			autowidth:true,			
			colModel : [
				{
					label : "구매코드",
					name : "purchaseCode",
					width : 110
				},
				{
					label : "구매일자",
					name : "purchaseDate",
					width : 85
				},
				{
					label : "구매처",
					name : "vendorCode",
					width : 80,
					align : "right"
				},
								
				{
					label : "결제금액",
					name : "purchaseCost",
					width : 80,
					align : "right"
				}

			],
			pager : "#pager",
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			sortname : "invid",
			sortorder : "desc", 
			viewrecords : true,
			navGrid : { view:true, del:false},
			gridview : true,
			autoencode : true,
			onSelectRow: function(rowid, selected) {
				if(rowid != null) {
					jQuery("#list1").jqGrid('setGridParam',{url:"getPurchaseDetailList",datatype: 'json'}); // the last setting is for demo only
					jQuery("#list1").jqGrid('setCaption', "purchaseDatailCode");
					jQuery("#list1").trigger("reloadGrid");
				}					
			}, // use the onSelectRow that is triggered on row click to show a details grid
			onSortCol : clearSelection,
			onPaging : clearSelection,
			caption : "구매정보"			
		});
		
		
		$("#list1").jqGrid({
			url : "getPurchaseDetailList",
			datatype : "json",
			mtype : "GET",
			styleUI : "Bootstrap",
			autowidth:true,
			colModel : [
				
				{
					label : "구매상세코드",
					name : "purchaseDatailCode",
					width : 110
				}, 				
				{
					label : "구매코드",
					name : "purchaseCode",
					width : 110
				}, 
				{
					label : "품목코드",
					name : "purchaseItem",
					width : 85
				},
				{
					label : "품목수량",
					name : "purchaseQty",
					width : 80,
					align : "right"
				}, 			 	
				{
					label : "품목단가",
					name : "purchasePrice",
					width : 80,
					align : "right"
				},
			
				{
					label : "부가세",
					name : "itemTax",
					width : 80,
					align : "right"
				},			
				
				{
					label : "배송상태",
					name : "itemTax",
					width : 80,
					align : "right"
				}			
				
			], 
			pager : "#pager1",		
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			sortname : "invid",
			sortorder : "desc",
			viewrecords : true,
			gridview : true,
			autoencode : true,			
			caption : "구매상세정보"
		}) .navGrid("#pager1", {		
		/* options */
			add:true,edit:true,view:true,del:true,search:true,refresh:true
   			//add:false,edit:false,view:false,del:false,search:false,refresh:false
		 } 													
		,{/* Edit options */
			closeAfterAdd: true, 
			reloadAfterSubmit: false,
			closeOnEscape:true
		 } 		
		,{/* Add options */
			closeAfterAdd: true, 
			reloadAfterSubmit: false,
			closeOnEscape:true
		}
		,{/* Delete options */
			reloadAfterSubmit: false,
			closeOnEscape:true
		} 							
		,{/* Search options */
			closeOnEscape:true,
			onSearch:function(){									
			}//onSearch:function(){
		}//Search Option
		,{/* view parameters*/
			closeOnEscape:true  			
		});
		function clearSelection() {
			jQuery("#list1").jqGrid('setGridParam',{url: "getPurchaseDetailList", datatype: 'json'}); // the last setting is for demo purpose only
			jQuery("#list1").jqGrid('setCaption', "purchaseDatailCode");			
			jQuery("#list1").trigger("reloadGrid");
			
		}
	});

</script>

</head>
<body>

<div class="row">
  <div class="col-lg-8"><table id="list">
		<tr>
			<td></td>
		</tr>
	</table>
	<div id="pager"></div>
	</div>
  </div>
  <br><br><br>
  <div class="row">
  <div class="col-lg-6"><table id="list1">
		<tr>
			<td></td>
		</tr>
	</table>
	<div id="pager1"></div>
	</div>
</div>

</body>
</html>