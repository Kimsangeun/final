<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">

</script>

<div>
	<div style="width: 300px; float: left; border: 5px">
		<table>
			<tr>
				<td>예매번호</td>
				<td>${rvo.rId }</td>
			</tr>
			<tr>
				<td>영화제목</td>
				<td>${svo.movtitle }</td>
			</tr>
			<tr>
				<td>시작시간</td>
				<td>${svo.mdate }일 ${svo.mtime }시</td>
			</tr>
			<tr>
				<td>예약자</td>
				<td>${mem.id } 님</td>
			</tr>
			<tr>
				<td>인원수</td>
				<td>${rvo.cnt }명</td>
			</tr>
			<tr>
				<td>관</td>
				<td>${svo.scNum}관</td>
			</tr>
			<tr>
				<td>좌석</td>
				<td>${rvo.seatNum }석</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>${rvo.cnt*3000 }(<c:if test="${param.paytype eq 'csh' }">
				현금결제
				</c:if> <c:if test="${param.paytype eq 'crd' }">
				카드결제_${param.cardchk }
				</c:if> )
				</td>
			</tr>
		</table>
		<br> <br> <input type="button"
			onclick="location.href='/proj'" value="확인" />
	</div>
</div>
