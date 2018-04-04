<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head><title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="./scripts/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="./resources/jqGrid/css/ui.jqgrid.css" />


<script src="./resources/jqGrid/js/jquery-1.7.2.min.js"></script>
<script src="./resources/jqGrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
<script src="./resources/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>


 
<script type="text/javascript">
$(function () {
    $("#list").jqGrid({
    	url: "getItemsListAjax",
        datatype: "json",
        
    	colNames: ["item_code", "품목정보", "UOM", "수량", "공급가","판매가","부가세","사용연한","판매자코드"],
        colModel: [
            { name: "item_code", width: 55 },
            { name: "item_name", width: 90 },
             { name: "uom", width: 90 },
            { name: "in_qty", width: 280, align: "right" },
            { name: "supply_price", width: 80, align: "right" },
             { name: "selling_price", width: 80, align: "right" }, 
            { name: "item_tax", width: 80, align: "right" },
            { name: "expire_date", width: 80, align: "right" }, 
            { name: "vendor_code", width: 80, align: "right" },
        ],
        pager: "#pager",
        rowNum: 10,
        rowList: [10, 20, 30],
        sortname: "item_code",
        sortorder: "desc",
        viewrecords: true,
        gridview: true,
        autoencode: true,
        
    }); 
}); 
</script>
</head>
<body>

<table id="list"><tr><td></td></tr></table> 
    <div id="pager"></div> 

</body>
</html>