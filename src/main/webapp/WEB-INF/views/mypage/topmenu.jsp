<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${ mem.id !=null && !(mem.id eq 'admin')}">
	<li class="dropdown"><a href="#" class="dropdown-toggle"
		data-toggle="dropdown" role="button" aria-expanded="false">마이페이지<span
			class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="/proj/mypage/memInfo">회원정보</a></li>
			<li><a href="/proj/mypage/reser">예매내역</a></li>
			<li><a href="/proj/info/qna">1:1문의</a></li>
			
		</ul></li>
</c:if>

