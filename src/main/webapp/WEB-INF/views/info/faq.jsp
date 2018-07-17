<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<table border="">
	<form action="?">
		<tr>
			<td colspan="5" align="center">검색 <select name="schCol">
					<option value="title">제목</option>
					<option value="pname">작성자</option>
					<option value="content">내용</option>
					<option value="cnt">조회수</option>
			</select> <input type="text" name="title" /><input type="submit" value="검색" />
			</td>
		</tr>
	</form>

	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>

	<c:forEach items="${data }" var="row" varStatus="no">
		<tr>
			<td>${total-(no.index + ((page-1)*10))}</td>
			<td><a href="detail?bid=${row.bid }">${row.title}</a></td>
			<td>${row.pid}</td>
			<td>${row.regdateStr}</td>
			<td>${row.cnt}</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="5" align="right"><a href="insertForm?kind=${kind }"><c:if
					test="${mem.id eq 'admin' }">글쓰기</c:if></a></td>
	</tr>
</table>
<c:if test="${startPage >1 }">
	<a href="${kind }?page=1">[처음]</a>
	<a href="${kind }?page=${startPage-1 }"><</a>
</c:if>

<c:forEach var="i" begin="${startPage }" end="${endPage }">
	<c:choose>
		<c:when test="${i==page }">
				[${i }]
			</c:when>
		<c:otherwise>
			<a href="${kind }?page=${i }">${i }</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${endPage<totalPage }">
	<a href="${kind }?page=${endPage+1 }">></a>
	<a href="${kind }?page=${totalPage }">[마지막]</a>
</c:if>

