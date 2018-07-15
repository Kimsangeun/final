<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../resources/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</head>

<script>

</script>


<body>
<input type="button" value="추가" onclick="location.href='insertMovieForm'">
<table border="" >

	<a href='settle?type=year&num=2018'>연간</a>
	<a href='settle?type=month&num=7'>7월</a>
	<tr>
	
	</tr>
	
	
	<tr>
		<td>결제일시</td>
		<td>ID</td>
		<td>결제금액</td>
		<td>결제방법</td>
		<td>카드/계좌번호</td>
		<td>상태</td>
		<td>계</td>
		<!-- <td>날짜</td> -->
	</tr>	
	<c:set var="yearSum" value="0"/>
	<c:set var="monthSum" value="0"/>
	<c:set var="daySum" value="0"/>
	
	<c:set var="day" value="1"	/>
	<c:set var="month" value="1"/>
	<c:forEach var="mm" items="${data }" varStatus="no">
	
	<fmt:formatDate var="nowday" pattern="dd" value="${mm.mstart}"/>
	<fmt:formatDate var="nowMonth" pattern="MM" value="${mm.mstart}"/>
	<c:if test="${no.index eq 0 }">
		<c:set var="day" value="${nowday }"	/>
		<c:set var="month" value="${nowMonth }"/>
	</c:if>
	<%-- <c:set var="nowday" value=""/> --%>
	<c:if test="${day != nowday and no.index!=0}">
	<tr bgcolor=lightgray>
		<td colspan="6">일 합계</td>
		<td>${daySum }</td>
		<c:set var="daySum" value="0"/>
		<c:set var="day" value="${nowday }"/>
	</tr>
	</c:if>
	<c:if test="${month != nowMonth and no.index!=0}">
	<tr bgcolor=yellow>
		<td colspan="6">일 합계</td>
		<td>${monthSum }</td>
		<c:set var="monthSum" value="0"/>
		<c:set var="month" value="${nowMonth }"/>
	</tr>
	</c:if>
	<tr>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mm.mstart}"/></td>
		<td>${mm.id }</td>
		<td>${mm.cost}</td>
		<td>${mm.coc }</td>
		<td>${mm.accnum }</td>
		<td>${mm.status eq 0 ? '처리' : '환불' }</td>
		<c:set var="yearSum" value="${mm.status eq 0 ? yearSum+mm.cost : yearSum}"/>
		<c:set var="monthSum" value="${mm.status eq 0 ? monthSum+mm.cost : monthSum}"/>
		<c:set var="daySum" value="${mm.status eq 0 ? daySum+mm.cost : daySum}"/>
	</tr>
	</c:forEach>
	<tr bgcolor=lightgray>
		<td colspan="6">일 합계</td>
		<td>${daySum }</td>
	</tr>
	<tr bgcolor=yellow>
		<td colspan="6">월 합계</td>
		<td>${monthSum }</td>
	</tr>
	<tr bgcolor=green>
		<td colspan="6">연 합계</td>
		<td>${yearSum }</td>
	</tr>
	


</table>
</body>
</html>