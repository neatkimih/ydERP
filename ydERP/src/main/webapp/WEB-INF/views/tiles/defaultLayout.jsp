<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>YedamERP</title>

<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!--  Jquery UI CSS -->
<link href="${pageContext.request.contextPath}/resources/jquery/jquery-ui.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>


    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">YedamERP</a>
            </div>
            
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> 기초정보관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="getItemsList">품목정보</a>
                                </li>
                                <li>
                                    <a href="morris.html">구매처정보</a>
                                </li>
                                <li>
                                    <a href="morris.html">판매처정보</a>
                                </li>
                            </ul>                            
                        </li>
                        <li> 
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 구매정보<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="getPurchasesPage">구매정보조회</a>
                                </li>                            
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> 판매정보<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="getSaleList">판매내역 조회 / 수정</a>
                                </li>
                                <li>
                                    <a href="insertSale">판매내역 등록</a>
                                </li>
                                <li>
                                    <a href="deleteSale">판매내역 삭제</a>
                                </li>
                                <li>
                                    <a href="showSale">판매현황 조회</a>
                                </li>
                            </ul>
                        </li>                        
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> 재고정보<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">재고조회</a>
                                </li>
                                <li>
                                    <a href="buttons.html">입/출고조회</a>
                                </li>                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                  
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">기초정보관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <tiles:insertAttribute name="content"/>
            <!-- /.row -->
            
                        <!-- /.panel-heading -->
                        
                        <!-- /.panel-body -->
                 
                    <!-- /.panel -->
                                       
                        <!-- /.panel-heading -->
                 
                                    <!-- /.table-responsive -->
                            
                                <!-- /.col-lg-4 (nested) -->
                             
                                <!-- /.col-lg-8 (nested) -->
                          
                            <!-- /.row -->
                       
                        <!-- /.panel-body -->
                
                    <!-- /.panel -->
                   
                        <!-- /.panel-heading -->
                       
                        <!-- /.panel-body -->
               
                    <!-- /.panel -->
               
                <!-- /.col-lg-8 -->
                
                            <!-- /.list-group -->
                      
                        <!-- /.panel-body -->
                  
                    <!-- /.panel -->
                  
                      <!-- /.panel-body -->
           
                    <!-- /.panel -->
                   
                        <!-- /.panel-heading -->
                        
                        <!-- /.panel-body -->
                     
                        <!-- /.panel-footer -->
                  
                    <!-- /.panel .chat-panel -->
               
                <!-- /.col-lg-4 -->
          
            <!-- /.row -->
       
        <!-- /#page-wrapper -->

    
    <!-- /#wrapper -->


    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
</div>
</div>

	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">YedamERP</a>
			</div>
		</nav>
		<tiles:insertAttribute name="menu" />
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">기초정보관리</h1>
				</div>
			</div>
			<tiles:insertAttribute name="content" />
			<!-- Metis Menu Plugin JavaScript -->
			<script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
			<!-- Custom Theme JavaScript -->
			<script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
		</div>
	</div>

</body>
</html>
