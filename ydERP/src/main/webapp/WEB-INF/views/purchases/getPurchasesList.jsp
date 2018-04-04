<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>구매전체조회</title>
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid.css" />

<script src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(function () {
    $("#list").jqGrid({ 
        url: "getPurchasesList",
        datatype: "json",
        mtype: "GET",
        colModel: [
            {label:"번호",  name: "seq", width: 55 },
            {label:"작성자", name: "writer", width: 90 },
            {label:"제목", name: "title", width: 280, align: "right" },
            {label:"조회수", name: "cnt", width: 80, align: "right" },
            {label:"작성일자", name: "regDate", width: 80, align: "right" }
        ],
        pager: "#pager",
        rowNum: 10,
        rowList: [10, 20, 30],
        sortname: "invid",
        sortorder: "desc",
        viewrecords: true,
        gridview: true,
        autoencode: true,
        caption: "My first grid"
    }); 
}); 
</script>

</head>
<body>
    <table id="list"><tr><td></td></tr></table> 
    <div id="pager"></div> 
</body>
</html>