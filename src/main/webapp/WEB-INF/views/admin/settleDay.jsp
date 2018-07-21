<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<p class="h2">
	<a href='settle?type=year&num=2018'>연간</a>
</p>
<p class="h2">
	<a href='settle?type=year&num=2018'>주간</a>
</p>
<div>
	<input type="date">
</div>

<table class="table table-hover">
	<tr>
		<th>결제일시</th>
		<th>ID</th>
		<th>영화명</th>
		<th>결제금액</th>
		<th>결제방법</th>
		<th>카드/계좌번호</th>
		<th>상태</th>
		<th>계</th>
		<!-- <td>날짜</td> -->
	</tr>
	<c:set var="yearSum" value="0" />
	<c:set var="quarterSum" value="0" />
	<c:set var="monthSum" value="0" />
	<c:set var="weekSum" value="0" />
	<c:set var="daySum" value="0" />

	<c:set var="day" value="1" />
	<c:set var="week" value="1" />
	<c:set var="month" value="1" />
	<c:set var="quarter" value="1" />

	<c:forEach var="mm" items="${data }" varStatus="no">

		<fmt:formatDate var="nowWeek" pattern="W" value="${mm.mstart}" />
		<fmt:formatDate var="nowday" pattern="d" value="${mm.mstart}" />
		<fmt:formatDate var="nowMonth" pattern="M" value="${mm.mstart}" />
		<c:set var="nq" value="${nowMonth/3 + 1 }" />
		<fmt:parseNumber integerOnly="true" var="nowQuarter" value="${nq }" />

		<c:if test="${no.index eq 0 }">
			<c:set var="day" value="${nowday }" />
			<c:set var="week" value="${nowWeek }" />
			<c:set var="month" value="${nowMonth }" />
			<c:set var="quarter" value="${nowQuarter }" />
		</c:if>
		<c:if test="${day != nowday and no.index!=0}">
			<tr bgcolor=lightgray>
				<td colspan="6">${month }월${day }일 합계</td>
				<td>${daySum }</td>
				<c:set var="daySum" value="0" />
				<c:set var="day" value="${nowday }" />
			</tr>
		</c:if>
		<c:if test="${week != nowWeek and no.index!=0}">
			<tr class="warning">
				<td colspan="6">${month }월${week }주차 합계</td>
				<td>${monthSum }</td>
				<c:set var="weekSum" value="0" />
				<c:set var="week" value="${nowWeek }" />
			</tr>
		</c:if>
		<c:if test="${month != nowMonth and no.index!=0}">
			<tr bgcolor=yellow>
				<td colspan="6">${month }월합계</td>
				<td>${monthSum }</td>
				<c:set var="monthSum" value="0" />
				<c:set var="month" value="${nowMonth }" />
			</tr>
		</c:if>
		<c:if test="${quarter != nowQuarter and no.index!=0}">
			<tr bgcolor=#00FFFF>
				<td colspan="6">${quarter }분기합계</td>
				<td>${monthSum }</td>
				<c:set var="quarterSum" value="0" />
				<c:set var="quarter" value="${nowQuarter }" />
			</tr>
		</c:if>
		<tr>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mm.mstart}" /></td>
			<td>${mm.id }</td>
			<td>${mm.title}</td>
			<td>${mm.cost}</td>
			<td>${mm.coc }</td>
			<td>${mm.accnum }</td>
			<td>${mm.refund eq 0 ? '처리' : '환불' }</td>
			<c:set var="yearSum"
				value="${mm.refund eq 0 ? yearSum+mm.cost : yearSum}" />
			<c:set var="quarterSum"
				value="${mm.refund eq 0 ? quarterSum+mm.cost : quarterSum}" />
			<c:set var="monthSum"
				value="${mm.refund eq 0 ? monthSum+mm.cost : monthSum}" />
			<c:set var="weekSum"
				value="${mm.refund eq 0 ? weekSum+mm.cost : weekSum}" />
			<c:set var="daySum"
				value="${mm.refund eq 0 ? daySum+mm.cost : daySum}" />
		</tr>
	</c:forEach>
	<tr bgcolor=lightgray>
		<td colspan="6">${month }월${day }일 합계</td>
		<td>${daySum }</td>
	</tr>
	<tr class="bg-danger">
		<td colspan="6">${month }월${week }주차 합계</td>
		<td>${monthSum }</td>
		<c:set var="weekSum" value="0" />
		<c:set var="week" value="${nowWeek }" />
	</tr>
	<tr class="bg-success">
		<td colspan="6">${month }월합계</td>
		<td>${monthSum }</td>
	</tr>
	<tr class="bg-info">
		<td colspan="6">${quarter }분기합계</td>
		<td>${quarterSum }</td>
		<c:set var="quarterSum" value="0" />
		<c:set var="quarter" value="${nowQuarter }" />
	</tr>
	<tr class="bg-primary">
		<td colspan="6">연 합계</td>
		<td>${yearSum }</td>
	</tr>


</table>
