<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">

</script>
<div>
	<h2>결제정보</h2>
</div>
<hr>

<div>
	<!-- 	<div style="width: 300px; float: left; border: 5px"> -->
	<table class="table table-hover" align="center" style="width: 60%;">
		<tr>
			<td><b>예매번호</b></td>
			<td>${rvo.rId }</td>
		</tr>
		<tr>
			<td><b>영화제목</b></td>
			<td>${svo.movtitle }</td>
		</tr>
		<tr>
			<td><b>시작시간</b></td>
			<td>${svo.mdate }&nbsp;${svo.mtime }시</td>
		</tr>
		<tr>
			<td><b>예약자</b></td>
			<td>${mem.id }님</td>
		</tr>
		<tr>
			<td><b>인원수</b></td>
			<td>${rvo.cnt }명</td>
		</tr>
		<tr>
			<td><b>관</b></td>
			<td>${svo.scNum}관</td>
		</tr>
		<tr>
			<td><b>좌석</b></td>
			<td>${rvo.seatNum }</td>
		</tr>
		<tr>
			<td><b>가격</b></td>
			<td>${rvo.cost }(<c:if test="${param.paytype eq 'csh' }">
				현금결제
				</c:if> <c:if test="${param.paytype eq 'crd' }">
				카드결제_${param.cardchk }
				</c:if> )
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button"
				class="btn btn-primary btn-lg" onclick="location.href='/proj'"
				value="확인" /></td>
		</tr>
	</table>
	<!-- 	</div> -->
</div>
