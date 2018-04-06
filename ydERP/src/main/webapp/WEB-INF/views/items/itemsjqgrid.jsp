<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head><title>Insert title here</title>
   <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<link rel="stylesheet" type="text/css" media="screen" href="./scripts/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="./resources/jqgrid5/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="./resources/bootstrap4/bootstrap.min.css" />
 <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/jquery/jquery-ui.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	
<script src="./scripts/jquery-3.3.1.js"></script>
<script src="./resources/jqgrid5/grid.locale-kr.js" type="text/javascript"></script>
<script src="./resources/jqgrid5/jquery.jqGrid.min.js" type="text/javascript"></script>


</head>

<body>

<script type="text/javascript">
$(function () {
    $("#list").jqGrid({
    	url: "getItemsListGridData",
    	editurl: "getItemsDataEdit",
    	datatype: "json",
        
    	colNames: ["itemCode", "품목정보", "UOM", "수량", "공급가","판매가","부가세","사용연한","판매자코드"], 
        colModel: [
            { name: "itemCode", width: 90, editable: true },
            { name: "itemName", width: 300, editable: true },
            { name: "uom", width: 55, align: "center", editable: true },
            { name: "inQty", width: 40, align: "right", editable: true },
            { name: "supplyPrice", width: 90, align: "right", editable: true },
            { name: "sellingPrice", width: 90, align: "right", editable: true }, 
            { name: "itemTax", width: 55, align: "right", editable: true },
            { name: "expireDate", width: 75, align: "right", editable: true }, 
            { name: "vendorCode", width: 90, align: "right", editable: true },
        ],
        pager: "#pager",
        rowNum: 10,
        rowList: [10, 20, 30],
        sortname: "itemCode",
        sortorder: "desc",
        viewrecords: true,
        gridview: true,
        autoencode: true,
        loadonce : true,
    }); 
        $('#list').inlineNav('#pager',
        		
        		{
        			edit : true,
        			add : false,
        			del : true,
        			cancel : true,
        			editParams : {
        				keys : true,
        			},
        			addParams : {
        				keys : true
        			}
        			
        		});

 
    
}); 
</script>

</body>


<table id="list"><tr><td></td></tr></table> 
    <div id="pager"></div> 
<br>


</html>