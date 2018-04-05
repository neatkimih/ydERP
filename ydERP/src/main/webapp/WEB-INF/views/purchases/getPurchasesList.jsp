<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>구매전체조회</title>
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />

<script src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(function () {
    $("#list").jqGrid({ 
        url: "getPurchasesList",
        datatype: "json",
        mtype: "GET",
        styleUI : "Bootstrap",       
        colModel: [
            {label:"구매코드",  name: "purchaseCode", width: 110 },
            {label:"구매일자", name: "purchaseDate", width: 85 },
            {label:"구매처", name: "vendorCode", width: 80, align: "right" },
            {label:"품목코드", name: "purchaseItem", width: 80, align: "right" },
            {label:"구매수량", name: "purchaseQty", width: 80, align: "right" },
            {label:"구매단가", name: "purchasePrice", width: 80, align: "right" },
            {label:"부가세", name: "itemTax", width: 80, align: "right" },
            {label:"결제금액", name: "purchaseCost", width: 80, align: "right" }  
                                   
        ],
        pager: "#pager",
        rowNum: 10,
        rowList: [10, 20, 30],
        sortname: "invid",
        sortorder: "desc",
        viewrecords: true,
        gridview: true,
        autoencode: true,
        caption: "구매정보"
    }); 
}); 
</script>

</head>
<body>
    <table id="list"><tr><td></td></tr></table> 
    <div id="pager"></div> 
</body>
</html>