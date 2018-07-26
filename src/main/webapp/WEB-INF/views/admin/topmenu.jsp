<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- info -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${ mem.id eq 'admin' }">
	<li class="dropdown"><a href="#" class="dropdown-toggle"
		data-toggle="dropdown" role="button" aria-expanded="false">관리자 <span
			class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="/proj/admin/time">상영시간표</a></li>
			<li><a href="/proj/admin/movie">영화</a></li>
			<li><a href="/proj/admin/member">회원</a></li>
			<li><a href="/proj/admin/resv">예약</a></li>
			<li><a href="/proj/admin/sales">매출</a></li>
			<li><a href="/proj/admin/settle">정산</a></li>
			<li><a href="/proj/admin/promotion">홍보</a></li>
			<li class="divider"></li>
			<li><a href="/proj/logOut">로그아웃</a></li>
		</ul></li>
</c:if>