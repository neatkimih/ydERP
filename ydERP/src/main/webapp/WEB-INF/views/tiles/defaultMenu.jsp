<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
				</div> <!-- /input-group -->
			</li>
			<li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
					기초정보관리<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="getItemsList">품목정보</a></li>
					<li><a href="morris.html">구매처정보</a></li>
					<li><a href="morris.html">판매처정보</a></li>
				</ul></li>
			<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 구매정보<span
					class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="getPurchasesPage">구매정보조회</a></li>
					<li><a href="morris.html">구매상세정보조회</a></li>
				</ul> <!-- /.nav-second-level --></li>
			<li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
					판매정보<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="getSaleList">판매내역 조회 / 수정</a></li>
					<li><a href="insertSale">판매내역 등록</a></li>
					<li><a href="deleteSale">판매내역 삭제</a></li>
					<li><a href="showSale">판매현황 조회</a></li>
				</ul></li>
			<li><a href="#"><i class="fa fa-wrench fa-fw"></i> 재고정보<span
					class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="getStockOnhandList">재고조회</a></li>
					<li><a href="getStockOnhandList2">재고조회2</a></li>
					<li><a href="getStockInOutList">입/출고조회</a></li>
					<li><a href="getStockInOutList">구매요청생성</a></li>
					<li><a href="getStockInOutListTest">입/출고Test</a></li>
				</ul></li>


		</ul>
	</div>
</div>