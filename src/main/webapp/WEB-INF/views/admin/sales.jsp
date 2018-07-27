<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		var dateFormat = "MM-dd-yy", from = $("#from").datepicker({
			/* 	          defaultDate: "+1w", */
			changeYear : true,
			maxDate : new Date(),
		}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
			to.datepicker("option", "maxDate", new Date());
		}), to = $("#to").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			maxDate : new Date(),
		}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});

		$(".ui-datepicker-trigger").css("margin-bottom", "-6px");
		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
			} catch (error) {
				date = null;
			}

			return date;
		}
	});
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".monthPicker")
								.datepicker(
										{
											dateFormat : 'yy-MM-dd',
											changeMonth : true,
											changeYear : true,
											showButtonPanel : true,
											monthNames : [ "1월", "2월", "3월",
													"4월", "5월", "6월", "7월",
													"8월", "9월", "10월", "11월",
													"12월" ],
											monthNamesShort : [ "1", "2", "3",
													"4", "5", "6", "7", "8",
													"9", "10", "11", "12" ],

											onClose : function(dateText, inst) {
												var month = $(
														"#ui-datepicker-div .ui-datepicker-month :selected")
														.val();
												var year = $(
														"#ui-datepicker-div .ui-datepicker-year :selected")
														.val();
												$(this)
														.val(
																$.datepicker
																		.formatDate(
																				'yy-MM',
																				new Date(
																						year,
																						month,
																						1)));
											}
										});

						$(".monthPicker").focus(function() {
							$(".ui-datepicker-calendar").hide();
							$("#ui-datepicker-div").position({
								my : "center top",
								at : "center bottom",
								of : $(this)
							});
						});
					});

	$(function() {
		$('.date-picker-year')
				.datepicker(
						{
							changeYear : true,
							showButtonPanel : true,
							dateFormat : 'yy',
							onClose : function(dateText, inst) {
								var year = $(
										"#ui-datepicker-div .ui-datepicker-year :selected")
										.val();
								$(this)
										.datepicker('setDate',
												new Date(year, 1));
							}
						});
		$(".date-picker-year").focus(function() {
			$(".ui-datepicker-calendar").hide();
			$(".ui-datepicker-month").hide();
		});
	});
</script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document).ready(
		function() {
		/* $("#goday").click(
			function() {
			google.charts.load('current', {'packages' : [ 'bar' ]});
			google.charts.setOnLoadCallback(drawChart);
			function drawChart() {
				var godata = $("#fom1").serialize();
				console.log('고데이타다'+godata);
				$.ajax({
					async : false,
					type : 'POST',
					data : godata,
					url : "/proj/ajax/sales",
					success : function(data) {
						if(data==null){
							alert('기록이없어용');
						}else{
							var data4 = new google.visualization.DataTable();
							data4.addColumn('string','DAY');
							data4.addColumn('number','합계');
							//console.log(data[0]['SUM']);
							var myArray = new Array(data.length);
							for (var i = 0; i < data.length; i++) {
								myArray[i] = new Array(2);
								myArray[i][1] = data[i]['SUM'];
								myArray[i][0] = data[i]['DAY'];
								console.log(myArray[i]);
								}
							console.log(myArray);
							data4.addRows(myArray);
							console.log(data4);
							var options = {
									chart : {
										title : '시네마중앙 일별 매출',
										subtitle : 'Sales, Expenses, and Profit: 2014-2017',
										}
										};

							var chart = new google.charts.Bar(
									document.getElementById('columnchart_material_day'));
							chart.draw(	data4,google.charts.Bar.convertOptions(options));
						}
						
						},
						error : function(error) {
							alert("error : "+ error);
						}
						});
				}
			}); */
		
////////////////////////////////연도별///////////////////////////
		
		$(".goChart").click(
				function() {
					var godata = $("#form_"+$(this).prop('title')).serialize();
					var id = "columnchart_material_"+$(this).prop('title');
					var type = $(this).prop('title');
				google.charts.load('current', {'packages' : [ 'bar' ]});
				google.charts.setOnLoadCallback(drawChart);
				function drawChart() {
					//var godata = $("#form_"+$(this).prop('title')).serialize();
					console.log('고데이타다'+godata);
					$.ajax({
						async : false,
						type : 'POST',
						data : godata,
						url : "/proj/ajax/sales",
						success : function(data) {
							if(data==null){
								alert('기록이없어용');
							}else{
								var data4 = new google.visualization.DataTable();
								data4.addColumn('string',type);
								data4.addColumn('number','합계');
								//console.log(data[0]['SUM']);
								var myArray = new Array(data.length);
								for (var i = 0; i < data.length; i++) {
									myArray[i] = new Array(2);
									myArray[i][1] = data[i]['SUM'];
									myArray[i][0] = data[i]['DAY'];
									console.log(myArray[i]);
									}
								console.log(myArray);
								data4.addRows(myArray);
								console.log(data4);
								var options = {
										chart : {
											format: 'decimal',
											title : '시네마중앙  매출',
											subtitle : 'Sales',
											}
											};
								
								var chart = new google.charts.Bar(
										document.getElementById(id));
								chart.draw(	data4,google.charts.Bar.convertOptions(options));
							}
							
							},
							error : function(error) {
								alert("error : "+ error);
							}
							});
					} 
				});

						
						
});
</script>

<style>
.ui-datepicker-trigger {
	position: relative;
	left: -29px;
	top: 2px;
	widht: 50px
}
</style>




<div style="margin-top: 50px">
	<h2>정산</h2>
</div>
<hr>


