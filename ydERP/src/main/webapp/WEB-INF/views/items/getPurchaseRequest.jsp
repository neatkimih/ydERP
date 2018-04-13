<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/jquery/date_calendar.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/daumaddr/daumAddr.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>
	
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>
<!-- <script>
$(function(){
    $( "#autocomplete" ).autocomplete({
        source : function( request, response ) {
             $.ajax({
                    type: 'post',
                    url: "/autocomplete.jsp",
                    dataType: "json",
                    //request.term = $("#autocomplete").val()
                    data: { value : request.term },
                    success: function(data) {
                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                        response(
                            $.map(data, function(item) {
                                return {
                                    label: item.data,
                                    value: item.data
                                }
                            })
                        );
                    }
               });
            },
        //조회를 위한 최소글자수
        minLength: 2,
        select: function( event, ui ) {
            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
        }
    });
})

</script> -->
<script>
	$(function() {$("#hopeDate").val(moment(sysdate, 'YYYYMMDD').format("YYYY-MM-DD HH:mm"));});
</script>	


<div class="page-header">
				<h1>
					구매 신청
				</h1>
			</div>
<div class="col-md-6">
	<form class="form-horizontal" id="purchaseRequestForm">
		<div class="form-group">
			<label for="expressCategory" class="col-md-3 control-label">품목종류</label>
			<div class="col-md-9">
				
				<input type="text" id="itemsList"/>
			</div>
		</div>
		<div class="form-group">
			<label for="hopeDate" class="col-md-3 control-label">희망 배송 날짜</label>
			<div class="col-md-9">
				<input type="text" class="form-control" id="hopeDate"
					name="hopeDate">

				<script>
					$("#hopeDate").datetimepicker({
						locale : 'ko',
						format : 'YYYY-MM-DD HH:mm',
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
			<label for="departureSize" class="col-md-3 control-label">UOM</label>
			<div class="col-md-3">
				<input class="form-control" type="text" id="DepartureSize"
					name="DepartureSize"/>
			</div>
			<label for="departureQty" class="col-md-2 control-label">수량</label>
			<div class="col-md-4">

				<input class="form-control" type="number" id="DepartureQty"
					name="DepartureQty"/>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="Departure" class="col-md-3 control-label">출발지</label>
			<div class="col-md-9">
				<input type="text" class="form-control" id="Departure"
					style="cursor: pointer;" onclick="addrDialog(this)"
					placeholder="출발지" name="DepartureAddr1" readonly>
			</div>
		</div>

		<div class="form-group">
			<label for="Arrive" class="col-md-3 control-label">도착지</label>
			<div class="col-md-9">
				<input class="form-control" type="text" id="Arrive"
					name="ArriveAddr1" style="cursor: pointer;"
					onclick="addrDialog(this)" placeholder="도착지" readonly>
			</div>
		</div>
		
	
			<div class="col-md-2">
				<input class="btn btn-default" type="text" value="판매가"
					onclick="priceCalc()">
			</div>
			
			<div class="col-md-2">
				<input class="btn btn-default" type="text" value="총 금액"
					onclick="priceCalc()">
			</div>
			</form>
		</div>

		
		



