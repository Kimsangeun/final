<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>




  $( function() {
	    var dateFormat = "mm/dd/yyyy",
	      from = $( "#from" )
	        .datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          maxDate:new Date(),
		      /*   showOn: "button",
		        buttonImage: "../resources/imgs/calendar2.png",
		        buttonImageOnly: true,
		        buttonText: "Select date" */
	          /* numberOfMonths: 3 */
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#to" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        maxDate:new Date(),
	     /*  showOn: "button", */
	      /* 
	      buttonImage: "../resources/imgs/calendar2.png",
	      buttonImageOnly: true,
	      buttonText: "Select date" */
	        /* numberOfMonths: 3 */
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );
	      });
	 
	    $(".ui-datepicker-trigger").css("margin-bottom","-6px");
	    function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	    }
	  } );

  </script>
  
  <style>
  .ui-datepicker-trigger { 
  position: relative; left: -29px; top: 2px; 
  widht:50px
  }
  </style>

 <div style="margin-top: 50px">
	<form action="?">
	<p>
	조회기간: <input type="text" id="from" name="start" value="${param.start }"> ~ 
	<input type="text" id="to" name="end" value="${param.end }">
	<button class="btn btn-primary" onclick="submit()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
	</p>
	<!-- <ul class="dropdown-menu" role="menu">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li class="divider"></li>
    <li><a href="#">Separated link</a></li>
  	</ul> -->
	</form>
	
</div>

<table class="table table-hover">

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
	

	<c:forEach var="mm" items="${data }" varStatus="no">

		<tr class="${mm.refund eq 0 ? 'primary' : 'danger'  }">
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mm.mstart}" /></td>
			<td>${mm.id }</td>
			<td>${mm.title}</td>
			<td>${mm.coc }</td>
			<td>${mm.accnum }</td>
			<td>${mm.refund eq 0 ? '처리' : '환불' }</td>
			<td>${mm.cost}</td>
			<c:set var="sum" value="${sum+mm.cost}"/>
			<c:set var="noCost" value="${mm.refund eq 0 ? noCost:noCost+mm.cost}"/>
			
		</tr>
	</c:forEach>
	<tr>
	<td colspan="6">썸</td>
	<td>${sum}</td>
	</tr>
	<tr>
	<td colspan="6">환불금액</td>
	<td>${noCost}</td>
	</tr>
	<tr>
	<td colspan="6">합계</td>
	<td>${sum-noCost }</td>
	</tr>




</table>