<ul class="nav nav-tabs" role="tablist" id="myTab">
	<li role="presentation" class="active"><a href="#year"
		aria-controls="year" role="tab" data-toggle="tab">연 매출</a></li>
	<li role="presentation"><a href="#month" aria-controls="month"
		role="tab" data-toggle="tab">월 매출</a></li>
	<li role="presentation"><a href="#day" aria-controls="day"
		role="tab" data-toggle="tab">일 매출</a></li>
	<li role="presentation"><a href="#settings"
		aria-controls="settings" role="tab" data-toggle="tab">암것도아님</a></li>
</ul>

<div class="tab-content">
	<div role="tabpanel" class="tab-pane in active fade" id="year">
		<div id="columnchart_material_year" style="width: 100%; height: 500px;"></div>
		<form id="form_year">
			<input type="hidden" name="type" value="year">
			<input type="hidden" name="select" value="2018-05">
			<div class="form-group pull-right">
				<label for="movieSelect_year">영화별 보기</label> <select name="mid"
					id="movieSelect_year" class="selectpicker" data-live-search="true">
					<option value="0">전체</option>
					<c:forEach items="${data['movie'] }" var="mm">
						<option value="${mm.mid }">${ mm.title}</option>
					</c:forEach>
				</select>
				<button class="btn btn-primary goChart" title="year" id="goyear" type="button">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</div>

		</form>
	</div>
	<div role="tabpanel" class="tab-pane fade" id="month">
		<div id="columnchart_material_month" style="width: 100%; height: 500px;"></div>
		<form id="form_month">
			<input type="hidden" name="type" value="month">
			<input type="hidden" name="select" value="2018">
			<div class="form-group pull-right">
				<label for="movieSelect_month">영화별 보기</label> <select name="mid"
					id="movieSelect_month" class="selectpicker" data-live-search="true">
					<option value="0">전체</option>
					<c:forEach items="${data['movie'] }" var="mm">
						<option value="${mm.mid }">${ mm.title}</option>
					</c:forEach>
				</select>
				<button class="btn btn-primary goChart" title="month" id="gomonth" type="button">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</div>
		</form>
	</div>
	<div role="tabpanel" class="tab-pane fade" id="day">
	<div id="columnchart_material_day" style="width: 100%; height: 500px;"></div>
		<form id="form_day">
			<input type="hidden" name="type" value="day">
			<input type="hidden" name="select" value="2018-05">
			<div class="form-group pull-right">
				<label for="movieSelect_day">영화별 보기</label> <select name="mid"
					id="movieSelect_day" class="selectpicker" data-live-search="true">
					<option value="0">전체</option>
					<c:forEach items="${data['movie'] }" var="mm">
						<option value="${mm.mid }">${ mm.title}</option>
					</c:forEach>
				</select>
				<button class="btn btn-primary goChart" title="day" id="goday" type="button">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</div>

		</form>
	</div>
</div>

<script>
	$(function() {
		$('#myTab a:last').tab('show');
	})
</script>

<%-- 
  <input name="startYear" id="startYear" class="date-picker-year" />   
    <input type="text" id="month" name="month" class="monthPicker" />
 	<div style="margin-top: 50px" class="row">
	<form action="#" class="form-inline" method="POST">
	<div class="form-group">
	<label for="from">조회기간</label> 
	<input type="text" id="from" name="from" value="${param.from }" required="required"> ~ 
	<input type="text" id="to" name="to" value="${param.to }" required="required">
	
	</div> 
	<div class="form-group">
	 <label for="movieSelect">영화별 보기</label>
	 <select name="mid" id="movieSelect" class="selectpicker" data-live-search="true"> 
	 <option value="0">전체</option> 
	 <c:forEach items="${data['movie'] }" var="mm">
	 <option value="${mm.mid }">${ mm.title}</option> 
	 </c:forEach>
	 </select>
	</div> 
	<button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
	</form>
	
</div>


<table style="overflow:scroll; " class="table table-hover">

	<tr>
		<th>결제일시</th>
		<th>ID</th>
		<th>영화명</th>
		<th>결제방법</th>
		<th>카드/계좌번호</th>
		<th>상태</th>
		<th>결제금액</th>
	</tr>

	<c:set var="sum" value="0"/>
	<c:set var="noCost" value="0"/>
	

	<c:forEach var="mm" items="${data['settle'] }" varStatus="no">

		<tr class="${mm.refund eq 0 ? 'primary' : 'danger'  }">
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mm.mstart}" /></td>
			<td>${mm.id }</td>
			<td>${mm.title}</td>
			<td>${mm.coc }</td>
			<td>${mm.accnum }</td>
			<td>${mm.refund eq 0 ? '처리' : '환불' }</td>
			<td><fmt:formatNumber value="${mm.cost}" type="currency" currencySymbol="￦"/></td>
			<c:set var="sum" value="${sum+mm.cost}"/>
			<c:set var="noCost" value="${mm.refund eq 0 ? noCost:noCost+mm.cost}"/>
			
		</tr>
	</c:forEach>
	<tr>
	<td colspan="6">판매금액</td>
	<td><fmt:formatNumber value="${sum}" type="currency" currencySymbol="￦"/></td>
	</tr>
	<tr>
	<td colspan="6">환불금액</td>
	<td><fmt:formatNumber value="${noCost}" type="currency" currencySymbol="￦"/></td>
	</tr>
	<tr>
	<td colspan="6">합계</td>
	<td><fmt:formatNumber value="${sum-noCost }" type="currency" currencySymbol="￦"/>
</td>
	</tr>

<fmt:formatNumber value="${mm.cost}" type="currency" currencySymbol="￦"/>



</table>
 --%>