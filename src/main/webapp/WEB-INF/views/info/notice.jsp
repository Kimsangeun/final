<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<h2>공지사항</h2>
</div>
<hr>

<table class="table table-hover" align="center" style="width:60%;">
	<form action="?">
		<tr>
			<td colspan="5" align="center"> <select name="schCol">
					<option value="title">제목</option>
					<option value="pid">작성자</option>
					<option value="content">내용</option>
					<option value="cnt">조회수</option>
			</select> <input type="text" name="title" /><input type="submit" value="검색" />
			</td>
		</tr>
	</form>
	<tr>
		<td width="50px"><b>번호</b></td>
		<td><b>제목</b></td>
		<td><b>작성자</b></td>
		<td><b>작성일</b></td>
		<td width="70px"><b>조회수</b></td>
	</tr>

	<c:forEach items="${data }" var="row" varStatus="no">
		<tr>
			<td>${total-(no.index + ((page-1)*7))}</td>
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
<div align="center">
	<c:if test="${startPage >1 }">
		<a href="${kind }?page=1&schCol=${param.schCol }&title=${param.title}"">[처음]</a>
		<a
			href="${kind }?page=${startPage-1 }&schCol=${param.schCol }&title=${param.title}""><</a>
	</c:if>

	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${i==page }">
				[${i }]
			</c:when>
			<c:otherwise>
				<a href="${kind }?page=${i }&schCol=${param.schCol }&title=${param.title}">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPage<totalPage }">
		<a
			href="${kind }?page=${endPage+1 }&schCol=${param.schCol }&title=${param.title}">></a>
		<a
			href="${kind }?page=${totalPage }&schCol=${param.schCol }&title=${param.title}">[마지막]</a>
	</c:if>
</div>
